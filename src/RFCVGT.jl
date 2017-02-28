module RFCVGT
__precompile__()
# package code goes here
using DataFrames,DecisionTree,MLBase

export build_forest,apply_forest,gridtune
export unievalfun,estfun,evalfun,gridsearch,rfcvgt

include("estfun.jl")
include("unievalfun.jl")
include("evalfun.jl")
include("gridsearch.jl")
include("rfcvgtfun.jl")
end # module
