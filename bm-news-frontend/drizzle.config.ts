// drizzle.config.ts
import { defineConfig } from "drizzle-kit";

export default defineConfig({
  dialect: "postgresql",
  schema: "./src/db/schema.ts",
  out: "./drizzle",
  dbCredentials: {
    // default to the local docker image database. DO NOT USE IN PROD
    url: Deno.env.get("BM_NEWS_DATABASE_URL") || 'postgresql://postgres:localpassword@localhost:5021/postgres',
  },
});
