import FS from "node:fs"
import Path from "node:path"
import * as M from "@dashkite/masonry"
import * as H from "@dashkite/masonry-hooks"
import pug from "@dashkite/masonry-pug"
import T from "@dashkite/masonry-targets"
import YAML from "js-yaml"

export default ( Genie ) ->

  Genie.define "pug:build", "pug:clean", ->
    
    options = Genie.get "pug"

    do M.start [
      T.glob options.targets
      H.read
      pug
      T.extension ".${ build.preset }"
      T.write "build/${ build.target }"
    ]

  # alias
  Genie.define "pug", "pug:build"
  
  Genie.on "build", "pug:build"

  Genie.define "pug:clean", "clean"
