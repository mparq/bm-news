import { Handlers } from "$fresh/server.ts";
import { PageProps } from "$fresh/server.ts";
import { QuerySingleArticle, querySingleArticle } from "../../db/queries.ts";

export const handler: Handlers = {
	async GET(_req, ctx) {
	const langCode = 'en';
	const article = await querySingleArticle(langCode, ctx.params.handle);
	if (!article) {
		throw ctx.renderNotFound();
	}
  const resp = await ctx.render(article);
  return resp;
	},
  };

export default function ArticlePage(props: PageProps<QuerySingleArticle>) {
	const article = props.data!;
  return (
	  <article>
		<h1>Showing article {article.title}</h1>
		<pre>{JSON.stringify(article, null, 2)}</pre>
	  </article>
  );
}