#!/usr/bin/env julia

using Luxor

Drawing(700, 450, "/tmp/fontsample.png")
background("white")
sethue("black")
fontface("TamilMN-Bold")

fontsize(40)
x = 100
y = 100
for i in 65:124
    if isalpha(Char(i))
    text(string(Char(i)), Point(x, y), halign=:center)
    x += 40
    if x > 600
        x = 100
        y += 45
    end
    end
end

fontsize(100)
text("julia", 350, y+100, halign=:center)

finish()
preview()

 