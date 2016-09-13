#!/usr/bin/env julia

using Luxor, Colors
# find this file, eg:
include("julia-logo.jl")
Drawing(1000, 1000, "/tmp/julia-logo.pdf")
origin()
background("ivory")
sethue("red")
julialogo(false)
finish()
preview()
