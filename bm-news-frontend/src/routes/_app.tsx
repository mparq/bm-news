import { type PageProps } from "$fresh/server.ts";
export default function App({ Component }: PageProps) {
  return (
    <html>
      <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>bm-news-frontend</title>
        <link rel="stylesheet" href="/css/reset.css" />
        <link rel="stylesheet" href="/css/base.css" />
        <link rel="stylesheet" href="/css/buttons.css" />
        <link rel="stylesheet" href="/css/homepage.css" />
      </head>
      <body>
        <header class="header">
          <div class="header__top">
            <div class="header__logo">
              <a href="/">
                <img
                  class="custom-logo"
                  src="/assets/bhakti-marga-news-logo.jpg"
                  alt="Bhakti Marga News Logo"
                />
              </a>
              <h1>Bhakti Marga News</h1>
            </div>
            <div class="header__actions">
              <a href="/" class="button button--primary button--primary--white">
                Live
              </a>
              <a href="/" class="button button--primary button--primary--white">
                Newsletter
              </a>
            </div>
          </div>
          <nav class="navigation">
            <ul class="navigation__categories" aria-label="Primary categories">
              <li>
                <a href="/">BM Worldwide</a>
              </li>
              <li>
                <a href="/">Paramahamsa Vishwananda</a>
              </li>
              <li>
                <a href="/">Initiatives</a>
              </li>
              <li>
                <a href="/">Volunteering & Cooperation</a>
              </li>
              <li>
                <a href="/">Community</a>
              </li>
            </ul>
            <div class="navigation__actions">
              <a href="/" class="button button--primary">Contact Us</a>
              <a href="/" aria-label="Change language">Language</a>
            </div>
          </nav>
        </header>
        <main>
          <Component />
        </main>
      </body>
    </html>
  );
}
