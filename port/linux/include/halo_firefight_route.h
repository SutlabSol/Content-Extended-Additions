/*
HALO_FIREFIGHT_ROUTE.H

A dropship's flight route, placed in Forge as Firefight markers of their own
type. The spawner flies it and Forge previews it, both through this curve, so
the line drawn in Forge is the line flown.

A route has two legs, the approach (points, then the hover) and the departure
(the hover, then points). A marker's usage (netgame flag team_index) holds:

	bits 0-3    spawn type: FF_ROUTE_SPAWN_TYPE on a route's point
	bits 4-7    a point's order in its leg (a zone's rounds)
	bit  8      a point's leg (a zone's waves)
	bits 11-14  route id, on the point and on the dropship zone it belongs to:
	            0 on a zone means it has none, and flies the automatic path

Bit 15 stays clear, as a usage below 0 means a default elsewhere.
*/

#ifndef HALO_FIREFIGHT_ROUTE_H
#define HALO_FIREFIGHT_ROUTE_H

#include <math.h>

enum
{
	FF_ROUTE_SPAWN_TYPE = 7,
	FF_ROUTE_MAX_ID = 15,
	FF_ROUTE_MAX_LEG_POINTS = 16,
	FF_ROUTE_APPROACH = 0,
	FF_ROUTE_DEPARTURE = 1,
	FF_ROUTE_LEG_COUNT = 2,
	FF_ROUTE_STEPS_PER_SEGMENT = 8
};

/* (world units, from the zone) */
#define FF_ROUTE_HOVER_HEIGHT 3.5f
#define FF_ROUTE_START_BEHIND 35.0f
#define FF_ROUTE_START_HEIGHT 16.0f
#define FF_ROUTE_EXIT_AHEAD 45.0f
#define FF_ROUTE_EXIT_HEIGHT 22.0f

#define FF_ROUTE_ID(usage) ((((int)(usage)) >> 11) & 0x0F)
#define FF_ROUTE_WITH_ID(usage, id) \
	((short)((((int)(usage)) & 0x07FF) | ((((int)(id)) & 0x0F) << 11)))
#define FF_ROUTE_POINT_ORDER(usage) ((((int)(usage)) >> 4) & 0x0F)
#define FF_ROUTE_POINT_LEG(usage) ((((int)(usage)) >> 8) & 0x01)
#define FF_ROUTE_POINT_USAGE(id, leg, order) \
	((short)(FF_ROUTE_SPAWN_TYPE | ((((int)(order)) & 0x0F) << 4) | \
		((((int)(leg)) & 0x01) << 8) | ((((int)(id)) & 0x0F) << 11)))

struct ff_route_point
{
	float x, y, z;
};

struct ff_route_leg
{
	/* (the hover takes the extra place) */
	struct ff_route_point points[FF_ROUTE_MAX_LEG_POINTS + 1];
	signed char orders[FF_ROUTE_MAX_LEG_POINTS + 1];
	int count;
	float distances[FF_ROUTE_MAX_LEG_POINTS * FF_ROUTE_STEPS_PER_SEGMENT + 1];
	float length;
};

/* where a leg with no points of its own starts or ends: the automatic path */
static inline struct ff_route_point ff_route_default_point(
	float zone_x, float zone_y, float zone_z, float facing, int leg)
{
	struct ff_route_point point;
	float along = cosf(facing);
	float across = sinf(facing);

	if (leg == FF_ROUTE_APPROACH)
	{
		point.x = zone_x - along * FF_ROUTE_START_BEHIND;
		point.y = zone_y - across * FF_ROUTE_START_BEHIND;
		point.z = zone_z + FF_ROUTE_START_HEIGHT;
	}
	else
	{
		point.x = zone_x + along * FF_ROUTE_EXIT_AHEAD;
		point.y = zone_y + across * FF_ROUTE_EXIT_AHEAD;
		point.z = zone_z + FF_ROUTE_EXIT_HEIGHT;
	}
	return point;
}

/* points arrive in any order: kept sorted, the same order first come first */
static inline void ff_route_leg_add(struct ff_route_leg *leg, int order, float x, float y, float z)
{
	int slot;

	if (leg->count >= FF_ROUTE_MAX_LEG_POINTS)
		return;
	for (slot = leg->count; slot > 0 && leg->orders[slot - 1] > order; slot--)
	{
		leg->points[slot] = leg->points[slot - 1];
		leg->orders[slot] = leg->orders[slot - 1];
	}
	leg->points[slot].x = x;
	leg->points[slot].y = y;
	leg->points[slot].z = z;
	leg->orders[slot] = (signed char)order;
	leg->count++;
}

static inline float ff_route_distance(struct ff_route_point const *a, struct ff_route_point const *b)
{
	float dx = b->x - a->x;
	float dy = b->y - a->y;
	float dz = b->z - a->z;

	return sqrtf(dx * dx + dy * dy + dz * dz);
}

