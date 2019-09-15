FROM elixir:1.8-otp-22

WORKDIR /api

COPY mix* ./

RUN apt-get update                      && \
    apt-get install build-essential -y  && \
    mix local.hex --force               && \
    mix local.rebar --force             && \
    mix deps.get

COPY . .

EXPOSE 4000

RUN chmod +x ./entrypoint.sh

ENTRYPOINT [ "/api/entrypoint.sh" ]