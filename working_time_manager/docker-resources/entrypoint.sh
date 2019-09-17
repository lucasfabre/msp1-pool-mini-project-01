#!/bin/bash
#!/bin/bash

cd /working_time_manager

# Custom tasks (like DB migrations)
MIX_ENV=prod mix ecto.migrate

# Finally run the server
PORT=80 MIX_ENV=prod mix phx.server