/* segment's curve at u (0-1): a Catmull-Rom whose tangents follow the point
spacing, so one point far off the others doesn't throw a loop into the line */
static inline struct ff_route_point ff_route_curve(struct ff_route_leg const *leg, int segment, float u)
{
	struct ff_route_point const *p0 = &leg->points[segment > 0 ? segment - 1 : 0];
	struct ff_route_point const *p1 = &leg->points[segment];
	struct ff_route_point const *p2 = &leg->points[segment + 1];
	struct ff_route_point const *p3 = &leg->points[segment + 2 < leg->count ? segment + 2 : segment + 1];
	float d1 = ff_route_distance(p0, p1);
	float d2 = ff_route_distance(p1, p2);
	float d3 = ff_route_distance(p2, p3);
	float scale1 = (d1 + d2) > 0.0001f ? d2 / (d1 + d2) : 0.0f;
	float scale2 = (d2 + d3) > 0.0001f ? d2 / (d2 + d3) : 0.0f;
	float u2 = u * u;
	float u3 = u2 * u;
	float h1 = 2.0f * u3 - 3.0f * u2 + 1.0f;
	float h2 = -2.0f * u3 + 3.0f * u2;
	float t1 = (u3 - 2.0f * u2 + u) * scale1;
	float t2 = (u3 - u2) * scale2;
	struct ff_route_point point;

	point.x = h1 * p1->x + h2 * p2->x + t1 * (p2->x - p0->x) + t2 * (p3->x - p1->x);
	point.y = h1 * p1->y + h2 * p2->y + t1 * (p2->y - p0->y) + t2 * (p3->y - p1->y);
	point.z = h1 * p1->z + h2 * p2->z + t1 * (p2->z - p0->z) + t2 * (p3->z - p1->z);
	return point;
}

static inline void ff_route_leg_measure(struct ff_route_leg *leg)
{
	struct ff_route_point previous = leg->points[0];
	float total = 0.0f;
	int segment, step;

	leg->distances[0] = 0.0f;
	for (segment = 0; segment + 1 < leg->count; segment++)
	{
		for (step = 1; step <= FF_ROUTE_STEPS_PER_SEGMENT; step++)
		{
			struct ff_route_point point =
				ff_route_curve(leg, segment, (float)step / (float)FF_ROUTE_STEPS_PER_SEGMENT);

			total += ff_route_distance(&previous, &point);
			leg->distances[segment * FF_ROUTE_STEPS_PER_SEGMENT + step] = total;
			previous = point;
		}
	}
	leg->length = total;
}

/* closes the two legs on the hover, a leg without points taking the automatic
path's end, and measures them */
static inline void ff_route_legs_finish(
	struct ff_route_leg *legs, float zone_x, float zone_y, float zone_z, float facing)
{
	struct ff_route_point hover;
	struct ff_route_leg *approach = &legs[FF_ROUTE_APPROACH];
	struct ff_route_leg *departure = &legs[FF_ROUTE_DEPARTURE];
	int slot;

	hover.x = zone_x;
	hover.y = zone_y;
	hover.z = zone_z + FF_ROUTE_HOVER_HEIGHT;

	if (approach->count == 0)
	{
		approach->points[0] = ff_route_default_point(zone_x, zone_y, zone_z, facing, FF_ROUTE_APPROACH);
		approach->count = 1;
	}
	approach->points[approach->count++] = hover;

	if (departure->count == 0)
	{
		departure->points[0] = ff_route_default_point(zone_x, zone_y, zone_z, facing, FF_ROUTE_DEPARTURE);
		departure->count = 1;
	}
	for (slot = departure->count; slot > 0; slot--)
		departure->points[slot] = departure->points[slot - 1];
	departure->points[0] = hover;
	departure->count++;

	ff_route_leg_measure(approach);
	ff_route_leg_measure(departure);
}

/* the point this far along the leg, at an even speed however the points lie */
static inline struct ff_route_point ff_route_leg_at(struct ff_route_leg const *leg, float travelled)
{
	int last = (leg->count - 1) * FF_ROUTE_STEPS_PER_SEGMENT;
	int low = 0;
	int high = last;
	float span, part;

	if (leg->count < 2 || travelled <= 0.0f)
		return leg->points[0];
	if (travelled >= leg->length)
		return leg->points[leg->count - 1];

	while (high - low > 1)
	{
		int middle = (low + high) / 2;

		if (leg->distances[middle] <= travelled)
			low = middle;
		else
			high = middle;
	}
	span = leg->distances[high] - leg->distances[low];
	part = span > 0.0001f ? (travelled - leg->distances[low]) / span : 0.0f;
	return ff_route_curve(
		leg,
		low / FF_ROUTE_STEPS_PER_SEGMENT,
		((float)(low % FF_ROUTE_STEPS_PER_SEGMENT) + part) / (float)FF_ROUTE_STEPS_PER_SEGMENT);
}

#endif /* HALO_FIREFIGHT_ROUTE_H */
