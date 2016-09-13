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

function randomsine(func, vertscale, horizontalscale, pagewidth, pageheight, style, delta=0.1)
    # y is positive downwards...
    pl = Point[]
    xc=delta
    if rand(Bool)
        for i in -pagewidth/2:delta:pagewidth/2
            push!(pl, Point(i, vertscale * -func(i/horizontalscale) * func(3 * i/horizontalscale) * func(i/horizontalscale)))
        end
    else
        for i in -pagewidth/2:delta:pagewidth/2
            push!(pl, Point(i, vertscale * -func(i / horizontalscale)))
        end
    end
    poly(pl, close=false, style)
end

function julia_balls_mask()
  points = reverse(ngon(0, 0, 100, 3, pi/6, vertices=true))
  circle(points[1], 65, :path)
  newsubpath()
  circle(points[2], 65, :path)
  newsubpath()
  circle(points[3], 65, :path)
end

function diffeqlogo(fname)
  pagewidth, pageheight = 400, 400
  Drawing(pagewidth, pageheight, fname)
  origin()
  background("white")

  # 1 : the three balls
  julia_balls()

  # 2 : inserts
  julia_balls_mask()
  clip()
  setline(2)
  sethue("white")
  for i in -pageheight/2:25:pageheight/2
    gsave()
    translate(rand(-25:25), i)
    x_vals = -pagewidth/2:pi/48:pagewidth/2
    plist = [Point(d, 10 * sin(d) * sin(d/30)) for d in x_vals]
    poly(plist, :stroke)
    grestore()
  end
  clipreset()
  finish()
  println("image saved in $(fname)")
end

fname = "/tmp/more-diffeq-test.pdf"
diffeqlogo(fname)
preview()
