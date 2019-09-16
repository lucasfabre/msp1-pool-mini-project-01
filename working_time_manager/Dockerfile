FROM elixir:1.8-otp-22

WORKDIR /api

COPY mix* ./

RUN apt-get update                                                      && \
    apt-get install -y build-essential inotify-tools sudo               && \
    curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -     && \
    apt-get install -y nodejs                                           && \
    mix local.hex --force                                               && \
    mix local.rebar --force                                             && \
    mix deps.get                                                        && \
    cd assets && npm install                                            && \
    cd ..

COPY . .

EXPOSE 4000

RUN chmod +x ./entrypoint.sh

ENTRYPOINT [ "/api/entrypoint.sh" ]