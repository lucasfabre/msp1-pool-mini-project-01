# Prérequis :
 - Erlang
 - Elixir
 - Phoenix
 - Postgresql :
   - User "postgres"
   - Password "postgres"

# Initialisation du projet :
 - mix deps.get
 - mix ecto.create
 - mix phx.server

# Creation de la BDD
 - mix phx.gen.schema User users username:string email:string