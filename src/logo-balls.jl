#!/usr/bin/env julia

using Luxor, Colors

function julia_balls()
  # get centers for the three balls
  points = reverse(ngon(0, 0, 100, 3, pi/6 #= orientation =#,  vertices=true))
  gsave()
  #  setcolor(0.251, 0.388, 0.847)   # the darker blue not used
  #  setcolor(0.4, 0.51, 0.878)      # the lighter blue not used
  setcolor(0.584, 0.345, 0.698)      # darker purple
  circle(points[1], 75, :fill)
  setcolor(0.667, 0.475, 0.757)      # lighter purple
  circle(points[1], 65, :fill)
  setcolor(0.22, 0.596, 0.149)       # darker green
  circle(points[2], 75, :fill)
  setcolor(0.376, 0.678, 0.318)      # lighter green
  circle(points[2], 65, :fill)
  setcolor(0.796, 0.235, 0.2)        # darker red
  circle(points[3], 75, :fill)
  setcolor(0.835, 0.388, 0.361)      # lighter red
  circle(points[3], 65, :fill)
  grestore()
end

# no background -> transparent png!
Drawing(500, 500, "/tmp/juliaballs.png")
origin()
julia_balls()
finish()
preview()
