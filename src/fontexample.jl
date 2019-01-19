#!/usr/bin/env julia

using Luxor

function main()
    Drawing(700, 450, "/tmp/fontsample.svg")
    background("white")
    sethue("black")
    fontface("MyanmarMN-Bold")

    fontsize(40)
    x = 100; y = 100
    for i in 65:124
        if isletter(Char(i))
            text(string(Char(i)), Point(x, y), halign=:center)
            x += 40
            if x > 600
                x = 100
                y += 45
            end
        end
    end

    fontsize(140)
    text("julia", Point(350, y+120), halign=:center)

    finish()
    preview()
end

main()
