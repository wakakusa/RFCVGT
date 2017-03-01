#ランダムフォレストによる予測モデルの構築およびクロスバリデーションの実行
function estfun(nfeature,ntree,nrate;CV_n=10)
  ##ランダムフォレストによる予測モデルの構築
  function trainfun(inds)
    model = build_forest(Ytraining[inds,1] , Xtraining[inds,:],nfeature,ntree,nrate)
    return model
  end

  n =size(Xtraining)[1]

  ##ここでクロスバリデーションの評価関数を定義
  #include(string(Pkg.dir(),"/RFCVGT/src/unievalfun.jl"))

  ##クロスバリデーションの実行
  scores = cross_validate(
                                            inds -> trainfun(inds),
                                            (model,inds) -> unievalfun(model , setdiff(1:n , inds) ),
                                            n,
                                            Kfold(n,CV_n)
                                          )

  return scores
end


function estfun(nfeature,ntree,nrate,Ytraining,Xtraining;CV_n=10)
  ##ランダムフォレストによる予測モデルの構築
  function trainfun(inds)
    model = build_forest(Ytraining[inds,1] , Xtraining[inds,:],nfeature,ntree,nrate)
    return model
  end

  n =size(Xtraining)[1]

  ##ここでクロスバリデーションの評価関数を定義
#  include(string(Pkg.dir(),"/RFCVGT/src/unievalfun.jl"))

  ##クロスバリデーションの実行
  scores = cross_validate(
                                            inds -> trainfun(inds),
                                            (model,inds) -> unievalfun(model , setdiff(1:n , inds) ),
                                            n,
                                            Kfold(n,CV_n)
                                          )

  return scores
end
