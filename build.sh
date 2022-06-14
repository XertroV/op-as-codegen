#!/usr/bin/env bash

set -e

npx spago run

rm -r ~/win/OpenplanetNext/Plugins/testCodegen/

cp -av ./codegen/testCodegen ~/win/OpenplanetNext/Plugins/
