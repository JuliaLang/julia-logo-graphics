using Luxor

R = 100
Drawing(7R / 2, 7R / 2, "/tmp/juliadots.svg")
origin()
translate(0, R / 4)
juliacircles(R)
finish()
preview()
