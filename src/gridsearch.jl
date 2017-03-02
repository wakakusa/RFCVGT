# グリッドサーチの実行
function Gridserch(Ytraining,Xtraining)
  Ytraining=Ytraining
  Xtraining=Xtraining

  return function gridsearch(;nfeature=0,ntree=[500,1000],nrate=[0.7])
    r=gridtune(estfun , evalfun,
                        ( "nfeature",nfeature ) ,
                        ( "ntree",ntree ) ,
                        (" nrate",nrate ) ;
                        verbose=true) 
    return r
  end
end

