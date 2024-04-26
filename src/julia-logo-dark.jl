using Luxor

Drawing(320, 230, "/tmp/julia-logo-dark.png")
origin()
julialogo(bodycolor="grey90", centered=true)
finish()
preview()