# サーバーサイド実装するたびに追加
crumb :root do
  link "メルカリ", root_path
end

crumb :mypages do
  link "マイページ", mypages_path
end

crumb :cards_index do
  link "支払い方法", cards_path
  parent :mypages
end

crumb :cards_new do
  link "クレジットカード情報入力", new_card_path
  parent :cards_index
end

crumb :likes do
  link "いいね！一覧", likes_list_mypages_path
  parent :mypages
end

crumb :selling_list do
  link "出品した商品 - 出品中", selling_list_mypages_path
  parent :mypages
end

crumb :profile do
  link "プロフィール", '/mypages'
  parent :mypages
end

crumb :myconfirmation do
  link "本人情報の登録", myconfirmation_mypages_path
  parent :mypages
end

crumb :logout do
  link "ログアウト", root_path
  parent :mypages
end

crumb :category do |category|
  link category.name, category_path(category.id)

  if category.parent.present?
    parent category.parent
  end
end

crumb :product do |keyword|
  link "詳細検索"
end
