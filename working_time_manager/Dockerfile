FROM elixir:1.8-otp-22

WORKDIR /api

COPY mix* ./

RUN apt-get update                                                      && \
    curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -     && \
    apt-get install -y build-essential inotify-tools nodejs             && \
    mix local.hex --force                                               && \
    mix local.rebar --force                                             && \
    mix deps.get

WORKDIR /api/assets

RUN npm install

WORKDIR /api

COPY . .

EXPOSE 4000

RUN chmod +x ./entrypoint.sh

ENTRYPOINT [ "/api/entrypoint.sh" ]