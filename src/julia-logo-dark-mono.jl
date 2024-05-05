using Luxor

Drawing(320, 230, "/tmp/julia-logo-dark-mono.png")
origin()
julialogo(bodycolor="grey90", color=false, centered=true)
finish()
preview()