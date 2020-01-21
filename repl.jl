# 1 create template of the package for Calculator
using PkgTemplates

template = Template(; license = "MIT", user = "dodanecroman", dir = "./")


# 2 generate the package Calculator.jl
generate(template, "Calculator")
