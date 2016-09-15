#!/usr/bin/env julia

using Luxor, Colors, ColorSchemes

function polar(r, theta, k)
  return Point(k * r * cos(theta), k * r * sin(theta))
end

function draw_spiral(p, colscheme)
  gsave()
  translate(p)
  setopacity(0.9)
  setline(2)
  sethue("red")
  γ = 2pi * (1 - 1/golden)
  k = 30
  circleradius = 30
  for i in 1:2:200
    pos = polar(sqrt(i), i * γ, k)
    for n in 1:2:25
      sethue(colorscheme(colscheme, n/25))
      circle(pos, circleradius - n, :fill)
    end
    circleradius -= .2
  end
  grestore()
end

pagewidth, pageheight = 2000, 2000
fname = "/tmp/image.pdf"
Drawing(pagewidth, pageheight, fname)
origin() # move 0/0 to center
background("white")
setopacity(0.8)
setline(0.5)
points = ngon(O, 500, 3, pi/6, vertices=true)

# (0.584, 0.345, 0.698)      # darker purple
# (0.667, 0.475, 0.757)      # lighter purple
# (0.22, 0.596, 0.149)       # darker green
# (0.376, 0.678, 0.318)      # lighter green
# (0.796, 0.235, 0.2)        # darker red
# (0.835, 0.388, 0.361)      # lighter red

purples = [RGB{Float64}(0.584 + i, 0.345 + i, 0.998 + i) for i in 0:0.1:0.7]
greens = [RGB{Float64}(0.22 + i, 0.596 + i, 0.149 + i) for i in 0:0.1:0.7]
reds = [RGB{Float64}(0.835 + i, 0.388 + i, 0.361 + i) for i in 0:0.1:0.7]

for (n, p) in enumerate(points)
  cscheme = [reds, greens, purples][n] # we started at the bottom left, so red/green/purple is the order
  draw_spiral(p, cscheme)
end
finish()
println("image saved in $(fname)")
preview()
