import * as M from "@dashkite/masonry"
import { pug } from "@dashkite/masonry-pug"
import { File as F, Files as P } from "@dashkite/genie-files"


export default ( Genie ) ->

  options = Genie.get "pug"

  Genie.on "build", "pug"
  
  Genie.define "pug", m.start [
    P.targets options.targets
    M.read
    M.tr pug
    M.extension ".${ build.preset }"
    F.write "build/${ build.target }"
  ]
