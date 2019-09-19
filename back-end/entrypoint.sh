#!/bin/bash

set -xe
mix ecto.create && mix phx.server