#!/usr/local/bin/julia

#=
Find the named colors in Colors.jl nearest to the colors used by Julia's logo.
More exact matches can be found if you use NamedColors.jl.
=#

# Use either the basic colors in Colors.jl or the big collection in NamedColors.jl

USE_NAMED_COLORS = false

using Colors, FixedPointNumbers, NamedColors, Luxor

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

function convertcolorvalues(c)
   if typeof(c) == Tuple{Int64, Int64, Int64}
        convertedcolor = RGB{Float64}(c[1]/256, c[2]/256, c[3]/256)
   else
        convertedcolor = convert(RGB{Float64}, c)
   end
   return convertedcolor
end

function findnearestcolors(colornamelist, colorvaluelist)
    results = []
    for (n, juliacolorname) in enumerate(juliacolornames)
        juliacolor = juliacolors[findfirst(isequal(juliacolorname), juliacolornames)]
        dist, indx = findnearest(RGB(juliacolor...), colorvaluelist)
        nearestcolname = colornamelist[indx]
        push!(results, (juliacolor, nearestcolname, dist))
    end
    return results
end

# definitions for the Julia colors
const darker_blue      = (0.251, 0.388, 0.847)
const lighter_blue     = (0.4, 0.51, 0.878)
const darker_purple    = (0.584, 0.345, 0.698)
const lighter_purple   = (0.667, 0.475, 0.757)
const darker_green     = (0.22, 0.596, 0.149)
const lighter_green    = (0.376, 0.678, 0.318)
const darker_red       = (0.796, 0.235, 0.2)
const lighter_red      = (0.835, 0.388, 0.361)
const juliacolors      = [darker_blue, lighter_blue, darker_purple, lighter_purple, darker_green, lighter_green, darker_red, lighter_red]
const juliacolornames  = ["darker_blue", "lighter_blue", "darker_purple", "lighter_purple", "darker_green", "lighter_green", "darker_red", "lighter_red"]

if USE_NAMED_COLORS
    # standard color lists
    const namedcolnames  = collect(collect(keys(ALL_COLORS)))
    const namedcolvalues = map(convertcolorvalues, collect(values(ALL_COLORS)))
else
    # or use the colors in NamedColors
    const namedcolnames  = collect(keys(Colors.color_names))
    const namedcolvalues = map(convertcolorvalues, collect(values(Colors.color_names)))
end

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

Drawing(800, 1000, "/tmp/julia-colors-new.png")
background("white")
fontsize(24)
sethue("black")
text("Julia logo colors and nearest named equivalents", 400, 40, halign=:center)
fontsize(12)
translate(100, 150)
grid = GridRect(O, 400, 200, 600)

nearestlist = findnearestcolors(namedcolnames, namedcolvalues)

# display the results

for n in nearestlist
    originalcolor = n[1]
    nearestcolorname = n[2]
    distance = n[3]
    juliacolor = juliacolornames[findfirst(isequal(originalcolor), juliacolors)]
    nearestcolor = namedcolvalues[findfirst(isequal(nearestcolorname), namedcolnames)]

    p = nextgridpoint(grid)

    gsave()
        # original color
        setcolor(originalcolor...)
        diskradius = 120
        ellipse(p, diskradius, diskradius, :fill)

        # label
        gsave()
            translate(100, -20)
            list1 = GridRect(O, 0, 20, 0)
            boldtext(juliacolor, p + nextgridpoint(list1))
            regulartext(string(originalcolor), p + nextgridpoint(list1))
        grestore()

        # replacement color
        gsave()
            translate(50, 50)
            sethue("white")
            diskradius = 90
            ellipse(p, diskradius, diskradius, :fill)
            diskradius = 80
            setcolor(nearestcolor)
            ellipse(p, diskradius, diskradius, :fill)
            # label
            gsave()
                translate(50, -20)
                list1 = GridRect(O, 0, 20, 0)
                boldtext(nearestcolorname, p + nextgridpoint(list1))
                nearestcolorvalue = convert(RGB{N0f8}, nearestcolor)
                regulartext(string(nearestcolorvalue), p + nextgridpoint(list1))
            grestore()
        grestore()

        # hex color
        gsave()
            fontsize(20)
            fontface("AvenirNext-Bold")
            translate(100, 40)
            colhex = Colors.hex(RGB(originalcolor...))
            text(string("#", colhex), p + nextgridpoint(list1))
        grestore()

    grestore()
end

finish()
preview()
