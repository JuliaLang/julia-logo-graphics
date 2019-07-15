using Luxor

Drawing(350, 350, "/tmp/julia-dots.svg")
background("grey40")
origin()
setopacity(0.5)
translate(0, 20)
juliacircles(100)
finish()
preview()
