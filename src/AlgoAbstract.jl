# the algorithm should be the object
# created by the user. This is where the 
# argument should be set.


# here is a list of potential options we want to set on each algo:

#   shock_var        :: Float64 # variance of shock
#   np_shock         :: Float64
#   save_freq        :: Int
#   N                :: Int   # number of chains
#   n_untempered     :: Int   # number of chains untemprered
#   maxiter          :: Int   # maximum number of iterations
#   run              :: Int   # number of run
#   i                :: Int   # ?

#   # cluster setup
#   mode             :: ASCIIString # {'serial','mpi'}

#   # paths for I/O
#   path :: ASCIIString # "where/to/save/this"

#   prepared      :: Bool
#   current_param :: Dict   # current parameter value
#   chains        :: MCMChain   # object of type MCMChain
# end




# define an abstract type and set/get for it
abstract type MAlgo

# getter and setters for Algo
function getindex(algo::MAlgo, key)
  return(algo.opts[key])
end

function setindex!(algo::MAlgo, val,key)
  algo.opts[key] = val
end

function computeNewGuess( algo::MAlgo  )
  error("computeNewGuess not implemented for this algorithm")
end


# An implementation example
# -------------------------

type MAlgoRandom <: MAlgo
  opts :: Dict	# list of options
  i    :: Int 	# iteration
  current_param :: Dict

  function MAlgoRandom(opts=["N"=>3,"shock_var"=>1.0,mode="serial"],current_param=["a"=>1.1,"b" => 1.3])
    return new(opts,0,current_param)
  end
end

function computeNewGuess( algo::MAlgoRandom  )
  algo.i = algo.i +1	# update iteration
  algo.current_param = algo.current_param + shock_var
end






