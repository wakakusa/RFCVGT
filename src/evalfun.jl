#gridtuneの評価関数の定義
function evalfun(scores;CV_n=10)
  if(typeof(Ytraining) == Array{Float64,1}||typeof(Ytraining) == Array{Float64,2})
    return CV_n/sum(scores)
  else
    return mean_and_std(scores)
  end
end 


function evalfun(scores,Ytraining;CV_n=10)
  if(typeof(Ytraining) == Array{Float64,1}||typeof(Ytraining) == Array{Float64,2})
    return CV_n/sum(scores)
  else
    return mean_and_std(scores)
  end
end 
