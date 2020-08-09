using Plots
gr()
using Images
using Interact
using Statistics

σ(x, w, b) = 1 / (1 + exp(-w * x + b))

cd("/home/dharma/work/book/courses/de-methods/students/git/intro_to_ML")
apple = load("data/10_100.jpg")
banana = load("data/104_100.jpg")
apple_green_amount = mean(Float64.(green.(apple)))
banana_green_amount = mean(Float64.(green.(banana)));

@manipulate for w = -10:0.01:30, b = 0:0.1:30
    plot(x -> σ(x, w, b), 0, 1, label = "Model", legend = :topleft, lw = 3)
    scatter!([apple_green_amount], [0.0], label = "Apple")
    scatter!([banana_green_amount], [1.0], label = "Banana")

end


L(w, b) =
    (0 - σ(apple_green_amount, w, b))^2 + (1 - σ(banana_green_amount, w, b))^2

w_range = 10:0.1:13
b_range = 0:1:20

L_values = [L(w, b) for b in b_range, w in w_range]

@manipulate for w in w_range, b in b_range
    p1 = surface(
        w_range,
        b_range,
        L_values,
        xlabel = "w",
        ylabel = "b",
        cam = (70, 40),
        cbar = false,
        leg = false,
    )
    scatter!(p1, [w], [b], [L(w, b) + 1e-2], markersize = 5, color = :blue)
    p2 = plot(x -> σ(x, w, b), 0, 1, label = "Model", legend = :topleft, lw = 3)
    scatter!(p2, [apple_green_amount], [0.0], label = "Apple", markersize = 10)
    scatter!(
        p2,
        [banana_green_amount],
        [1.0],
        label = "Banana",
        markersize = 10,
        xlim = (0, 1),
        ylim = (0, 1),
    )
    plot(p1, p2, layout = (2, 1))
end
