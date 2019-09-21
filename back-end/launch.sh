#!/bin/bash

mix deps.get
source ../.env
mix phx.server
