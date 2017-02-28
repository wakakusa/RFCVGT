#クロスバリデーションの評価関数
function unievalfun(model,inds)
  ##予測
  pred =apply_forest(model,X_train[inds,:])

  if(typeof(Y_train) == Array{Float64,1}||typeof(Y_train) == Array{Float64,2})
  ##回帰式の評価式
    prec=sum(abs(Y_train[inds,1] - pred))
  else
  ##判別分類の評価式
    conf_mat=confusion_matrix(Y_train[inds,1],pred).matrix
    prec=trace(conf_mat)/sum(conf_mat)
  end

  return prec

end


function unievalfun(model,inds,Y_train,X_train)
  ##予測
  pred =apply_forest(model,X_train[inds,:])

  if(typeof(Y_train[inds,:]) == Array{Float64,1}||typeof(Y_train) == Array{Float64,2})
  ##回帰式の評価式
    prec=sum(abs(Y_train[inds,1] - pred))
  else
  ##判別分類の評価式
    conf_mat=confusion_matrix(Y_train[inds,1],pred).matrix
    prec=trace(conf_mat)/sum(conf_mat)
  end

  return prec

end
