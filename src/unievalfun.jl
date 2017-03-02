#クロスバリデーションの評価関数
function Unievalfun(Ytraining,Xtraining)
  Ytraining=Ytraining
  Xtraining=Xtraining

  return function unievalfun(model,inds)
    ##予測
    pred =apply_forest(model,Xtraining[inds,:])

    if(typeof(Ytraining) == Array{Float64,1}||typeof(Ytraining) == Array{Float64,2})
    ##回帰式の評価式
      prec=sum(abs(Ytraining[inds,1] - pred))
    else
    ##判別分類の評価式
      conf_mat=confusion_matrix(Ytraining[inds,1],pred).matrix
      prec=trace(conf_mat)/sum(conf_mat)
    end

    return prec
  end
end

