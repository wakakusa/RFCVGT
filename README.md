# RFCVGT
このパッケージは、ランダムフォレストのパラメータを決定する際に利用するグリッドチューンとクロスバリデーションを一括実行できるようにパッケージ化したものです。

## 注意
以下の変数は、２０１７年３月１日時点で固定で設定しています。  
  * Ytraining：従属変数  
  * Xtraining：説明変数  


## 使い方
using RFCVGT  
using Base.Test

using RDatasets
iris = dataset("datasets", "iris");

### 判別分類
### 学習用データと検証用データに分ける
using SamplingDataFrame
dataindex=TestDataSetsNumbering(iris,PERCENTAGE=0.85)
#### 学習用
training=iris[dataindex["TrainingNumbering"] ,:];
#### 検証用
test=iris[dataindex["TestNumbering"] ,:];


### 目的変数の列番号を指定
yind=[5];  
### 説明変数の列番号を指定
xind=convert(Array,1:4);  


### パッケージがデータを扱えるように変換
Ytraining=convert(Array , training[:,yind] );  
Xtraining=convert(Array , training[:,xind] );  

### パラメータサーチ
r=rfcvgt(nfeature=[1,2,4],ntree=[250,500])


### 回帰
### テスト用データ
x1=[1,11,11,3,1,2,21,1,11,10];  
x2=[29,31,56,71,31,54,47,40,66,68];  
x3=[15,8,8,17,22,18,4,23,9,8];  
x4=[52,47,20,6,44,22,26,34,12,12];  
y=[74.3,87.6,104.3,102.7,72.5,93.1,115.9,83.8,113.3,109.4];  

ds=DataFrame(y=y,x1=x1,x2=x2,x3=x3,x4=x4)

### 検証用データ
newx1=[7,7,11];  
newx2=[26,52,55];  
newx3=[6,6,9];  
newx4=[60,33,22];  
newy=[78.5,95.9,109.2];  
newX = DataFrame(x1=newx1,x2=newx2,x3=newx3,x4=newx4)  

### ランダムフォレスト用に変換
Ytraining=convert(Array,ds[:,:y])  
Xtraining=convert(Array,ds[:,[:x1,:x2,:x3,:x4]])  
newXrf=convert(Array,newX)  

### パラメータサーチ
r=rfcvgt()
