import * as M from "@dashkite/masonry"
import * as Mh from "@dashkite/masonry-hooks"
import pug from "@dashkite/masonry-pug"
import T from "@dashkite/masonry-targets"

export default ( Genie ) ->

  # re-reading the options makes his re-entrant and allows
  # for dynamic configuration (ex: DRN changes)
  Genie.define "pug:build", "pug:clean", ->
    
    options = Genie.get "pug"

    do M.start [
      T.glob options.targets
      Mh.read
      pug
      T.extension ".${ build.preset }"
      T.write "build/${ build.target }"
    ]

  # alias
  Genie.define "pug", "pug:build"
  
  Genie.on "build", "pug:build"

  Genie.define "pug:clean", "clean"
