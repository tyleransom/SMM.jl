
module MOpt

# Dependencies
# ############

using Distributions, HDF5
using Reexport
@reexport using DataFrames
import Base.show, Base.transpose

# exports
# ############

export MProb, 
       Chain,  
       BGPChain,  
       MAlgo,
       MAlgoBGP,
       Testobj, 
       getindex,
       setindex,
       parameters,
       evals,
       infos,
       allstats,
       moments,
       hist,
       runMOpt!,
       save,
       slices,
       transpose


# load files
# ############

include("mopt/mprob.jl")
include("mopt/chains.jl")
include("mopt/incmopt.jl")
include("mopt/AlgoAbstract.jl")
include("mopt/AlgoBGP.jl")

if Sys.OS_NAME == :Darwin
       include("mopt/plotting.jl")
end


end 	# module




