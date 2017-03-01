#クロスバリデーションとグリッドチューンを同時実行する関数
function rfcvgt(;nfeature=0,ntree=[500,1000],nrate=[0.7])
 return gridsearch(;nfeature=nfeature,ntree=ntree,nrate=nrate) 
end

function rfcvgt(Y_train,X_train;nfeature=0,ntree=[500,1000],nrate=[0.7])
 Y_train=Y_train;
 X_train=X_train;
 
#  include(string(Pkg.dir(),"/RFCVGT/src/unievalfun.jl"))
#  include(string(Pkg.dir(),"/RFCVGT/src/evalfun.jl"))
#  include(string(Pkg.dir(),"/RFCVGT/src/estfun.jl"))
#  include(string(Pkg.dir(),"/RFCVGT/src/gridsearch.jl"))

 return gridsearch(;nfeature=nfeature,ntree=ntree,nrate=nrate)
  
end
