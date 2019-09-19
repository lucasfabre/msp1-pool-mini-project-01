# Prérequis :
 - Erlang (https://tecadmin.net/install-erlang-on-ubuntu)
   - wget -O- https://packages.erlang-solutions.com/ubuntu/erlang_solutions.asc | sudo apt-key add -
   - echo "deb https://packages.erlang-solutions.com/ubuntu bionic contrib" | sudo tee /etc/apt/sources.list.d/rabbitmq.list
   - sudo apt update && sudo apt-get install erlang
 - Elixir (https://elixir-lang.org/install.html)
   - wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
   - sudo apt-get install esl-erlang
   - sudo apt-get install elixir
 - Phoenix (https://hexdocs.pm/phoenix/installation.html)
   - mix local.hex
   - mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez
 - Postgresql ()
   - sudo apt-get install wget ca-certificates
   - wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
   - sudo apt-get install postgresql postgresql-contrib
   - /!\ You must have a user named "postgres" with a password "postgres"

# Initialisation du projet :
 - source .env
 - mix deps.get
 - mix ecto.create
 - mix phx.server