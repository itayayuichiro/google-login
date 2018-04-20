# LINE アフィリエイトAIP ドキュメント
LINEアフィリエイトAPIのドキュメントです。

## 概要
このAPIを使うと、LINE TIMELINEの情報と連携が行えます。

具体的な機能としては

* 公式アカウントとの友達追加状況を取得する
* 公式アカウントを友達追加する

## 仕様

### エンドポイント

http://stads.dataprovider.tokyo:4567/ 配下に各種APIが用意されています。

### 認証

Basic認証を設定しているので、リクエストを送る際には以下のID:パスワードを使って認証をしてください。

* ID：rooter
* パスワード：rooter!

curlの場合

```
curl -u rooter:rooter! 'http://stads.dataprovider.tokyo:4567/*'
```

### レスポンス

JSON形式でレスポンスを返します。


## API

### 公式アカウント情報取得

* [POST /login_api](login_api.md) - その性別＆年代にあった公式アカウントの一覧を取得

### 公式アカウント友達追加

* [POST /friend_api](friend_api.md) - 特定の公式アカウントを友達追加


