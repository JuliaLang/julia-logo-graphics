#!/usr/local/bin/julia

using Colors, FixedPointNumbers

function compare_colors(color_a, color_b)
    return colordiff(color_a, color_b)
end

function findnearest(col::Color, acols)
    dists = Float64[]
    for (n, color) in enumerate(acols)
        push!(dists, compare_colors(col, color))
    end
    return findmin(dists) #, dists, acols[findmin(dists)]
end

convert256color(n) = RGB{UFixed8}(n[1]/256, n[2]/256, n[3]/256)

function findnearestcolors()
    colornamekeys = collect(keys(Colors.color_names))
    namedcols = map(convert256color, collect(values(Colors.color_names)))
    
    darker_blue      = (0.251, 0.388, 0.847)
    lighter_blue     = (0.4, 0.51, 0.878)
    darker_purple    = (0.584, 0.345, 0.698)
    lighter_purple   = (0.667, 0.475, 0.757)
    darker_green     = (0.22, 0.596, 0.149)
    lighter_green    = (0.376, 0.678, 0.318)
    darker_red       = (0.796, 0.235, 0.2)
    lighter_red      = (0.835, 0.388, 0.361)
    
    juliacolors = [darker_blue, lighter_blue, darker_purple, lighter_purple, darker_green, lighter_green, darker_red, lighter_red]
    juliacolornames = ["darker_blue", "lighter_blue", "darker_purple", "lighter_purple", "darker_green", "lighter_green", "darker_red", "lighter_red"]
    
    results = []
    
    for (n, juliacolorname) in enumerate(juliacolornames)
        juliacolor = juliacolors[findfirst(juliacolornames, juliacolorname)]
        dist, indx = findnearest(RGB(juliacolor...), namedcols)
        col = colornamekeys[indx]
        push!(results, (juliacolor, juliacolorname, colornamekeys[indx], dist, convert256color(Colors.color_names[col])))
    end
    return results
end

using Luxor

Drawing("A4", "/tmp/julia-colors.png")
background("white")
origin()
fontsize(20)
sethue("black")
text("Julia logo colors and nearest named equivalents", 0, -paper_sizes["A4"][2]/2 + 30, halign=:center)
fontsize(12)
tiles = Tiler(currentdrawing.width, currentdrawing.height, 4, 2, margin=30)
nearestlist = findnearestcolors()
for (pos, n) in tiles
    thiscolor = nearestlist[n]
    originalcolor = thiscolor[1]
    originalcolorname = thiscolor[2]
    nearestcolorname = thiscolor[3]
    distance = thiscolor[4]
    nearestRGB = thiscolor[5]
    
    n % 2 == 1 ? diskradius = 80 : diskradius = 60
    # original color
    setcolor(originalcolor...)
    ellipse(Point(pos.x-40, pos.y-40), diskradius, diskradius, :fill)    
    # replacement color
    setcolor(nearestRGB)
    ellipse(Point(pos.x+40, pos.y+40), diskradius, diskradius, :fill)
    gsave()
    translate(Point(pos.x-120, pos.y-60))
    setcolor("black")
    translate(0, tiles.tileheight/2)    
    fontsize(12)
    fontface("Helvetica-Bold")
    text(originalcolorname, Point(O.x, 0))
    text(nearestcolorname, Point(O.x, 30))
    fontface("Helvetica")
    fontsize(11)
    text(string(originalcolor), Point(O.x, 10))
    text(string(nearestRGB), Point(O.x, 40))
    grestore()
end

finish()
preview()
