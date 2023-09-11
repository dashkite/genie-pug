import M from "@dashkite/masonry"
import pug from "@dashkite/masonry-pug"
import T from "@dashkite/masonry-targets"

export default ( Genie ) ->

  options = Genie.get "pug"

  Genie.on "build", "pug"
  
  Genie.define "pug", M.start [
    T.glob options.targets
    M.read
    M.tr pug
    T.extension ".${ build.preset }"
    T.write "build/${ build.target }"
  ]
