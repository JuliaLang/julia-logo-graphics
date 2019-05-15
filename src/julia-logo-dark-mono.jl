using Luxor, Colors

Drawing(320, 200, "/tmp/julia-logo-dark-mono.svg")
origin()
translate(-165, -113)
julialogo(color=false, bodycolor="grey85")
finish()
preview()
