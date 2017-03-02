#gridtuneの評価関数の定義

function Evalfun(Ytraining,Xtraining,CV_n)
  Ytraining=Ytraining
  Xtraining=Xtraining

  return function evalfun(scores)
    if(typeof(Ytraining) == Array{Float64,1}||typeof(Ytraining) == Array{Float64,2})
      return CV_n/sum(scores)
    else
      return mean_and_std(scores)
    end
  end
end

