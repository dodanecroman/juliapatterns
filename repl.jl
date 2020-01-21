# 1 create template of the package for Calculator
using PkgTemplates

template = Template(; license = "MIT", user = "dodanecroman", dir = "./")


# 2 generate the package Calculator.jl
generate(template, "Calculator")


"""
Designing abstract and concrete types
"""

abstract type Asset end

abstract type Property <: Asset end
abstract type Investment <: Asset end
abstract type Cash <: Asset end
