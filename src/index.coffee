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

  Genie.define "pug:watch", ->
    W = await import( "@dashkite/masonry-watch" )
    do M.start [
      W.glob options.targets
      W.match type: "file", name: [ "add", "change" ], [
        M.read
        M.tr pug
        T.extension ".${ build.preset }"
        T.write "build/${ build.target }"
      ]
      W.match type: "file", name: "rm", [
        T.extension ".${ build.preset }"
        T.rm "build/${ build.target }"
      ]
      W.match type: "directory", name: "rm", 
        T.rm "build/${ build.target }"        
    ]

  Genie.on "watch", "pug:watch&"