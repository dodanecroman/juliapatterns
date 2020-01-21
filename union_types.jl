include("abstract_types.jl")

# concrete types

struct Stock <: Equity
    symbol::String
    name::String
end

# new hierarchy

abstract type Art end

struct Painting <: Art
    artist::String
    title::String
end

# union type
struct BasketOfThings
    things::Vector{Union{Painting, Stock}}
    reason::String
end

#= REPL
julia> stock = Stock("AAPL", "Apple, Inc.",)
Stock("AAPL", "Apple, Inc.")
julia> monalisa = Painting("Leonardo da Vinci", "Monalisa")
Painting("Leonardo da Vinci", "Monalisa")
julia> things = Union{Painting,Stock}[stock, monalisa]
2-element Array{Union{Painting, Stock},1}:
 Stock("AAPL", "Apple, Inc.")
 Painting("Leonardo da Vinci", "Monalisa")
julia> present = BasketOfThings(things, "Anniversary gift for my wife")
BasketOfThings(Union{Painting, Stock}[Stock("AAPL", "Apple, Inc."), Painting("Leonardo da Vinci", "Monalisa")], "Anniversary gift for my wife")
=#

# easier to read :-
# easier to read :-)

const Thing = Union{Painting,Stock}

struct BasketOfThings
    thing::Vector{Thing}
    reason::String
end
