#ランダムフォレストによる予測モデルの構築およびクロスバリデーションの実行

function Estfun(Ytraining,Xtraining,CV_n)
  Ytraining=Ytraining
  Xtraining=Xtraining
  CV_n=CV_n

  # unievalfun(model,inds)
  unievalfun=Unievalfun(Ytraining,Xtraining)

  return function estfun(nfeature,ntree,nrate)
    ## ランダムフォレストによる予測モデルの構築
    function trainfun(inds)
      model = build_forest(Ytraining[inds,1] , Xtraining[inds,:],nfeature,ntree,nrate)
      return model
    end

    n =size(Xtraining)[1]

    ## クロスバリデーションの実行
    scores = cross_validate(
                                            inds -> trainfun(inds),
                                            (model,inds) -> unievalfun(model , setdiff(1:n , inds) ),
                                            n,
                                            Kfold(n,CV_n)
                                          )

    return scores
  end
end
