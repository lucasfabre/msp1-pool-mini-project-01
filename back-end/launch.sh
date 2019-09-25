#!/bin/bash

mix deps.get
source ../.env
cd assets && npm install && cd ..
mix phx.server&
