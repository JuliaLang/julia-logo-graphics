using Luxor, Colors

Drawing(320, 200, "/tmp/julia-logo-dark.svg")
origin()
translate(-165, -113)
julialogo(bodycolor=colorant"white")
finish()
preview()
