/*
SERVICE_RANK.C

Compartmentalised MCC Service Rank / Career Leveling System (11 Tours x 30 Ranks = 330 Levels).
Kept in its own standalone file so it can be toggled or removed independently.
*/

#include "cseries/cseries.h"
#include "game/game.h"
#include "game/players.h"
#include "interface/hud_messaging.h"

#include "service_rank.h"

#include <stdio.h>
#include <string.h>

#if OPENCE_ENABLE_SERVICE_RANK

static char const *const s_mcc_tour_names[11] =
{
	"Tour 1 (Tier 11)",
	"Tour 2 (Tier 10)",
	"Tour 3 (Tier 9)",
	"Tour 4 (Tier 8)",
	"Tour 5 (Tier 7)",
	"Tour 6 (Tier 6)",
	"Tour 7 (Tier 5)",
	"Tour 8 (Tier 4)",
	"Tour 9 (Tier 3)",
	"Tour 10 (Tier 2)",
	"Tour 11 (Tier 1)"
};

static char const *const s_mcc_rank_names[30] =
{
	"Rookie",
	"Recruit",
	"Private",
	"Private Second Class",
	"Private First Class",
	"Lance Corporal",
	"Corporal",
	"Sergeant",
	"Sergeant Second Class",
	"Sergeant First Class",
	"Staff Sergeant",
	"Gunnery Sergeant",
	"First Sergeant",
	"Sergeant Major",
	"Command Sergeant Major",
	"Warrant Officer",
	"Warrant Officer Third Class",
	"Warrant Officer Second Class",
	"Warrant Officer First Class",
	"Chief Warrant Officer",
	"Second Lieutenant",
	"First Lieutenant",
	"Captain",
	"Major",
	"Lieutenant Colonel",
	"Colonel",
	"Brigadier General",
	"Major General",
	"Lieutenant General",
	"General"
};

static const long s_mcc_tour_rank_xp[11][30] =
{
	/* Tour 1 (Ranks 1-30): 3,000 - 160,000 | Total: 1,945,000 */
	{ 3000L, 4000L, 6000L, 8000L, 11000L, 14000L, 17000L, 21000L, 26000L, 30000L, 35000L, 40000L, 46000L, 52000L, 58000L, 64000L, 71000L, 78000L, 85000L, 92000L, 100000L, 106000L, 111000L, 117000L, 123000L, 129000L, 136000L, 144000L, 152000L, 160000L },
	/* Tour 2 (Ranks 31-60): 20,000 - 220,000 | Total: 2,951,000 */
	{ 20000L, 21000L, 23000L, 26000L, 29000L, 33000L, 37000L, 42000L, 47000L, 53000L, 59000L, 66000L, 73000L, 80000L, 88000L, 96000L, 104000L, 113000L, 122000L, 132000L, 141000L, 151000L, 160000L, 168000L, 176000L, 184000L, 193000L, 202000L, 211000L, 220000L },
	/* Tour 3 (Ranks 61-90): 40,000 - 400,000 | Total: 4,775,000 */
	{ 40000L, 41000L, 43000L, 46000L, 50000L, 55000L, 62000L, 69000L, 77000L, 86000L, 96000L, 107000L, 118000L, 131000L, 144000L, 158000L, 173000L, 189000L, 206000L, 223000L, 241000L, 260000L, 280000L, 300000L, 321000L, 339000L, 354000L, 369000L, 384000L, 400000L },
	/* Tour 4 (Ranks 91-120): 66,000 - 700,000 | Total: 7,903,000 */
	{ 66000L, 67000L, 70000L, 74000L, 80000L, 88000L, 98000L, 109000L, 122000L, 137000L, 153000L, 171000L, 191000L, 212000L, 235000L, 260000L, 287000L, 315000L, 345000L, 377000L, 410000L, 445000L, 482000L, 521000L, 561000L, 594000L, 620000L, 646000L, 673000L, 700000L },
	/* Tour 5 (Ranks 121-150): 110,000 - 1,300,000 | Total: 13,650,000 */
	{ 110000L, 111000L, 115000L, 122000L, 132000L, 146000L, 162000L, 181000L, 204000L, 230000L, 260000L, 293000L, 330000L, 370000L, 415000L, 463000L, 515000L, 571000L, 631000L, 695000L, 763000L, 836000L, 912000L, 993000L, 1044000L, 1094000L, 1144000L, 1195000L, 1247000L, 1300000L },
	/* Tour 6 (Ranks 151-180): 180,000 - 2,100,000 | Total: 22,000,000 */
	{ 180000L, 182000L, 188000L, 199000L, 216000L, 238000L, 264000L, 296000L, 333000L, 376000L, 424000L, 477000L, 537000L, 602000L, 674000L, 751000L, 835000L, 924000L, 1020000L, 1123000L, 1232000L, 1347000L, 1469000L, 1598000L, 1681000L, 1762000L, 1844000L, 1928000L, 2013000L, 2100000L },
	/* Tour 7 (Ranks 181-210): 290,000 - 3,400,000 | Total: 35,000,000 */
	{ 290000L, 293000L, 302000L, 319000L, 344000L, 377000L, 419000L, 468000L, 526000L, 593000L, 669000L, 753000L, 847000L, 951000L, 1064000L, 1187000L, 1320000L, 1463000L, 1617000L, 1781000L, 1956000L, 2142000L, 2339000L, 2547000L, 2708000L, 2844000L, 2980000L, 3119000L, 3259000L, 3400000L },
	/* Tour 8 (Ranks 211-240): 460,000 - 5,500,000 | Total: 56,000,000 */
	{ 460000L, 464000L, 479000L, 505000L, 545000L, 598000L, 664000L, 742000L, 834000L, 941000L, 1061000L, 1196000L, 1347000L, 1512000L, 1694000L, 1891000L, 2105000L, 2335000L, 2583000L, 2848000L, 3130000L, 3430000L, 3749000L, 4086000L, 4369000L, 4590000L, 4814000L, 5040000L, 5269000L, 5500000L },
	/* Tour 9 (Ranks 241-270): 740,000 - 8,800,000 | Total: 90,000,000 */
	{ 740000L, 747000L, 770000L, 813000L, 877000L, 962000L, 1068000L, 1194000L, 1343000L, 1514000L, 1708000L, 1925000L, 2167000L, 2433000L, 2725000L, 3042000L, 3386000L, 3756000L, 4154000L, 4579000L, 5033000L, 5515000L, 6027000L, 6568000L, 7004000L, 7356000L, 7712000L, 8071000L, 8434000L, 8800000L },
	/* Tour 10 (Ranks 271-300): 1,180,000 - 14,000,000 | Total: 145,000,000 */
	{ 1180000L, 1191000L, 1229000L, 1299000L, 1403000L, 1541000L, 1712000L, 1918000L, 2158000L, 2434000L, 2747000L, 3097000L, 3485000L, 3912000L, 4380000L, 4888000L, 5437000L, 6029000L, 6663000L, 7341000L, 8063000L, 8830000L, 9642000L, 10501000L, 11145000L, 11706000L, 12272000L, 12843000L, 13419000L, 14000000L },
	/* Tour 11 (Ranks 301-330): 3,000,000 - 100,000,000 | Total: 678,000,000 */
	{ 3000000L, 3022000L, 3119000L, 3317000L, 3632000L, 4078000L, 4669000L, 5416000L, 6333000L, 7430000L, 8719000L, 10212000L, 11919000L, 13851000L, 16018000L, 18430000L, 21099000L, 24034000L, 27245000L, 30742000L, 34535000L, 38634000L, 43049000L, 47789000L, 52864000L, 58285000L, 64060000L, 70200000L, 85399000L, 100000000L }
};

