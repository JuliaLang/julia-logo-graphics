using Luxor, Colors

Drawing(325, 225, "/tmp/julia-logo-dark-mono.png")
origin()
translate(-165, -113)
julialogo(bodycolor="grey90")
finish()
preview()
