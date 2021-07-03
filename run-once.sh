#!/bin/sh

cd "$(dirname "$0")"

date
/usr/bin/env php /app/dynacover cover update
