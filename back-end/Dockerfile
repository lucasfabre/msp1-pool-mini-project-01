FROM elixir:1.8-otp-22

WORKDIR /api

COPY mix* ./

RUN apt-get update                                                      && \
    apt-get install -y build-essential inotify-tools                    && \
    curl -sL https://deb.nodesource.com/setup_12.x | bash -             && \
    apt-get install -y nodejs                                           && \
    mix local.hex --force                                               && \
    mix local.rebar --force                                             && \
    mix deps.get							                            && \
    mix do compile

COPY . .

ENV PGDATABASE="working_time_manager_dev"
ENV PGPORT="5432"
ENV PGHOST="db"
ENV PGUSER="postgres"
ENV PGPASSWORD="postgres"

RUN env

RUN cd assets && npm install                                            && \
    cd ..

EXPOSE 4000

RUN chmod +x ./entrypoint.sh

ENTRYPOINT [ "/api/entrypoint.sh" ]
