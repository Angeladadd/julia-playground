z = (x=1;y=2;x+y)
println(z)

function f(x)
    x^2
end

t(x) = (f(x); x^3)
println(t(2))
@show t(2)

file = open("input.txt", "r")
@show readlines(file)

# TODO: try network IO & parallel computing