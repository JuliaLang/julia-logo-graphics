#=

Find the named colors in Colors.jl nearest to the colors used by Julia's logo.

=#

using Luxor, Colors

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

function findnearestcolors(colornamelist, colorvaluelist, juliacolornames)
    results = []
    for (n, juliacolorname) in enumerate(juliacolornames)
        juliacolor = Base.eval(Luxor, juliacolornames[n])
        dist, indx = findnearest(RGB(juliacolor...), colorvaluelist)
        nearestcolname = colornamelist[indx]
        push!(results, (juliacolor, nearestcolname, dist))
    end
    return results
end

function drawpanel(pt, topcolorswatchname, bottomcolorswatchname, captions)
    @layer begin
        translate(pt)
        tiles = Tiler(panels.tilewidth, panels.tileheight, 2, 2, margin=25)
        for (pt1, n1) in tiles
            if n1 == 1     # top swatch
                setcolor(Base.eval(Luxor, topcolorswatchname))
                circle(pt1, tiles.tileheight * 8//9, :fill)
            elseif n1 == 3 # bottom swatch
                setcolor("white")
                circle(pt1 + (15, 0), tiles.tileheight * 5//9, :fill)
                setcolor(Base.eval(Luxor, bottomcolorswatchname))
                circle(pt1 + (15, 0), tiles.tileheight * 4//9, :fill)
            elseif n1 == 2 # captions
                lines = Tiler(tiles.tilewidth, panels.tileheight, 8, 1)
                sethue("black")
                fontface("InputMonoCompressed-Bold")
                fontsize(16)
                text(captions[1], lines[1][1]) # the Julia name
                @layer begin
                    setcolor(Base.eval(Luxor, topcolorswatchname))
                    text(captions[2], lines[2][1]) # the hex
                end
                text(captions[3], lines[3][1]) # the RGB
                fontsize(10)
                fontface("InputMonoCompressed")
                text(captions[4], lines[4][1])
                text(captions[5], lines[5][1]) # nearest name
                text(captions[6], lines[6][1]) # and its RGB
            end
        end
    end
end

# predefined in Luxor
const juliacolornames = [
    :darker_blue,
    :lighter_blue,
    :darker_green,
    :lighter_green,
    :darker_purple,
    :lighter_purple,
    :darker_red,
    :lighter_red, ]

# find the nearest named colors to the Julia colors
namedcolnames  = collect(keys(Colors.color_names))
namedcolvalues = map(convertcolorvalues, collect(values(Colors.color_names)))
nearestlist = findnearestcolors(namedcolnames, namedcolvalues, juliacolornames)

@svg begin
    panels = Tiler(800, 800, 4, 2)
    for (pt, n) in panels
        juliacolorname   = juliacolornames[n]
        juliacolorvalue  = Base.eval(Luxor, juliacolorname)
        nearestcolorname = nearestlist[n][2]
        nearestcolorvalue = parse(Colorant, nearestcolorname)
        nearestcolorvalueasstring = string("RGB", map(c -> round(Float64(c), digits=3), (nearestcolorvalue.r, nearestcolorvalue.g, nearestcolorvalue.b)))
        juliacolorashexstring = Colors.hex(RGB(juliacolorvalue...))
        drawpanel(pt,
            # two color swatches
            juliacolorname,
            nearestcolorname,
            # six captions
            [string(juliacolornames[n]),            # "Julia" name
             string("#", juliacolorashexstring),    # as hex
             string("RGB",juliacolorvalue),         # as RGB values
             " - nearest named color is",
             string("\"", nearestlist[n][2], "\""), # nearest named color name
             nearestcolorvalueasstring,             # as RGB values
             ])
    end
end 800 800 "/tmp/julia_color_chart.svg"
