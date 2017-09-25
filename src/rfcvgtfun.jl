#クロスバリデーションとグリッドチューンを同時実行する関数
function searchparm(Y,X;nfeature=0,ntree=[500,1000],nrate=[0.7],CV_n=5)
  Ytraining=Y;
  Xtraining=X;
  CV_n=CV_n;

  #ランダムフォレストによる予測モデルの構築およびクロスバリデーションの実行
  estfun=Estfun(Ytraining,Xtraining,CV_n)

  #評価関数の定義
  evalfun=Evalfun(Ytraining,Xtraining,CV_n)

  #パラメータの自動算定
  if(nfeature==0)
    if(Integer(round(size(Xtraining)[2]/3,0)) == 0)
      nfeature=[1,Integer(round(sqrt(size(Xtraining)[2]),0)) ,size(Xtraining)[2]]
    else
      point1=Integer(round(size(Xtraining)[2]/3,0))
      point2=Integer(round(sqrt(size(Xtraining)[2]),0))
      nfeature=[1,2,Integer(round((point1+2)/2)),point1,Integer(round((point1+point2)/2)),point2,Integer(round((size(Xtraining)[2]+point2)/2)),size(Xtraining)[2]]
    end

     #特徴量の重複を除去
    nfeature=DataFrames.DataFrame(ind=nfeature)
    nfeature=DataFrames.by(nfeature, :ind, df -> size(df, 1))
    nfeature=convert(Array,nfeature[:,:ind])
    nfeature=sort(nfeature,rev=true)

  end

  # グリッドサーチの実行
  return  r=gridtune(estfun , evalfun,
                        ( "nfeature",nfeature ) ,
                        ( "ntree",ntree ) ,
                        (" nrate",nrate ) ;
                        verbose=true) 
                        
end
