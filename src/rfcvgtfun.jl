#クロスバリデーションとグリッドチューンを同時実行する関数
function searchparm(Y,X;nfeature=0,ntree=[500,1000],nrate=[0.7],CV_n=5)
  Ytraining=Y;
  Xtraining=X;
  CV_n=CV_n;

  #ランダムフォレストによる予測モデルの構築およびクロスバリデーションの実行
  # estfun(nfeature,ntree,nrate)
  estfun=Estfun(Ytraining,Xtraining,CV_n)

  #評価関数の定義
  # evalfun(scores)
  evalfun=Evalfun(Ytraining,Xtraining,CV_n)

  # グリッドサーチの実行
  gridserch=Gridserch(Ytraining,Xtraining)
  return  r=gridtune(estfun , evalfun,
                        ( "nfeature",nfeature ) ,
                        ( "ntree",ntree ) ,
                        (" nrate",nrate ) ;
                        verbose=true) 
                        
end
