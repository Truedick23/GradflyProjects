using Gadfly, RDatasets

iris = dataset("datasets", "iris")
SepalLength = iris[:SepalLength]
SepalWidth = iris[:SepalWidth]
PetalLength = iris[:PetalLength]
PetalWidth = iris[:PetalWidth]
Color = iris[:Species]
'''
plot(x=SepalLength, y=SepalWidth, color=Color, Geom.point,
    Guide.xlabel("SepalLength"), Guide.ylabel("SepalWidth"),
    Guide.colorkey(title="Species"))
'''

mammals = dataset("MASS", "mammals")
# plot(mammals, x=:Body, y=:Brain, label=:Mammal, Geom.point, Geom.label,
#      Scale.x_log10, Scale.y_log10)

gasoline = dataset("Ecdat", "Gasoline")
# plot(gasoline, x=:Year, y=:LGasPCar, color=:Country, Geom.point, Geom.line)

fig1a = plot(iris, x=:SepalLength, y=:SepalWidth, Geom.point)
fig1b = plot(iris, x=:SepalWidth, Geom.bar)
fig1 = hstack(fig1a, fig1b)
