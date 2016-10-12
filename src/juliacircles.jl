#!/usr/bin/env julia

using Luxor, Colors
Drawing(500, 500, "/tmp/juliacircles.png")
origin()
# no background —> transparent PNG
juliacircles()
finish()
preview()
