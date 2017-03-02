# グリッドサーチの実行
function Gridserch(Ytraining,Xtraining)
  Ytraining=Ytraining
  Xtraining=Xtraining

  return function gridsearch(;nfeature=0,ntree=[500,1000],nrate=[0.7])
    nfeature=nfeature
    ntree=ntree
    nrate=nrate

    if(nfeature==0)
      if(Integer(round(size(Xtraining)[2]/3,0)) == 0)
        nfeature=[1,Integer(round(sqrt(size(Xtraining)[2]),0)) ]
      else
        nfeature=[Integer(round(size(Xtraining)[2]/3,0)),Integer(round(sqrt(size(Xtraining)[2]),0))]
      end
    end

    r=gridtune(estfun , evalfun,
                        ( "nfeature",nfeature ) ,
                        ( "ntree",ntree ) ,
                        (" nrate",nrate ) ;
                        verbose=true) 
    return r
  end
end

