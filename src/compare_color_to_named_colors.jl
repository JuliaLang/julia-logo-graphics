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

Drawing(800, 1000, "/tmp/julia-colors-new.png")
background("white")
fontsize(24)
sethue("black")
text("Julia logo colors and nearest named equivalents", 400, 40, halign=:center)
fontsize(12)
nearestlist = findnearestcolors()

boldtext(string, position) = begin
    setcolor("black")
    fontsize(12)
    fontface("Helvetica-Bold")
    text(string, position)
    end

regulartext(string, position) = begin
    setcolor("black")
    fontsize(10)
    fontface("Menlo")
    text(string, position)
    end

translate(100, 150)
grid = Grid(O, 400, 200, 800, 800) 

for n in nearestlist
    originalcolor = n[1]
    originalcolorname = n[2]
    nearestcolorname = n[3]
    distance = n[4]
    nearestRGB = n[5]
    p = nextgridpoint(grid)
    # original color
    setcolor(originalcolor...)
    diskradius = 120
    ellipse(p, diskradius, diskradius, :fill)    
    # label
    gsave()
        translate(100, -20)
        list1 = Grid(O, 0, 20, 0)
        boldtext(originalcolorname, p + nextgridpoint(list1))
        regulartext(string(originalcolor), p + nextgridpoint(list1))
    grestore()

    # replacement color
    gsave()
        translate(50, 50)
        sethue("white")
        diskradius = 90
        ellipse(p, diskradius, diskradius, :fill)
        diskradius = 80
        setcolor(nearestRGB)
        ellipse(p, diskradius, diskradius, :fill)
        # label
        gsave()
            translate(50, -20)
            list1 = Grid(O, 0, 20, 0)
            boldtext(nearestcolorname, p + nextgridpoint(list1))
            regulartext(string(nearestRGB), p + nextgridpoint(list1))
        grestore()
    grestore()
end

finish()
preview()
