import { useSignal } from "@preact/signals";
import { queryFrontPage } from "../db/queries.ts";

export default async function Home() {
  const langCode = "en"
  const data = await queryFrontPage(langCode);

  return (
    <>
      <section id="top-news">
        <div class="container">
          <figure class="news-feature">
            <div class="news-feature__image">
              <img src="/assets/news-01.jpg" alt="News Image" />
            </div>
            <figcaption>
              <h2>Paramahamsa Vishwananda Visited an Orphan Centre</h2>
              <small>10 min read</small>
            </figcaption>
          </figure>
        </div>
      </section>
      <pre>
        {JSON.stringify(data, null, 2)}
      </pre>
      <section id="latest-news">
        <div class="container">
          <h3>Latest News</h3>
          <div class="news-grid">
            <figure class="news-card">
              <div class="news-card__image">
                <img
                  src="/assets/news-02.jpg"
                  alt="Meeting of friends in Italy"
                />
              </div>
              <figcaption>
                <h4>Meeting of Friends in Italy</h4>
                <small>10 min read</small>
              </figcaption>
            </figure>
            <figure class="news-card">
              <div class="news-card__image">
                <img
                  src="/assets/news-02.jpg"
                  alt="Meeting of friends in Italy"
                />
              </div>
              <figcaption>
                <h4>Meeting of Friends in Italy</h4>
                <small>10 min read</small>
              </figcaption>
            </figure>
            <figure class="news-card">
              <div class="news-card__image">
                <img
                  src="/assets/news-02.jpg"
                  alt="Meeting of friends in Italy"
                />
              </div>
              <figcaption>
                <h4>Meeting of Friends in Italy</h4>
                <small>10 min read</small>
              </figcaption>
            </figure>
            <figure class="news-card">
              <div class="news-card__image">
                <img
                  src="/assets/news-02.jpg"
                  alt="Meeting of friends in Italy"
                />
              </div>
              <figcaption>
                <h4>Meeting of Friends in Italy</h4>
                <small>10 min read</small>
              </figcaption>
            </figure>
            <figure class="news-card">
              <div class="news-card__image">
                <img
                  src="/assets/news-02.jpg"
                  alt="Meeting of friends in Italy"
                />
              </div>
              <figcaption>
                <h4>Meeting of Friends in Italy</h4>
                <small>10 min read</small>
              </figcaption>
            </figure>
          </div>
        </div>

        <div class="container minor-news">
          <div class="articles-list">
            <article>
              <p>A Sacrifice for others</p>
              <small>⌛ 5 min read</small>
            </article>

            <article>
              <p>Unity in Diversity</p>
              <small>⌛ 8 min read</small>
            </article>

            <article>
              <p>Help beyond borders</p>
              <small>⌛ 3 min read</small>
            </article>

            <article>
              <p>What happened in Ayodhya 1 year ago?</p>
              <small>⌛ 3 min read</small>
            </article>

            <article>
              <p>
                What happened in Ayodhya 1 year<br />ago?
              </p>
              <small>⌛ 3 min read</small>
            </article>
          </div>

          <figure class="news-card">
            <div class="news-card__image">
              <img src="/assets/news-01.jpg" alt="News Image" />
            </div>
            <figcaption>
              <h4>
                Paramahamsa Vishwananda met the founder of the xyz tradition in
                Italy
              </h4>
              <small>10 min read</small>
            </figcaption>
          </figure>
        </div>
      </section>
    </>
  );
}
