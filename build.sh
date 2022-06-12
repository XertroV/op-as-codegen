#!/usr/bin/env bash

set -e

npx spago run

cp -av ./codegen/testCodegen ~/win/OpenplanetNext/Plugins/
