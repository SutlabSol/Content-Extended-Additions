'use strict';

(() => {
  const pages = ['home', 'game-data', 'servers', 'settings', 'about'];
  const titles = {
    home: 'Home',
    'game-data': 'Game data',
    servers: 'Server browser',
    settings: 'Settings and data',
    about: 'About',
  };
  const aliases = {
    'play-panel': 'home',
    'project-panel': 'home',
    'data-panel': 'game-data',
    'mods-panel': 'game-data',
    'profiles-panel': 'game-data',
    'checks-panel': 'game-data',
    'room-panel': 'servers',
    'servers-panel': 'servers',
    'settings-panel': 'settings',
    'about-panel': 'about',
  };
  const nav = document.getElementById('main-nav');
  const toggle = document.getElementById('nav-toggle');
  const backdrop = document.getElementById('nav-backdrop');
  const mobile = window.matchMedia('(max-width: 760px)');

  function currentPage() {
    const requested = location.hash.slice(1);
    return aliases[requested] || (pages.includes(requested) ? requested : 'home');
  }

  function closeMenu(returnFocus = false) {
    document.body.classList.remove('nav-open');
    toggle.setAttribute('aria-expanded', 'false');
    toggle.setAttribute('aria-label', 'Open navigation');
    backdrop.hidden = true;
    nav.inert = mobile.matches;
    if (returnFocus && mobile.matches) toggle.focus();
  }

  function renderPage() {
    const page = currentPage();
    for (const view of document.querySelectorAll('[data-page-view]')) view.hidden = view.dataset.pageView !== page;
    for (const link of nav.querySelectorAll('[data-page-link]')) {
      if (link.dataset.pageLink === page) link.setAttribute('aria-current', 'page');
      else link.removeAttribute('aria-current');
    }
    const requested = location.hash.slice(1);
    if (!requested || aliases[requested]) history.replaceState(null, '', `${location.pathname}${location.search}#${page}`);
    document.title = `Halo Content Evolved | ${titles[page]}`;
    window.scrollTo(0, 0);
    closeMenu();
  }

  toggle.addEventListener('click', () => {
    const open = !document.body.classList.contains('nav-open');
    document.body.classList.toggle('nav-open', open);
    toggle.setAttribute('aria-expanded', String(open));
    toggle.setAttribute('aria-label', open ? 'Close navigation' : 'Open navigation');
    backdrop.hidden = !open;
    nav.inert = !open;
    if (open) nav.querySelector('a').focus();
  });

  nav.addEventListener('click', (event) => {
    if (event.target.closest('[data-page-link]')) closeMenu(true);
  });
  backdrop.addEventListener('click', () => closeMenu(true));
  document.addEventListener('keydown', (event) => {
    if (event.key === 'Escape' && document.body.classList.contains('nav-open')) closeMenu(true);
  });
  window.addEventListener('hashchange', renderPage);
  mobile.addEventListener('change', () => closeMenu());

  renderPage();
})();