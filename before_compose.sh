#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

docker run --rm -v $DIR:/app -it node bash -c "cd '/app/front-end/app';
npm install;
npm run build;
mkdir -p '/app/back-end/priv/';
mv '/app/front-end/app/dist' '/app/back-end/priv/static';"
