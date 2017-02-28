#gridtuneの評価関数の定義
function evalfun(scores;CV_n=10)
  if(typeof(Y_train) == Array{Float64,1}||typeof(Y_train) == Array{Float64,2})
    return CV_n/sum(scores)
  else
    return mean_and_std(scores)
  end
end 


function evalfun(scores,Y_train;CV_n=10)
  if(typeof(Y_train) == Array{Float64,1}||typeof(Y_train) == Array{Float64,2})
    return CV_n/sum(scores)
  else
    return mean_and_std(scores)
  end
end 
