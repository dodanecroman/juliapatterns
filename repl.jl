# 1 create template of the package for Calculator
using PkgTemplates

template = Template(; license = "MIT", user = "dodanecroman", dir = "./")


# 2 generate the package Calculator.jl
generate(template, "Calculator")


"""
Designing abstract and concrete types
"""
# defining abstract types
abstract type Asset end

abstract type Property <: Asset end
abstract type Investment <: Asset end
abstract type Cash <: Asset end

abstract type House <: Property end
abstract type Apartment <: Property end

abstract type FixedIncome <: Investment end
abstract type Equity <: Investment end

# navigatind the type hierarchy
subtypes(Asset)
println(subtypes(Asset))

supertype(Equity)
println(supertype(Equity))

# Display the entire type hirarchy starting from the specified `toottype`
function subtypetree(roottype, level = 1, indent = 4)
    level == 1 && println(roottype)
    for s in subtypes(roottype)
        println(join(fill(" ", level * indent)) * string(s))
        subtypetree(s, level + 1, indent)
    end
end


# simple functions on abstract types
# descriptive functions
describe(a::Asset) = "Something valuable"
describe(e::Investment) = "Finantial investment"
describe(e::Property) = "Physical property"


# functional behavior
"""
    location(p::Property)
Returns the location of the property as a tuple of (latitude, longitude).
"""
location(p::Property) = error("Location is not defined in the concrete type")

# interactions between objects

function walking_distance(p1::Property, p2::Property)
    loc1 = location(p1)
    loc1 = location(p2)
    return abs(loc1.x - loc2.x) + abs(loc1.y - loc2.y)
end
