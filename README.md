# Openplanet AngelScript Code Generator

This is a code generator for Openplanet's flavor of AngelScript.

## running it / dev

- `npm i`
- `npm run testCodegen` (updates files in `./codegen`)

see `./src/DBTest.purs` for how the current test classes are generated.

## free writing about goals / structure

What I want is a way to create certain things.
Like take a JSON spec and make a Dict/DB class that has getters/setters for the right stuff automatically and does recursive stuff.

so the input is just the json spec
