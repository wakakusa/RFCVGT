# グリッドサーチの実行
function gridsearch(;nfeature=0,ntree=[500,1000],nrate=[0.7])
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

##以下の関数はestfunの処理でエラーが発生するため、修正中
function gridsearch(Ytraining,Xtraining;nfeature=0,ntree=500,nrate=0.7)
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
                        (" nrate",nrate ) ,
                        ("Ytraining",Ytraining),
                        ("Xtraining",Xtraining);
                        verbose=true) 
  return r
end
