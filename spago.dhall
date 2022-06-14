{-
Welcome to a Spago project!
You can edit this file as you like.

Need help? See the following resources:
- Spago documentation: https://github.com/purescript/spago
- Dhall language tour: https://docs.dhall-lang.org/tutorials/Language-Tour.html

When creating a new Spago project, you can use
`spago init --no-comments` or `spago init -C`
to generate this file without the comments in this block.
-}
{ name = "my-project"
, dependencies =
  [ "arrays"
  , "b64"
  , "console"
  , "control"
  , "datetime"
  , "effect"
  , "foldable-traversable"
  , "integers"
  , "lcg"
  , "lists"
  , "maybe"
  , "newtype"
  , "node-buffer"
  , "node-fs"
  , "now"
  , "numbers"
  , "partial"
  , "prelude"
  , "quickcheck"
  , "random"
  , "strings"
  , "stringutils"
  , "tailrec"
  , "tuples"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
