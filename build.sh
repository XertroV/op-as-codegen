#!/usr/bin/env bash

set -e

mkdir -p ./codegen

npx spago run

rm -r ~/win/OpenplanetNext/Plugins/TrackmaniaApiObjsAndHelpers
rm -r ~/win/OpenplanetNext/Plugins/TrackmaniaApiObjsAndHelpersTest

cp -av ./codegen/TrackmaniaApiObjsAndHelpers ~/win/OpenplanetNext/Plugins/
cp -av ./codegen/TrackmaniaApiObjsAndHelpersTest ~/win/OpenplanetNext/Plugins/

7z a ./TrackmaniaApiObjsAndHelpers.zip ./codegen/TrackmaniaApiObjsAndHelpers/* ./LICENSE ./README_GEN.md
mv TrackmaniaApiObjsAndHelpers.zip TrackmaniaApiObjsAndHelpers.op
