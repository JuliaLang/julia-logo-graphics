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

function diffeqlogo(fname)
  pagewidth, pageheight = 400, 400
  Drawing(pagewidth, pageheight, fname)
  origin()
  background("white")

  # 1 : background
  setopacity(0.3)
  sethue(RGB(0.4, 0.51, 0.878))
  circle(0, 0, 185, :fill)

  # 2 : the three balls
  setopacity(1)
  julia_balls()

  # 3 : spiral arms
  rotate(pi/6)
  pts= []
  num_spirals = 3 # number of spirals
  num_whirls = 4  # number of whirls in each spiral
  a = 100         # scale
  dt = 0.01
  # collect points
  for n = 1:num_spirals
      r = 0
      t = 0
      x0 = a * cos(2pi * n / num_spirals) #  coordinates of the center of one spiral
      y0 = a * sin(2pi * n / num_spirals)
      t1 = 2pi * num_whirls - pi/num_spirals + pi/2
      t2 = t1 + 2pi / num_spirals
      c = a * sin(pi/num_spirals) * 2/pi/(1 + 4 * num_whirls)
      while t <= t2
            t = t + dt # polar coordinates
            r = c * t
            x = x0 + r * cos(t + 2pi * n/num_spirals)
            y = y0 + r * sin(t + 2pi * n/num_spirals)
            push!(pts, Point(x, y))
            if t <= t1
                 x = x0 + r *cos(t + pi + 2pi * n/num_spirals)
                 y = y0 + r *sin(t + pi + 2pi * n/num_spirals)
                 push!(pts, Point(x, y))
            end
      end
  end
  # draw
  for p in pts
    sethue("white")
    circle(p, 1.5, :fill)
  end
  finish()
  println("image saved in $(fname)")
end

fname = "/tmp/diffeq-test.pdf"
diffeqlogo(fname)
preview()
