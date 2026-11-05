/*
 * fallback-banner.js
 * ==================
 * Shows a warning banner when this site is served from a hostname that is not
 * on the approved list. Same idea as the cmip-fallback WordPress plugin.
 *
 * Settings live in src/mkdocs.yml under extra.fallback_banner and reach this
 * script through window.CMIP_FALLBACK_BANNER (set in overrides/main.html):
 *   enabled    true/false
 *   hostnames  approved hostnames; "*.example.org" matches any subdomain
 *   text       the warning message
 *   url        optional link to the official site
 *   link_text  optional text for that link
 *
 * An empty hostname (a page opened straight from disk) never shows the banner.
 */
(function () {
  var cfg = window.CMIP_FALLBACK_BANNER;
  if (!cfg || cfg.enabled === false) return;

  var host = (location.hostname || '').toLowerCase();
  if (!host) return;

  var approved = (cfg.hostnames || []).map(function (h) {
    return String(h).toLowerCase();
  });

  function isApproved(h) {
    return approved.some(function (a) {
      if (a.indexOf('*.') === 0) {
        var suffix = a.slice(1);              // "*.example.org" -> ".example.org"
        return h.length > suffix.length &&
               h.slice(-suffix.length) === suffix;
      }
      return h === a;
    });
  }

  if (isApproved(host)) return;
  if (document.querySelector('.cmip-fallback-banner')) return;

  var banner = document.createElement('div');
  banner.className = 'cmip-fallback-banner';
  banner.setAttribute('role', 'alert');

  var text = document.createElement('span');
  text.textContent = cfg.text || 'This is not the official version of this site.';
  banner.appendChild(text);

  if (cfg.url) {
    var link = document.createElement('a');
    link.href = cfg.url;
    link.textContent = cfg.link_text || 'Go to the official site';
    banner.appendChild(document.createTextNode(' '));
    banner.appendChild(link);
  }

  document.body.insertBefore(banner, document.body.firstChild);
})();
