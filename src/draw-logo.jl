#!/usr/bin/env julia

using Luxor, Colors
Drawing(1000, 1000, "/tmp/julia-logo.pdf")
origin()
background("ivory")
sethue("red")
julialogo()
finish()
preview()
