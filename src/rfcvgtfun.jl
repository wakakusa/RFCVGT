#クロスバリデーションとグリッドチューンを同時実行する関数
function rfcvgt(;nfeature=0,ntree=[500,1000],nrate=[0.7])
 return gridsearch(;nfeature=nfeature,ntree=ntree,nrate=nrate) 
end

function rfcvgt(Ytraining,X_trainXtraining;nfeature=0,ntree=[500,1000],nrate=[0.7])
 Ytraining=Ytraining;
 X_trainXtraining=X_trainXtraining;
 
#  include(string(Pkg.dir(),"/RFCVGT/src/unievalfun.jl"))
#  include(string(Pkg.dir(),"/RFCVGT/src/evalfun.jl"))
#  include(string(Pkg.dir(),"/RFCVGT/src/estfun.jl"))
#  include(string(Pkg.dir(),"/RFCVGT/src/gridsearch.jl"))

 return gridsearch(;nfeature=nfeature,ntree=ntree,nrate=nrate)
  
end
