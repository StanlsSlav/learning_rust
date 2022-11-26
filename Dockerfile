FROM postgres AS base
ENV POSTGRES_PASSWORD password

FROM arm32v7/rust:latest
WORKDIR /app
COPY . .
RUN cargo install --path .

EXPOSE 3030

RUN cargo install diesel_cli --no-default-features --features postgres
RUN echo DATABASE_URL=postgres://root:password@localhost/diesel_demo > .env \
RUN cargo run