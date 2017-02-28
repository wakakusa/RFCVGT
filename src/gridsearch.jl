# グリッドサーチの実行
function gridsearch(;nfeature=0,ntree=[500,1000],nrate=[0.7])
  if(nfeature==0)
    if(Integer(round(size(X_train)[2]/3,0)) == 0)
      nfeature=[1,Integer(round(sqrt(size(X_train)[2]),0)) ]
    else
      nfeature=[Integer(round(size(X_train)[2]/3,0)),Integer(round(sqrt(size(X_train)[2]),0))]
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
function gridsearch(Y_train,X_train;nfeature=0,ntree=500,nrate=0.7)
  if(nfeature==0)
    if(Integer(round(size(X_train)[2]/3,0)) == 0)
      nfeature=[1,Integer(round(sqrt(size(X_train)[2]),0)) ]
    else
      nfeature=[Integer(round(size(X_train)[2]/3,0)),Integer(round(sqrt(size(X_train)[2]),0))]
    end
  end

  r=gridtune(estfun , evalfun,
                        ( "nfeature",nfeature ) ,
                        ( "ntree",ntree ) ,
                        (" nrate",nrate ) ,
                        ("Y_train",Y_train),
                        ("X_train",X_train);
                        verbose=true) 
  return r
end
