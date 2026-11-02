'use strict';

(() => {
  const androidBrowser = /android/i.test(navigator.userAgent);
  document.body.classList.toggle('android-device', androidBrowser);

  const REPOSITORY = 'Watanoge/halo-content-evolved';
  const RELEASES_PAGE = `https://github.com/${REPOSITORY}/releases`;
  const RELEASES_API = `https://api.github.com/repos/${REPOSITORY}/releases?per_page=100`;
  const releaseUrl = (tag) => `${RELEASES_PAGE}/tag/${encodeURIComponent(tag)}`;
  const WATANOGE = { name: 'Watanoge', href: 'https://github.com/Watanoge' };

  const roadmap = {
    planned: [
      {
        kind: 'Main mode',
        title: 'Forge',
        description: 'Build and share Halo CE experiences, based on OpenCE Faber and updated by Watanoge.',
        source: { label: 'OpenCE Faber', href: 'https://github.com/SutlabSol/OpenCE-Faber' },
        authors: [WATANOGE],
      },
      { kind: 'Gamemode', title: 'UNSC vs Covenant' },
      { kind: 'Content creation', title: 'Tag profile workshop' },
      { kind: 'Gameplay upgrade', title: 'Multiplayer skulls' },
      { kind: 'Gameplay upgrade', title: 'Custom single-player upgrades', description: 'Skulls, the randomizer, and tag injection on custom single-player maps.' },
      { kind: 'Gamemode', title: 'Floodfection V3' },
    ],
    doing: [
      {
        kind: 'Main mode',
        title: 'Firefight',
        description: 'Being developed by SutlabSol using OpenCE Faber.',
        source: { label: 'OpenCE Faber', href: 'https://github.com/SutlabSol/OpenCE-Faber' },
        authors: [{ name: 'SutlabSol', href: 'https://github.com/SutlabSol' }],
      },
      { kind: 'Feature', title: 'Cross-platform account sync' },
    ],
    done: [
      { kind: 'Quality of life', title: 'Map sub-folders', release: 'switch-fixes-01', authors: [WATANOGE] },
      { kind: 'Main mode', title: 'Daily challenge', release: 'ultimate-campaign-v0.1', authors: [WATANOGE] },
      { kind: 'Gameplay upgrade', title: 'Campaign skulls', release: 'ultimate-campaign-v0.1', authors: [WATANOGE] },
      { kind: 'Gameplay upgrade', title: 'Campaign randomizer', release: 'ultimate-campaign-v0.1', authors: [WATANOGE] },
      { kind: 'Gameplay upgrade', title: 'Campaign scoring and medals', release: 'ultimate-campaign-v0.1', authors: [WATANOGE] },
      { kind: 'Gameplay upgrade', title: 'Campaign leaderboards', release: 'ultimate-campaign-v0.1', authors: [WATANOGE] },
      { kind: 'Gameplay upgrade', title: 'Solo campaign tag injection', release: 'build-105', authors: [WATANOGE] },
      { kind: 'Gameplay upgrade', title: 'Multiplayer scoring and medals', release: 'build-107', authors: [WATANOGE] },
      {
        kind: 'Gameplay upgrade',
        title: 'Multiplayer bots',
        release: 'build-112',
        authors: [
          WATANOGE,
          { name: 'Thelinkin3000', href: 'https://github.com/thelinkin3000' },
        ],
      },
      { kind: 'Gameplay upgrade', title: 'Multiplayer tag injection', release: 'build-112', authors: [WATANOGE] },
      { kind: 'Gameplay upgrade', title: 'Co-op campaign tag injection', release: 'build-113', authors: [WATANOGE] },
      { kind: 'Content creation', title: 'Firing range for tag profiles', release: 'build-113', authors: [WATANOGE] },
      {
        kind: 'Main mode',
        title: 'Theater mode',
        release: 'build-113',
        authors: [{ name: 'Thelinkin3000', href: 'https://github.com/thelinkin3000' }],
      },
      { kind: 'Content creation', title: 'Tag injection gamemodes', release: 'build-115', authors: [WATANOGE] },
      { kind: 'Gamemode', title: 'Floodfection V1', release: 'build-115', authors: [WATANOGE] },
      { kind: 'Gamemode', title: 'Tag gun game', release: 'build-115', authors: [WATANOGE] },
      { kind: 'Gameplay upgrade', title: 'Third-person mode', release: 'build-117', authors: [WATANOGE] },
      { kind: 'Gamemode', title: 'Floodfection V2', release: 'build-117', authors: [WATANOGE] },
      { kind: 'Social feature', title: 'Friend list', release: 'build-121', authors: [WATANOGE] },
      { kind: 'Social feature', title: 'Global and match chat', release: 'build-121', authors: [WATANOGE] },
      { kind: 'Social feature', title: 'Join friends in-game', release: 'build-121', authors: [WATANOGE] },
    ],
  };

  function renderRoadmap() {
    for (const [lane, features] of Object.entries(roadmap)) {
      const list = document.getElementById(`roadmap-${lane}`);
      document.getElementById(`${lane}-count`).textContent = String(features.length).padStart(2, '0');
      list.replaceChildren(...features.map((feature) => {
        const card = document.createElement('article');
        card.className = 'feature-card';
        const kind = document.createElement('p');
        kind.className = 'feature-kind';
        kind.textContent = feature.kind;
        const heading = document.createElement('h4');
        heading.textContent = feature.title;
        card.append(kind, heading);
        if (feature.description) {
          const description = document.createElement('p');
          description.className = 'feature-description';
          description.textContent = feature.description;
          card.append(description);
        }
        if (feature.source) {
          const source = document.createElement('a');
          source.className = 'feature-source';
          source.href = feature.source.href;
          source.target = '_blank';
          source.rel = 'noopener';
          source.textContent = `Based on ${feature.source.label}`;
          card.append(source);
        }
        const footer = document.createElement('div');
        footer.className = 'feature-footer';
        if (feature.release) {
          const release = document.createElement('a');
          release.className = 'feature-release';
          release.href = releaseUrl(feature.release);
          release.target = '_blank';
          release.rel = 'noopener';
          release.textContent = feature.release;
          footer.append(release);
        }
        if (feature.authors && feature.authors.length) {
          const authors = document.createElement('span');
          authors.className = 'feature-authors';
          authors.append(document.createTextNode('By '));
          feature.authors.forEach((author, index) => {
            if (index) authors.append(document.createTextNode(' + '));
            const link = document.createElement('a');
            link.href = author.href;
            link.target = '_blank';
            link.rel = 'noopener';
            link.textContent = author.name;
            authors.append(link);
          });
          footer.append(authors);
        }
        if (footer.childNodes.length) card.append(footer);
        return card;
      }));
    }
  }

  function releaseDate(value) {
    const date = new Date(value);
    return Number.isNaN(date.valueOf()) ? '' : new Intl.DateTimeFormat('en', { dateStyle: 'medium' }).format(date);
  }

  function assetLabel(name) {
    const format = /\.apk$/i.test(name) ? ' APK' : /\.zip$/i.test(name) ? ' ZIP' : '';
    const normalized = name.replace(/^halo-/, '').replace(/\.zip$|\.apk$/i, '');
    return normalized.split('-').map((word) => word[0].toUpperCase() + word.slice(1)).join(' ') + format;
  }

  function assetLinks(assets, className = '') {
    const links = (assets || []).filter((asset) => asset && typeof asset.name === 'string' &&
      typeof asset.browser_download_url === 'string' && (() => {
        try {
          const url = new URL(asset.browser_download_url);
          return url.protocol === 'https:' && url.hostname === 'github.com' &&
            url.pathname.startsWith(`/Watanoge/halo-content-evolved/releases/download/`);
        } catch {
          return false;
        }
      })());
    if (!links.length) {
      const empty = document.createElement('p');
      empty.className = 'release-empty';
      empty.textContent = 'No downloadable files are attached to this release.';
      return empty;
    }
    const container = document.createElement('div');
    container.className = `release-assets ${className}`.trim();
    for (const asset of links) {
      const link = document.createElement('a');
      link.className = 'release-asset';
      link.href = asset.browser_download_url;
      link.target = '_blank';
      link.rel = 'noopener';
      link.textContent = assetLabel(asset.name);
      const size = document.createElement('span');
      size.textContent = `${(asset.size / 1048576).toFixed(1)} MB`;
      link.append(size);
      container.append(link);
    }
    return container;
  }

  function renderReleaseHistory(releases) {
    const list = document.getElementById('releases-list');
    list.replaceChildren(...releases.map((release) => {
      const item = document.createElement('details');
      item.className = 'release-item';
      const summary = document.createElement('summary');
      const title = document.createElement('span');
      title.className = 'release-item-title';
      title.textContent = release.name || release.tag_name || 'Release';
      const tag = document.createElement('span');
      tag.className = 'release-tag';
      tag.textContent = release.tag_name || '';
      const date = document.createElement('time');
      date.className = 'release-date';
      date.textContent = releaseDate(release.published_at);
      if (release.published_at) date.dateTime = release.published_at;
      summary.append(title, tag, date);
      item.append(summary);
      const content = document.createElement('div');
      content.className = 'release-details';
      const notes = document.createElement('pre');
      notes.className = 'release-notes';
      const body = typeof release.body === 'string' && release.body.trim() ? release.body.trim() : 'No release notes.';
      notes.textContent = body.length > 7000 ? `${body.slice(0, 7000)}\n\nRelease notes truncated.` : body;
      content.append(notes, assetLinks(release.assets));
      item.append(content);
      return item;
    }));
  }

  let releasesPromise;
  async function loadReleases() {
    if (releasesPromise) return releasesPromise;
    const status = document.getElementById('releases-status');
    status.textContent = 'Fetching release notes…';
    releasesPromise = (async () => {
      try {
        const response = await fetch(RELEASES_API, { headers: { Accept: 'application/vnd.github+json' } });
        if (!response.ok) throw new Error(`GitHub returned ${response.status}`);
        const data = await response.json();
        if (!Array.isArray(data)) throw new Error('GitHub returned an unexpected response');
        const releases = data.filter((release) => release && release.draft !== true);
        const latest = releases.find((release) => release.prerelease !== true);
        if (!latest) throw new Error('No published release is available');
        document.getElementById('latest-release-tag').textContent = latest.tag_name || '';
        document.getElementById('latest-release-name').textContent = latest.name || '';
        const date = document.getElementById('latest-release-date');
        date.textContent = releaseDate(latest.published_at);
        if (latest.published_at) date.dateTime = latest.published_at;
        const latestAssets = document.getElementById('latest-assets');
        latestAssets.replaceChildren(assetLinks(latest.assets));
        renderReleaseHistory(releases);
        status.textContent = `${releases.length} releases loaded from GitHub.`;
      } catch (error) {
        releasesPromise = null;
        status.textContent = 'Could not load releases from GitHub. Use the links above to open the release page directly.';
        document.getElementById('latest-release-name').textContent = String(error.message || error);
      }
    })();
    return releasesPromise;
  }

  function checkDownloadsPage() {
    if (location.hash === '#downloads' || location.hash === '#downloads-panel') loadReleases();
  }

  renderRoadmap();
  window.addEventListener('hashchange', checkDownloadsPage);
  checkDownloadsPage();
})();