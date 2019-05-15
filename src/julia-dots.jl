using Luxor

Drawing(325, 300, "/tmp/julia-dots.svg")
origin()
translate(0, 25)
juliacircles(100)
finish()
preview()
