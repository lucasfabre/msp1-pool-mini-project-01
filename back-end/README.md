# Prérequis :
 - Erlang (https://tecadmin.net/install-erlang-on-ubuntu)
   - wget -O- https://packages.erlang-solutions.com/ubuntu/erlang_solutions.asc | sudo apt-key add -
   - echo "deb https://packages.erlang-solutions.com/ubuntu bionic contrib" | sudo tee /etc/apt/sour\
ces.list.d/rabbitmq.list
   - sudo apt update && sudo apt-get install erlang
 - Elixir (https://elixir-lang.org/install.html)
   - wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-\
solutions_1.0_all.deb
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

# WorkingTimeManager

To start your Phoenix server:

  - You can launch the launch.sh script with the command : ./launch.sh
  ### OR
  - You can run those commands:
    * Install dependencies with `mix deps.get`
    * Create and migrate your database with `mix ecto.setup`
    * Install Node.js dependencies with `cd assets && npm install`
    * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
