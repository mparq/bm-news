# source: https://fresh.deno.dev/docs/concepts/deployment
# docker file for deployment
FROM denoland/deno:2.1.7

ARG GIT_REVISION
ENV DENO_DEPLOYMENT_ID=${GIT_REVISION}

WORKDIR /app

COPY . .
RUN deno cache src/main.ts

EXPOSE 8000

CMD ["run", "-A", "src/main.ts"]
