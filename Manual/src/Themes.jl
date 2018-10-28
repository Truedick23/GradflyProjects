using Gadfly, RDatasets
mammals = dataset("MASS", "mammals")
plot(mammals, x=:Body, y=:Brain, label=:Mammal,
    Geom.point, Geom.label, Scale.x_log10, Scale.y_log10,
    Theme(discrete_highlight_color=x->"red", default_color="white")) |> SVG("Manual\\Resources\\Themes1.svg", 6inch, 4inch)

latex_fonts = Theme(major_label_font="CMU Serif", major_label_font_size=16pt,
              minor_label_font="CMU Serif", minor_label_font_size=14pt,
              key_title_font="CMU Serif", key_title_font_size=12pt,
              key_label_font="CMU Serif", key_label_font_size=10pt)
Gadfly.push_theme(latex_fonts)
gasoline = dataset("Ecdat", "Gasoline")
p = plot(gasoline, x=:Year, y=:LGasPCar, color=:Country, Geom.point, Geom.line)
p |> SVG("Manual\\Resources\\Themes2.svg")
Gadfly.pop_theme()

Gadfly.push_theme(style(line_width=1mm))
p1 = plot([sin,cos,tan], 0, 2pi)
p2 = plot([sin,cos,tan], 0, 2pi, style(line_width=2mm, line_style=[:dash]))
fig = hstack(p1, p2)
fig |> SVG("Manual\\Resources\\Themes3.svg")
Gadfly.pop_theme()

Gadfly.get_theme(::Val{:orange}) = Theme(default_color="orange")
Gadfly.with_theme(:orange) do
    p = plot(dataset("datasets", "iris"), x=:SepalWidth, Geom.bar)
    p |> SVG("Manual\\Resources\\Themes4.svg")
end

Gadfly.with_theme(:dark) do
    p = plot(dataset("datasets", "iris"), x=:SepalLength, y=:SepalWidth, color=:Species)
    p |> SVG("Manual\\Resources\\Themes5.svg")
end
