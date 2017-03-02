### グリッドサーチ+クロスバリデーションの実行 ### 
function searchparm(Y,X;nfeature=0,ntree=[500,1000],nrate=[0.7],CV_n=5)
  Ytraining=Y;
  Xtraining=X;

  # クロスバリデーションの評価関数
  function unievalfun(model,inds)
    ## 予測
    pred =apply_forest(model,Xtraining[inds,:])

    if(typeof(Ytraining) == Array{Float64,1}||typeof(Ytraining) == Array{Float64,2})
    ## 回帰式の評価式
      prec=sum(abs(Ytraining[inds,1] - pred))
    else
    ## 判別分類の評価式
      conf_mat=confusion_matrix(Ytraining[inds,1],pred).matrix
      prec=trace(conf_mat)/sum(conf_mat)
    end

    return prec

  end

  # ランダムフォレストによる予測モデルの構築およびクロスバリデーションの実行
  function estfun(nfeature,ntree,nrate)
    ##ランダムフォレストによる予測モデルの構築
    function trainfun(inds)
      model = build_forest(Ytraining[inds,1] , Xtraining[inds,:],nfeature,ntree,nrate)
      return model
    end

    n =size(Xtraining)[1]

    ##クロスバリデーションの実行
    scores = cross_validate(
                                            inds -> trainfun(inds),
                                            (model,inds) -> unievalfun(model , setdiff(1:n , inds) ),
                                            n,
                                            Kfold(n,CV_n)
                                          )

    return scores
  end

  #評価関数の定義
  function evalfun(scores)
    if(typeof(Ytraining) == Array{Float64,1}||typeof(Ytraining) == Array{Float64,2})
      return CV_n/sum(scores)
    else
      return mean_and_std(scores)
    end
  end

  # グリッドサーチの実行
    if(nfeature==0)
      if(Integer(round(size(Xtraining)[2]/3,0)) == 0)
        nfeature=[1,Integer(round(sqrt(size(Xtraining)[2]),0)) ]
      else
        nfeature=[Integer(round(size(Xtraining)[2]/3,0)),Integer(round(sqrt(size(Xtraining)[2]),0))]
      end
    end

  r = gridtune(estfun , evalfun,
                        ( "nfeature",nfeature ) ,
                        ( "ntree",ntree ) ,
                        (" nrate",nrate );
                        verbose=true)
                        
  return r
end
