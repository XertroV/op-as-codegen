#!/usr/bin/env bash

set -e

npx spago run

rm -r ~/win/OpenplanetNext/Plugins/CotdObjects
rm -r ~/win/OpenplanetNext/Plugins/CotdObjectsTest

cp -av ./codegen/CotdObjects ~/win/OpenplanetNext/Plugins/
cp -av ./codegen/CotdObjectsTest ~/win/OpenplanetNext/Plugins/