static void print_rank_notice(char const *text)
{
	wchar_t msg[96];
	short c, lp;

	if (!text || !game_in_progress())
		return;
	for (c = 0; text[c] && c < (short)NUMBEROF(msg) - 1; c++)
		msg[c] = (wchar_t)(unsigned char)text[c];
	msg[c] = 0;
	for (lp = 0; lp < MAXIMUM_NUMBER_OF_LOCAL_PLAYERS; lp++)
	{
		if (local_player_get_player_index(lp) != NONE)
			hud_print_message(lp, msg);
	}
}

void service_rank_compute_from_xp(
	long total_xp,
	struct firefight_mcc_rank_info *out_rank)
{
	long rem = MAX(0L, total_xp);
	short tour = 0;
	short r = 0;
	long step_xp = 3000L;

	if (!out_rank)
		return;

	for (tour = 0; tour < 11; tour++)
	{
		for (r = 0; r < 30; r++)
		{
			step_xp = s_mcc_tour_rank_xp[tour][r];
			if (tour == 10 && r == 29)
			{
				out_rank->tour_number = 11;
				out_rank->tour_name = s_mcc_tour_names[10];
				out_rank->rank_in_tour = 30;
				out_rank->rank_name = s_mcc_rank_names[29];
				out_rank->total_xp = MAX(0L, total_xp);
				out_rank->xp_in_rank = MIN(rem, step_xp);
				out_rank->xp_for_next_rank = step_xp;
				return;
			}
			if (rem < step_xp)
			{
				out_rank->tour_number = (short)(tour + 1);
				out_rank->tour_name = s_mcc_tour_names[tour];
				out_rank->rank_in_tour = (short)(r + 1);
				out_rank->rank_name = s_mcc_rank_names[r];
				out_rank->total_xp = MAX(0L, total_xp);
				out_rank->xp_in_rank = rem;
				out_rank->xp_for_next_rank = step_xp;
				return;
			}
			rem -= step_xp;
		}
	}
}

long service_rank_apply_xp_gain(
	long current_xp,
	long xp_amount,
	char const *reason,
	boolean announce_hud)
{
	struct firefight_mcc_rank_info before_rk, after_rk;
	long new_xp;

	(void)reason;
	if (xp_amount <= 0)
		return current_xp;

	service_rank_compute_from_xp(current_xp, &before_rk);
	new_xp = current_xp + xp_amount;
	service_rank_compute_from_xp(new_xp, &after_rk);

	if (announce_hud)
	{
		if (after_rk.tour_number > before_rk.tour_number)
		{
			char msg[96];
			snprintf(
				msg,
				sizeof(msg),
				"TOUR PROMOTION! %s - %s!",
				after_rk.tour_name,
				after_rk.rank_name);
			print_rank_notice(msg);
		}
		else if (after_rk.rank_in_tour > before_rk.rank_in_tour)
		{
			char msg[96];
			snprintf(
				msg,
				sizeof(msg),
				"RANK UP: %s (Rank %d - %s)",
				after_rk.rank_name,
				(int)after_rk.rank_in_tour,
				after_rk.tour_name);
			print_rank_notice(msg);
		}
	}
	return new_xp;
}

void service_rank_on_daily_challenge_completed(
	long score)
{
	long bonus_xp = 5000L + MAX(0L, score / 10L);
	char msg[96];

	snprintf(msg, sizeof(msg), "DAILY CHALLENGE COMPLETE (+%ld XP)", bonus_xp);
	print_rank_notice(msg);
	firefight_stats_add_xp(bonus_xp, "Daily Challenge Complete");
}

#endif /* OPENCE_ENABLE_SERVICE_RANK */
