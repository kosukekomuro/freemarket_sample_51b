# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
lady = Category.create(name: "レディース")
man = Category.create(name: "メンズ")
baby = Category.create(name: "ベビー・キッズ")
interior = Category.create(name: "インテリア・住まい・小物")
book = Category.create(name: "本・音楽・ゲーム")
toy = Category.create(name: "おもちゃ・ホビー・グッズ")
cosmetics = Category.create(name: "コスメ・香水・美容")
electronics = Category.create(name: "家電・スマホ・カメラ")
sport = Category.create(name: "スポーツ・レジャー")
handmade = Category.create(name: "ハンドメイド")
ticket = Category.create(name: "チケット")
car = Category.create(name: "自動車・オートバイ")
other = Category.create(name: "その他")


lady_tops = lady.children.create(name: "トップス")
lady_jacket = lady.children.create(name: "ジャケット/アウター")
lady_pants = lady.children.create(name: "パンツ")
lady_skirt = lady.children.create(name: "スカート")
lady_onepiece = lady.children.create(name: "ワンピース")
lady_shoes = lady.children.create(name: "靴")
lady_pajama = lady.children.create(name: "ルームウェア/パジャマ")
lady_legwear = lady.children.create(name: "レッグウェア")
lady_hat = lady.children.create(name: "帽子")
lady_bag = lady.children.create(name: "バッグ")
lady_accssary = lady.children.create(name: "アクセサリー")
lady_hear = lady.children.create(name: "ヘアアクセサリー")
lady_smallgoods = lady.children.create(name: "小物")
lady_watch = lady.children.create(name: "時計")
lady_wig = lady.children.create(name: "ウィッグ/エクステ")
lady_swim = lady.children.create(name: "浴衣/水着")
lady_formal = lady.children.create(name: "スーツ/フォーマル/ドレス")
lady_mother = lady.children.create(name: "マタニティ")
lady_other = lady.children.create(name: "その他")

man_tops = man.children.create(name: "トップス")
man_jacket = man.children.create(name: "ジャケット/アウター")
man_pants = man.children.create(name: "パンツ")
man_shoes = man.children.create(name: "靴")
man_bag = man.children.create(name: "バッグ")
man_suits = man.children.create(name: "スーツ")
man_hat = man.children.create(name: "帽子")
man_accssary = man.children.create(name: "アクセサリー")
man_smallgoods = man.children.create(name: "小物")
man_watch = man.children.create(name: "時計")
man_swim = man.children.create(name: "水着")
man_legwear = man.children.create(name: "レッグウェア")
man_underwear = man.children.create(name: "アンダーウェア")
man_other = man.children.create(name: "その他")

baby_95girl = baby.children.create(name: "ベビー服(女の子用)~95cm")
baby_95boy = baby.children.create(name: "ベビー服(男の子用)~95cm")
baby_95common = baby.children.create(name: "ベビー服(男女兼用)~95cm")
baby_100girl = baby.children.create(name: "キッズ服(女の子用)100cm~")
baby_100boy = baby.children.create(name: "キッズ服(男の子用)100cm~")
baby_100common = baby.children.create(name: "キッズ服(男女兼用)100cm~")
baby_shoes = baby.children.create(name: "キッズ靴")
baby_smallgoods = baby.children.create(name: "子供用ファッション小物")
baby_toilet = baby.children.create(name: "オムツ/トイレ/バス")
baby_move = baby.children.create(name: "外出・移動用品")
baby_meal = baby.children.create(name: "授乳/食事")
baby_furniture = baby.children.create(name: "ベビー家具/寝具/室内用品")
baby_toy = baby.children.create(name: "おもちゃ")
baby_event = baby.children.create(name: "行事/記念品")
baby_other = baby.children.create(name: "その他")

interior_kitchen = interior.children.create(name: "キッチン/食器")
interior_bed = interior.children.create(name: "ベット/マットレス")
interior_sofa = interior.children.create(name: "ソファ/ソファベッド")
interior_chair = interior.children.create(name: "椅子/チェア")
interior_table = interior.children.create(name: "机/テーブル")
interior_closet = interior.children.create(name: "収納家具")
interior_mat = interior.children.create(name: "ラグ/カーペット/マット")
interior_curtain = interior.children.create(name: "カーテン/ブラインド")
interior_light = interior.children.create(name: "ライト/照明")
interior_sleep = interior.children.create(name: "寝具")
interior_smallgoods = interior.children.create(name: "インテリア小物")
interior_season = interior.children.create(name: "季節/年中行事")
interior_other = interior.children.create(name: "その他")

book_book = book.children.create(name: "本")
book_manga = book.children.create(name: "漫画")
book_magazine = book.children.create(name: "雑誌")
book_cd = book.children.create(name: "CD")
book_dvd = book.children.create(name: "DVD/ブルーレイ")
book_recode = book.children.create(name: "レコード")
book_game = book.children.create(name: "テレビゲーム")

toy_toy = toy.children.create(name: "おもちゃ")
toy_talent = toy.children.create(name: "タレントグッズ")
toy_comic = toy.children.create(name: "コミック/アニメグッズ")
toy_card = toy.children.create(name: "トレーディングカード")
toy_figure = toy.children.create(name: "フィギュア")
toy_music = toy.children.create(name: "楽器/器材")
toy_collection = toy.children.create(name: "コレクション")
toy_military = toy.children.create(name: "ミリタリー")
toy_art = toy.children.create(name: "美術品")
toy_artgoods = toy.children.create(name: "アート用品")
toy_other = toy.children.create(name: "その他")

cosmetics_base = cosmetics.children.create(name: "ベースメイク")
cosmetics_make= cosmetics.children.create(name: "メイクアップ")
cosmetics_nail = cosmetics.children.create(name: "ネイルケア")
cosmetics_perfume = cosmetics.children.create(name: "香水")
cosmetics_skin = cosmetics.children.create(name: "スキンケア/基礎化粧品")
cosmetics_hair = cosmetics.children.create(name: "ヘアケア")
cosmetics_body = cosmetics.children.create(name: "ボディケア")
cosmetics_oral = cosmetics.children.create(name: "オーラルケア")
cosmetics_relux = cosmetics.children.create(name: "リラクゼーション")
cosmetics_diet = cosmetics.children.create(name: "ダイエット")
cosmetics_other = cosmetics.children.create(name: "その他")

electronics_smartphone = electronics.children.create(name: "スマートフォン/携帯電話")
electronics_accessory = electronics.children.create(name: "スマホアクセサリー")
electronics_pc = electronics.children.create(name: "PC/タブレット")
electronics_camera = electronics.children.create(name: "カメラ")
electronics_tv = electronics.children.create(name: "テレビ/映像機器")
electronics_audio = electronics.children.create(name: "オーディオ機器")
electronics_beauty = electronics.children.create(name: "美容/健康")
electronics_cooler = electronics.children.create(name: "冷暖房/空調")
electronics_lifestyle = electronics.children.create(name: "生活家電")
electronics_other = electronics.children.create(name: "その他")

sport_golf = sport.children.create(name: "ゴルフ")
sport_fish = sport.children.create(name: "フィッシング")
sport_bike = sport.children.create(name: "自転車")
sport_training = sport.children.create(name: "トレーニング/エクササイズ")
sport_baseball = sport.children.create(name: "野球")
sport_soccer = sport.children.create(name: "サッカー/フットサル")
sport_tennis = sport.children.create(name: "テニス")
sport_snow = sport.children.create(name: "スノーボード")
sport_ski = sport.children.create(name: "スキー")
sport_otherspo = sport.children.create(name: "そのほかのスポーツ")
sport_outdoor = sport.children.create(name: "アウトドア")
sport_other = sport.children.create(name: "その他")

handmade_ladyacce = handmade.children.create(name: "アクセサリー(女性用)")
handmade_fashion = handmade.children.create(name: "ファション/小物")
handmade_watch = handmade.children.create(name: "アクセサリー/時計")
handmade_daily = handmade.children.create(name: "日用品/インテリア")
handmade_hobby = handmade.children.create(name: "趣味/おもちゃ")
handmade_kids = handmade.children.create(name: "キッズ/ベビー")
handmade_material = handmade.children.create(name: "素材/材料")
handmade_second = handmade.children.create(name: "二次創作物")
handmade_other = handmade.children.create(name: "その他")

ticket_music = ticket.children.create(name: "音楽")
ticket_sport = ticket.children.create(name: "スポーツ")
ticket_entame = ticket.children.create(name: "演劇/芸能")
ticket_event = ticket.children.create(name: "イベント")
ticket_movie = ticket.children.create(name: "映画")
ticket_facility = ticket.children.create(name: "施設利用券")
ticket_coupon = ticket.children.create(name: "優待券/割引券")

car_main = car.children.create(name: "自動車本体")
car_wheel = car.children.create(name: "自動車タイヤ/ホイール")
car_part = car.children.create(name: "自動車パーツ")
car_acce = car.children.create(name: "自動車アクセサリー")
car_autobike = car.children.create(name: "オートバイ車体")
car_autobikepart = car.children.create(name: "オートバイパーツ")
car_autobikeacce = car.children.create(name: "オートバイアクセサリー")

other_main = other.children.create(name: "まとめ売り")
other_pet = other.children.create(name: "ペット用品")
other_meal = other.children.create(name: "食品")
other_drink = other.children.create(name: "飲料/酒")
other_daily = other.children.create(name: "日用品/生活雑貨/旅行")
other_antique = other.children.create(name: "アンティーク/コレクション")
other_stationery = other.children.create(name: "文房具/事務用品")
other_office = other.children.create(name: "事務/店舗用品")
other_other = other.children.create(name: "その他")



lady_tops.children.create([{name: "Tシャツ/カットソー(半袖/袖なし)"}, {name: "Tシャツ/カットソー(七分/長袖)"}, {name: "シャツ/ブラウス(半袖/袖なし)"},{name: "シャツ/ブラウス(七分/長袖)"}, {name: "ポロシャツ"},{name: "キャミソール"}, {name: "タンクトップ"},{name: "ホルターネック"},{name: "ニット/セーター"},{name: "チュニック"},{name: "カーディガン/ボレロ"},{name: "アンサンブル"},{name: "ベスト/ジレ"},{name: "パーカー"},{name: "トレーナー/スウェット"},{name: "ベアトップ/チューブトップ"},{name: "ジャージ"}, {name: "その他"}])
lady_jacket.children.create([{name: "テーラードジャケット"}, {name: "ノーカラージャケット"}, {name: "Gジャン/デニムジャケット"}, {name: "レザージャケット"}, {name: "ダウンジャケット"}, {name: "ライダースジャケット"}, {name: "ミリタリージャケット"}, {name: "ダウンベスト"}, {name: "ジャンパー/ブルゾン"}, {name: "ポンチョ"}, {name: "ロングコート"}, {name: "トレンチコート"}, {name: "ダッフルコート"}, {name: "ピーコート"}, {name: "チェスターコート"}, {name: "モッズコート"}, {name: "スタジャン"}, {name: "毛皮/ファーコート"}, {name: "スプリングコート"}, {name: "スカジャン"}, {name: "その他"}])
lady_pants.children.create([ {name: "デニム/ジーンズ"}, {name: "ショートパンツ"}, {name: "カジュアルパンツ"}, {name: "ハーフパンツ"}, {name: "チノパン"}, {name: "ワークパンツ/カーゴパンツ"}, {name: "クロップドパンツ"}, {name: "サロペット/オーバーオール"}, {name: "オールインワン"}, {name: "サルエルパンツ"}, {name: "ガウチョパンツ"}, {name: "その他"}])
lady_skirt.children.create([ {name: "ミニスカート"}, {name: "ひざ丈スカート"}, {name: "ロングスカート"}, {name: "キュロット"}, {name: "その他"}])
lady_onepiece.children.create([ {name: "ミニワンピース"}, {name: "ひざ丈ワンピース"}, {name: "ロングワンピース"}, {name: "その他"}])
lady_shoes.children.create([ {name: "ハイヒール"}, {name: "ブーツ"}, {name: "サンダル"}, {name: "スニーカー"}, {name: "ミュール"}, {name: "モカシン"}, {name: "ローファー/革靴"}, {name: "フラットシューズ/バレエシューズ"}, {name: "長靴/レインシューズ"}, {name: "その他"}])
lady_pajama.children.create([ {name: "パジャマ"}, {name: "ルームウェア"}, {name: "その他"}])
lady_legwear.children.create([ {name: "ソックス"}, {name: "スパッツ/レギンス"}, {name: "ストッキング/タイツ"}, {name: "レッグウォーマー"}, {name: "その他"}])
lady_hat.children.create([ {name: "ニットキャップ/ビーニー"}, {name: "ハット"},  {name: "ハンチング/ベレー帽"},  {name: "キャップ"},  {name: "キャスケット"}, {name: "麦わら帽子"}, {name: "その他"}])
lady_bag.children.create([ {name: "ハンドバッグ"}, {name: "トートバッグ"}, {name: "エコバッグ"}, {name: "リュック/バックパック"}, {name: "ボストンバッグ"}, {name: "スポーツバッグ"}, {name: "ショルダーバッグ"},{name: "クラッチバッグ"},{name: "ポーチ・バニティ"},{name: "ボディバッグ/ウェストバッグ"},{name: "マザーズバッグ"},{name: "メッセンジャーバッグ"},{name: "ビジネスバッグ"},{name: "旅行用バッグ/キャリーバッグ"},{name: "ショップ袋"},{name: "和装用バッグ"},{name: "かごバック"},{name: "その他"}])
lady_accssary.children.create([{name: "ネックレス"},{name: "ブレスレット"},{name: "バングル/リストバンド"},{name: " リング"},{name: "ピアス(片耳用)"},{name: "ピアス(両耳用)"},{name: "イヤリング"},{name: "アンクレット"},{name: "ブローチ/コサージュ"},{name: "チャーム"},{name: "その他"}])
lady_hear.children.create([{name: "ヘアゴム/シュシュ"},{name: "ヘアバンド/カチューシャ"},{name: "ヘアピン"},{name: "その他"}])
lady_smallgoods.children.create([{name: "長財布"},{name: "折り財布"},{name: "コインケース/小銭入れ"},{name: "名刺入れ/定期入れ"},{name: "キーケース"},{name: "キーホルダー"},{name: "手袋/アームカバー"},{name: "ハンカチ"},{name: "ベルト"},{name: "マフラー/ショール"},{name: "ストール/スヌード"},{name: "バンダナ/スカーフ"},{name: "ネックウォーマー"},{name: "サスペンダー"},{name: "サングラス/メガネ"},{name: "モバイルケース/カバー"},{name: "手帳"},{name: "イヤマフラー"},{name: "傘"},{name: "レインコート/ポンチョ"},{name: "ミラー"},{name: "タバコグッズ"},{name: "その他"}])
lady_watch.children.create([{name: "腕時計(アナログ)"},{name: "腕時計(デジタル)"},{name: "ラバーベルト"},{name: "レザーベルト"},{name: "金属ベルト"},{name: "その他"}])
lady_wig.children.create([{name: "前髪ウィッグ"},{name: "ロングストレート"},{name: "ロングカール"},{name: "ショートストレート"},{name: "ショートカール"},{name: "その他"}])
lady_swim.children.create([{name: "浴衣"},{name: "着物"},{name: "振袖"},{name: "長襦袢/半襦袢"},{name: "水着セパレート"},{name: "水着ワンピース"},{name: "水着スポーツ用"},{name: "その他"}])
lady_formal.children.create([{name: "スカートスーツ上下"},{name: "パンツスーツ上下"},{name: "ドレス"},{name: "パーティーバッグ"},{name: "シューズ"},{name: "ウェディング"},{name: "その他"}])
lady_mother.children.create([{name: "トップス"},{name: "アウター"},{name: "インナー"},{name: "ワンピース"},{name: "パンツ/スパッツ"},{name: "スカート"},{name: "パジャマ"},{name: "授乳服"},{name: "その他"}])
lady_other.children.create([{name: "コスプレ"},{name: "下着"},{name: "その他"}])




man_tops.children.create([{name: "Tシャツ/カットソー(半袖/袖なし)"}, {name: "Tシャツ/カットソー(七分/長袖)"},{name: "シャツ"},{name: "ポロシャツ"},{name: "ニット/セーター"},{name: "パーカー"},{name: "カーディガン"},{name: "スウェット"},{name: "ジャージ"}, {name: "その他"}])
man_jacket.children.create([{name: "テーラードジャケット"}, {name: "ノーカラージャケット"}, {name: "Gジャン/デニムジャケット"}, {name: "レザージャケット"}, {name: "ダウンジャケット"}, {name: "ライダースジャケット"}, {name: "ミリタリージャケット"}, {name: "ナイロンジャケット"}, {name: "ジャンパー/ブルゾン"}, {name: "ポンチョ"}, {name: "ロングコート"}, {name: "トレンチコート"}, {name: "ダッフルコート"}, {name: "ピーコート"}, {name: "チェスターコート"}, {name: "モッズコート"}, {name: "スタジャン"}, {name: "チェスターコート"}, {name: "ステンカラーコート"}, {name: "スカジャン"}, {name: "その他"}])
man_pants.children.create([{name: "デニム/ジーンズ"}, {name: "ショートパンツ"}, {name: "スラックス"}, {name: "ハーフパンツ"}, {name: "チノパン"}, {name: "ワークパンツ/カーゴパンツ"}, {name: "ペインターパンツ"}, {name: "オーバーオール"}, {name: "サルエルパンツ"}, {name: "その他"}])
man_shoes.children.create([{name: "ブーツ"}, {name: "サンダル"}, {name: "スニーカー"}, {name: "モカシン"}, {name: "ドレス/ビジネス"}, {name: "ローファー/革靴"}, {name: "デッキシューズ"}, {name: "長靴/レインシューズ"}, {name: "その他"}])
man_bag.children.create([ {name: "トートバッグ"}, {name: "ショルダーバッグ"}, {name: "リュック/バックパック"}, {name: "ボストンバッグ"}, {name: "スポーツバッグ"}, {name: "ショルダーバッグ"},{name: "クラッチバッグ"},{name: "ウェストポーチ"},{name: "ボディバッグ"},{name: "ドラムバッグ"},{name: "メッセンジャーバッグ"},{name: "ビジネスバッグ"},{name: "旅行用バッグ/キャリーバッグ"},{name: "エコバック"},{name: "その他"}])
man_suits.children.create([{name: "スーツジャケット"},{name: "スーツベスト"},{name: "スラックス"},{name: "セットアップ"},{name: "その他"}])
man_hat.children.create([{name: "ニットキャップ/ビーニー"}, {name: "ハット"},  {name: "ハンチング/ベレー帽"},  {name: "キャップ"},  {name: "キャスケット"}, {name: "サンバイザー"}, {name: "その他"}])
man_accssary.children.create([{name: "ネックレス"},{name: "ブレスレット"},{name: "バングル/リストバンド"},{name: " リング"},{name: "ピアス(片耳用)"},{name: "ピアス(両耳用)"},{name: "アンクレット"},{name: "その他"}])
man_smallgoods.children.create([{name: "長財布"},{name: "折り財布"},{name: "コインケース/小銭入れ"},{name: "マネークリップ"},{name: "名刺入れ/定期入れ"},{name: "キーケース"},{name: "キーホルダー"},{name: "ネクタイ"},{name: "手袋"},{name: "ハンカチ"},{name: "ベルト"},{name: "マフラー"},{name: "ストール"},{name: "バンダナ"},{name: "ネックウォーマー"},{name: "サスペンダー"},{name: "ウォレットチェーン"},{name: "サングラス/メガネ"},{name: "モバイルケース/カバー"},{name: "手帳"},{name: "ストラップ"},{name: "ネクタイピン"},{name: "カフリンクス"},{name: "イヤマフラー"},{name: "傘"},{name: "レインコート"},{name: "ミラー"},{name: "タバコグッズ"},{name: "その他"}])
man_watch.children.create([{name: "腕時計(アナログ)"},{name: "腕時計(デジタル)"},{name: "ラバーベルト"},{name: "レザーベルト"},{name: "金属ベルト"},{name: "その他"}])
man_swim.children.create([{name: "一般水着"},{name: "水着スポーツ用"},{name: "アクセサリー"},{name: "その他"}])
man_legwear.children.create([{name: "ソックス"}, {name: "スパッツ/レギンス"}, {name: "レッグウォーマー"}, {name: "その他"}])
man_underwear.children.create([{name: "トランクス"}, {name: "ボクサーパンツ"}, {name: "その他"}])




baby_95girl.children.create([{name: "トップス"},{name: "アウター"},{name: "パンツ"},{name: "その他"}])
baby_95boy.children.create([{name: "トップス"},{name: "アウター"},{name: "パンツ"},{name: "その他"}])
baby_95common.children.create([{name: "トップス"},{name: "アウター"},{name: "パンツ"},{name: "その他"}])
baby_100girl.children.create([{name: "トップス"},{name: "アウター"},{name: "パンツ"},{name: "その他"}])
baby_100boy.children.create([{name: "トップス"},{name: "アウター"},{name: "パンツ"},{name: "その他"}])
baby_100common.children.create([{name: "トップス"},{name: "アウター"},{name: "パンツ"},{name: "その他"}])
baby_shoes.children.create([{name: "スニーカー"},{name: "サンダル"},{name: "ブーツ"},{name: "その他"}])
baby_smallgoods.children.create([{name: "靴下"},{name: "帽子"},{name: "ハンカチ"},{name: "その他"}])
baby_toilet.children.create([{name: "オムツ用品"},{name: "おまる/補助便器"},{name: "ベビーバス"},{name: "その他"}])
baby_move.children.create([{name: "ベビーカー"},{name: "抱っこ紐"},{name: "チャイルドシート"},{name: "その他"}])
baby_meal.children.create([{name: "ミルク"},{name: "ベビーフード"},{name: "ベビー用品"},{name: "その他"}])
baby_furniture.children.create([{name: "ベッド"},{name: "布団/毛布"},{name: "椅子"},{name: "その他"}])
baby_toy.children.create([{name: "お風呂のおもちゃ"},{name: "カラカラ"},{name: "オルゴール"},{name: "その他"}])
baby_event.children.create([{name: "お宮参り用品"},{name: "アルバム"},{name: "手形/足型"},{name: "その他"}])
baby_other.children.create([{name: "母子手帳用品"},{name: "その他"}])


interior_kitchen.children.create([{name: "食器"},{name: "調理器具"},{name: "収納"},{name: "その他"}])
interior_bed.children.create([{name: "セミシングルベッド"},{name: "シングルベッド"},{name: "セミダブルベッド"},{name: "その他"}])
interior_sofa.children.create([{name: "ソファセット"},{name: "シングルソファ"},{name: "ラブソファ"},{name: "その他"}])
interior_chair.children.create([{name: "一般"},{name: "スツール"},{name: "ダイニングチェア"},{name: "その他"}])
interior_table.children.create([{name: "こたつ"},{name: "カウンターテーブル"},{name: "サイドテーブル"},{name: "その他"}])
interior_closet.children.create([{name: "リビング収納"},{name: "キッチン収納"},{name: "玄関/屋外収納"},{name: "その他"}])
interior_mat.children.create([{name: "ラグ"},{name: "カーペット"},{name: "ホットカーペット"},{name: "その他"}])
interior_curtain.children.create([{name: "カーテン"},{name: "ブラインド"},{name: "ロールスクリーン"},{name: "その他"}])
interior_light.children.create([{name: "ライト/照明"},{name: "天井照明"},{name: "フロアスタンド"},{name: "その他"}])
interior_sleep.children.create([{name: "布団/毛布"},{name: "枕"},{name: "シーツ/カバー"},{name: "その他"}])
interior_smallgoods.children.create([{name: "ゴミ箱"},{name: "ウェルカムボード"},{name: "オルゴール"},{name: "その他"}])
interior_season.children.create([{name: "正月"},{name: "成人式"},{name: "バレンタインデー"},{name: "その他"}])




book_book.children.create([{name: "文学/小説"},{name: "人文/社会"},{name: "参考書"},{name: "その他"}])
book_manga.children.create([{name: "全巻セット"},{name: "少年漫画"},{name: "少女漫画"},{name: "その他"}])
book_magazine.children.create([{name: "アート/エンタメ/ホビー"},{name: "ファッション"},{name: "ニュース/総合"},{name: "その他"}])
book_cd.children.create([{name: "邦楽"},{name: "洋楽"},{name: "アニメ"},{name: "その他"}])
book_dvd.children.create([{name: "外国映画"},{name: "日本映画"},{name: "アニメ"},{name: "その他"}])
book_recode.children.create([{name: "邦楽"},{name: "洋楽"},{name: "その他"}])
book_game.children.create([{name: "家庭用ゲーム本体"},{name: "家庭用ゲームソフト"},{name: "携帯用ゲーム本体"},{name: "その他"}])





toy_toy.children.create([{name: "キャラクターグッズ"},{name: "ぬいぐるみ"},{name: "小物/アクセサリー"},{name: "その他"}])
toy_talent.children.create([{name: "アイドル"},{name: "ミュージシャン"},{name: "タレント/お笑い芸人"},{name: "その他"}])
toy_comic.children.create([{name: "ストラップ"},{name: "キーホルダー"},{name: "バッジ"},{name: "その他"}])
toy_card.children.create([{name: "遊戯王"},{name: "ポケモンカードゲーム"},{name: "デュエル・マスターズ"},{name: "その他"}])
toy_figure.children.create([{name: "コミック/アニメ"},{name: "特撮"},{name: "ゲームキャラクター"},{name: "その他"}])
toy_music.children.create([{name: "エレキギター"},{name: "アコースティックギター"},{name: "ベース"},{name: "その他"}])
toy_collection.children.create([{name: "武具"},{name: "使用済み切手/官製ハガキ"},{name: "印刷物"},{name: "その他"}])
toy_military.children.create([{name: "トイガン"},{name: "個人装備"},{name: "その他"}])
toy_art.children.create([{name: "陶芸"},{name: "ガラス"},{name: "金属芸"},{name: "その他"}])
toy_artgoods.children.create([{name: "画材"},{name: "額縁"},{name: "その他"}])
toy_other.children.create([{name: "トランプ"},{name: "UNO"},{name: "ダーツ"},{name: "その他"}])





cosmetics_base.children.create([{name: "ファンデーション"},{name: "化粧下地"},{name: "コントロールカラー"},{name: "その他"}])
cosmetics_make.children.create([{name: "アイシャドウ"},{name: "口紅"},{name: "リップクロス"},{name: "その他"}])
cosmetics_nail.children.create([{name: "ネイルカラー"},{name: "カラージェル"},{name: "ネイルベースコート"},{name: "その他"}])
cosmetics_perfume.children.create([{name: "香水(女性用)"},{name: "香水(男性用)"},{name: "ユニセックス"},{name: "その他"}])
cosmetics_skin.children.create([{name: "化粧水/ローション"},{name: "乳液/ミルク"},{name: "美容液"},{name: "その他"}])
cosmetics_hair.children.create([{name: "シャンプー"},{name: "トリートメント"},{name: "コンディショナー"},{name: "その他"}])
cosmetics_body.children.create([{name: "オイル/クリーム"},{name: "ハンドクリーム"},{name: "ローション"},{name: "その他"}])
cosmetics_oral.children.create([{name: "口臭防止/エチケット用品"},{name: "歯ブラシ"},{name: "その他"}])
cosmetics_relux.children.create([{name: "エッセンシャルオイル"},{name: "芳香剤"},{name: "お香/香炉"},{name: "その他"}])
cosmetics_diet.children.create([{name: "ダイエット食品"},{name: "エクササイズ食品"},{name: "体重計"},{name: "その他"}])
cosmetics_other.children.create([{name: "健康用品"},{name: "看護/介護用品"},{name: "救護/衛生用品"},{name: "その他"}])


electronics_smartphone.children.create([{name: "スマートフォン本体"},{name: "バッテリー/充電器"},{name: "携帯電話本体"},{name: "その他"}])
electronics_accessory.children.create([{name: "Android用ケース"},{name: "iphone用ケース"},{name: "カバー"},{name: "その他"}])
electronics_pc.children.create([{name: "タブレット"},{name: "ノートPC"},{name: "デスクトップPC"},{name: "その他"}])
electronics_camera.children.create([{name: "デジタルカメラ"},{name: "ビデオカメラ"},{name: "レンズ(焦点)"},{name: "その他"}])
electronics_tv.children.create([{name: "テレビ"},{name: "プロジェクター"},{name: "ブルーレイレコーダー"},{name: "その他"}])
electronics_audio.children.create([{name: "ポータブルプレーヤー"},{name: "イヤフォン"},{name: "ヘッドフォン"},{name: "その他"}])
electronics_beauty.children.create([{name: "ヘアドライヤー"},{name: "ヘアアイコン"},{name: "美容機器"},{name: "その他"}])
electronics_cooler.children.create([{name: "エアコン"},{name: "空気清浄機"},{name: "加湿器"},{name: "その他"}])
electronics_lifestyle.children.create([{name: "冷蔵庫"},{name: "洗濯機"},{name: "炊飯器"},{name: "その他"}])


sport_golf.children.create([{name: "クラブ"},{name: "バッグ"},{name: "アクセサリー"},{name: "その他"}])
sport_fish.children.create([{name: "ロッド"},{name: "リール"},{name: "ルアー用品"},{name: "その他"}])
sport_bike.children.create([{name: "自転車本体"},{name: "パーツ"},{name: "アクセサリー"},{name: "その他"}])
sport_training.children.create([{name: "ランニング"},{name: "ウォーキング"},{name: "ヨガ"},{name: "トレーニング用品"}])
sport_baseball.children.create([{name: "シューズ"},{name: "グローブ"},{name: "バット"},{name: "その他"}])
sport_soccer.children.create([{name: "ウェア"},{name: "シューズ"},{name: "ボール"},{name: "その他"}])
sport_tennis.children.create([{name: "ラケット(硬式用)"},{name: "ラケット(軟式用)"},{name: "ボール"},{name: "その他"}])
sport_snow.children.create([{name: "ボード"},{name: "バインディング"},{name: "アクセサリー"},{name: "その他"}])
sport_ski.children.create([{name: "板"},{name: "ブーツ(男性用)"},{name: "ブーツ(女性用)"},{name: "その他"}])
sport_otherspo.children.create([{name: "ダンス/バレエ"},{name: "サーフィン"},{name: "バスケットボール"},{name: "その他"}])
sport_outdoor.children.create([{name: "テント/タープ"},{name: "ライト/ランタン"},{name: "寝具"},{name: "その他"}])
sport_other.children.create([{name: "旅行用品"}, {name: "その他"}])



handmade_ladyacce.children.create([{name: "ピアス"},{name: "イヤリング"},{name: "ネックレス"},{name: "その他"}])
handmade_fashion.children.create([{name: "バッグ(女性用)"},{name: "バッグ(男性用)"},{name: "財布(女性用)"},{name: "その他"}])
handmade_watch.children.create([{name: "アクセサリー(男性用)"},{name: "時計(男性用)"},{name: "時計(女性用)"},{name: "その他"}])
handmade_daily.children.create([{name: "キッチン用品"},{name: "家具"},{name: "文房具"},{name: "その他"}])
handmade_hobby.children.create([{name: "クラフト/布製品"},{name: "おもちゃ/人形"},{name: "その他"}])
handmade_kids.children.create([{name: "ファッション雑貨"},{name: "スタイ/よだれかけ"},{name: "外出用品"},{name: "その他"}])
handmade_material.children.create([{name: "各種パーツ"},{name: "生地/糸"},{name: "型紙/パターン"},{name: "その他"}])
handmade_second.children.create([{name: "Ingress"},{name: "クリエイターズ宇宙兄弟"},{name: "その他"}])



ticket_music.children.create([{name: "男性アイドル"},{name: "女性アイドル"},{name: "韓流"},{name: "その他"}])
ticket_sport.children.create([{name: "サッカー"},{name: "野球"},{name: "テニス"},{name: "その他"}])
ticket_entame.children.create([{name: "ミュージカル"},{name: "演劇"},{name: "伝統芸能"},{name: "その他"}])
ticket_event.children.create([{name: "声優/アニメ"},{name: "キッズ/ファミリー"},{name: "トークショー/講演会"},{name: "その他"}])
ticket_movie.children.create([{name: "邦画"},{name: "洋画"},{name: "その他"}])
ticket_facility.children.create([{name: "遊園地/テーマパーク"},{name: "美術館/博物館"},{name: "スキー場"},{name: "その他"}])
ticket_coupon.children.create([{name: "ショッピング"},{name: "レストラン/食事券"},{name: "フード/ドリン券"},{name: "その他"}])



car_main.children.create([{name: "国内自動車本体"},{name: "外国自動車本体"}])
car_wheel.children.create([{name: "タイヤ/ホイールセット"},{name: "タイヤ"},{name: "ホイール"},{name: "その他"}])
car_part.children.create([{name: "サスペンション"},{name: "ブレーキ"},{name: "外装、エアロパーツ"},{name: "その他"}])
car_acce.children.create([{name: "車内アクセサリー"},{name: "カーナビ"},{name: "カーオーディオ"},{name: "その他"}])
car_autobikepart.children.create([{name: "タイヤ"},{name: "マフラー"},{name: "エンジン、冷却装置"},{name: "その他"}])
car_autobikeacce.children.create([{name: "ヘルメット/シールド"},{name: "バイクウェア/装備"},{name: "アクセサリー"},{name: "その他"}])



other_pet.children.create([{name: "ペットフード"},{name: "犬用品"},{name: "猫用品"},{name: "その他"}])
other_meal.children.create([{name: "菓子"},{name: "米"},{name: "野菜"},{name: "その他"}])
other_drink.children.create([{name: "コーヒー"},{name: "ソフトドリンク"},{name: "ミネラルウォーター"},{name: "その他"}])
other_daily.children.create([{name: "タオル/バス用品"},{name: "日用品/生活雑貨"},{name: "洗剤/柔軟剤"},{name: "その他"}])
other_antique.children.create([{name: "雑貨"},{name: "工芸品"},{name: "家具"},{name: "その他"}])
other_stationery.children.create([{name: "筆記具"},{name: "ノート/メモ帳"},{name: "テープ/マスキングテープ"},{name: "その他"}])
other_office.children.create([{name: "オフィス用品一途"},{name: "オフィス家具"},{name: "店舗用品"},{name: "その他"}])


prefecture = Prefecture.create([{ prefecture: "北海道"}, { prefecture: "青森"}, { prefecture: "岩手"},  {prefecture: "宮城"}, {prefecture: "秋田"}, { prefecture: "山形"}, { prefecture: "福島"}, { prefecture: "茨城"}, { prefecture: "栃木"}, { prefecture: "群馬"}, { prefecture: "埼玉"}, { prefecture: "千葉"}, { prefecture: "東京"},  { prefecture: "神奈川"}, { prefecture: "新潟"}, {prefecture: "富山"}, { prefecture: "石川"}, { prefecture: "福井"}, {prefecture: "山梨"}, { prefecture: "長野"}, { prefecture: "岐阜"}, { prefecture: "静岡"}, { prefecture: "愛知"}, { prefecture: "三重"}, { prefecture: "滋賀"}, { prefecture: "京都"}, { prefecture: "大阪"}, { prefecture: "兵庫"}, { prefecture: "奈良"}, { prefecture: "和歌山"}, { prefecture: "鳥取"},{ prefecture: "島根"}, { prefecture: "岡山"}, { prefecture: "広島"}, { prefecture: "山口"}, { prefecture: "徳島"}, { prefecture: "香川"}, { prefecture: "愛媛"}, { prefecture: "高知"}, { prefecture: "福岡"}, { prefecture: "佐賀"}, { prefecture: "大分"}, { prefecture: "宮崎"}, { prefecture: "長崎"}, { prefecture: "熊本"} , { prefecture: "鹿児島"}, { prefecture: "沖縄"}, {prefecture: "その他"}])
condition = Condition.create([{ condition: "新品、未使用"}, { condition: "未使用に近い"}, { condition: "目立った傷や汚れなし"}, { condition: "やや傷や汚れあり"}, { condition: "傷や汚れあり"}, { condition: "全体的に状態が悪い"}])
delivery_day = DeliveryDay.create([{ day: "1~2日で発送"}, { day: "2~3日で発送"}, { day: "4~7日で発送"}])


delivery_seller = DeliveryMethod.create(method: "送料込み(出品者負担)")
delivery_buyer = DeliveryMethod.create(method: "着払い(購入者負担)")

delivery_seller.children.create([{method: "未定"},{method: "らくらくメルカリ便"},{method: "ゆうメール"},{method: "レターパック"},{method: "普通郵便(定型、定型外)"},{method: "クロネコヤマト"},{method: "ゆうパック"},{method: "クリップポスト"},{method: "ゆうパケット"}])
delivery_buyer.children.create([{method: "未定"},{method: "クロネコヤマト"},{method: "ゆうパック"},{method: "ゆうメール"}])

size = Size.create([{size: "XXS以下"},{size: "XS(SS以下)"},{size: "S"},{size: "M"},{size: "L"},{size: "XL(LL)"},{size: "2XL(3L)"},{size: "3XL(4L)"},{size: "4XL(5L)以上"},{size: "FREE SIZE"},{size: "20cm以下"},{size: "20.5cm"},{size: "21cm"},{size: "21.5cm"},{size: "22cm"},{size: "22.5cm"},{size: "23cm"},{size: "23.5cm"},{size: "23.5cm以下"},{size: "24cm"},{size: "24.5cm"},{size: "25cm"},{size: "25.5cm"},{size: "26cm"},{size: "26.5cm"},{size: "27cm"},{size: "27.5cm以上"},{size: "27.5cm"},{size: "28cm"},{size: "28.5cm"},{size: "29cm"},{size: "29.5cm"},{size: "30cm"},{size: "30.5cm"},{size: "31cm以上"},{size: "60cm"},{size: "70cm"},{size: "80cm"},{size: "90cm"},{size: "95cm"},{size: "100cm"},{size: "110cm"},{size: "120cm"},{size: "130cm"},{size: "140cm"},{size: "150cm"},{size: "160cm"},{size: "10.5cm以下"},{size: "11cm・11.5cm"},{size: "12cm・12.5cm"},{size: "13cm・13.5cm"},{size: "14cm・14.5cm"},{size: "15cm・15.5cm"},{size: "16cm・16.5cm"},{size: "17cm以上"},{size: "12インチ"},{size: "13インチ"},{size: "14インチ"},{size: "15インチ"},{size: "16インチ"},{size: "17インチ"},{size: "18インチ"},{size: "19インチ"},{size: "20インチ"},{size: "21インチ"},{size: "22インチ"},{size: "23インチ"},{size: "24インチ"},{size: "XSサイズ以下"},{size: "Sサイズ"},{size: "Mサイズ"},{size: "Lサイズ"},{size: "XLサイズ"},{size: "XXLサイズ以上"},{size: "フリーサイズ"},{size: "子ども用"}])


(158..174).each do |number|
  category_size = CategorySize.create([{category_id: "#{number}", size_id: 1}, {category_id: "#{number}", size_id: 2}, {category_id: "#{number}", size_id: 3},{category_id: "#{number}", size_id: 4},{category_id: "#{number}", size_id: 5}, {category_id: "#{number}", size_id: 6}, {category_id: "#{number}", size_id: 7}, {category_id: "#{number}", size_id: 8}, {category_id: "#{number}", size_id: 9}, {category_id: "#{number}", size_id: 10}])
end
(176..195).each do |number|
  category_size = CategorySize.create([{category_id: "#{number}", size_id: 1}, {category_id: "#{number}", size_id: 2}, {category_id: "#{number}", size_id: 3},{category_id: "#{number}", size_id: 4},{category_id: "#{number}", size_id: 5}, {category_id: "#{number}", size_id: 6}, {category_id: "#{number}", size_id: 7}, {category_id: "#{number}", size_id: 8}, {category_id: "#{number}", size_id: 9}, {category_id: "#{number}", size_id: 10}])
end
(197..207).each do |number|
  category_size = CategorySize.create([{category_id: "#{number}", size_id: 1}, {category_id: "#{number}", size_id: 2}, {category_id: "#{number}", size_id: 3},{category_id: "#{number}", size_id: 4},{category_id: "#{number}", size_id: 5}, {category_id: "#{number}", size_id: 6}, {category_id: "#{number}", size_id: 7}, {category_id: "#{number}", size_id: 8}, {category_id: "#{number}", size_id: 9}, {category_id: "#{number}", size_id: 10}])
end
(209..212).each do |number|
  category_size = CategorySize.create([{category_id: "#{number}", size_id: 1}, {category_id: "#{number}", size_id: 2}, {category_id: "#{number}", size_id: 3},{category_id: "#{number}", size_id: 4},{category_id: "#{number}", size_id: 5}, {category_id: "#{number}", size_id: 6}, {category_id: "#{number}", size_id: 7}, {category_id: "#{number}", size_id: 8}, {category_id: "#{number}", size_id: 9}, {category_id: "#{number}", size_id: 10}])
end
(214..216).each do |number|
  category_size = CategorySize.create([{category_id: "#{number}", size_id: 1}, {category_id: "#{number}", size_id: 2}, {category_id: "#{number}", size_id: 3},{category_id: "#{number}", size_id: 4},{category_id: "#{number}", size_id: 5}, {category_id: "#{number}", size_id: 6}, {category_id: "#{number}", size_id: 7}, {category_id: "#{number}", size_id: 8}, {category_id: "#{number}", size_id: 9}, {category_id: "#{number}", size_id: 10}])
end
(228..229).each do |number|
  category_size = CategorySize.create([{category_id: "#{number}", size_id: 1}, {category_id: "#{number}", size_id: 2}, {category_id: "#{number}", size_id: 3},{category_id: "#{number}", size_id: 4},{category_id: "#{number}", size_id: 5}, {category_id: "#{number}", size_id: 6}, {category_id: "#{number}", size_id: 7}, {category_id: "#{number}", size_id: 8}, {category_id: "#{number}", size_id: 9}, {category_id: "#{number}", size_id: 10}])
end
(326..333).each do |number|
  category_size = CategorySize.create([{category_id: "#{number}", size_id: 1}, {category_id: "#{number}", size_id: 2}, {category_id: "#{number}", size_id: 3},{category_id: "#{number}", size_id: 4},{category_id: "#{number}", size_id: 5}, {category_id: "#{number}", size_id: 6}, {category_id: "#{number}", size_id: 7}, {category_id: "#{number}", size_id: 8}, {category_id: "#{number}", size_id: 9}, {category_id: "#{number}", size_id: 10}])
end
(338..346).each do |number|
  category_size = CategorySize.create([{category_id: "#{number}", size_id: 1}, {category_id: "#{number}", size_id: 2}, {category_id: "#{number}", size_id: 3},{category_id: "#{number}", size_id: 4},{category_id: "#{number}", size_id: 5}, {category_id: "#{number}", size_id: 6}, {category_id: "#{number}", size_id: 7}, {category_id: "#{number}", size_id: 8}, {category_id: "#{number}", size_id: 9}, {category_id: "#{number}", size_id: 10}])
end
(348..367).each do |number|
  category_size = CategorySize.create([{category_id: "#{number}", size_id: 1}, {category_id: "#{number}", size_id: 2}, {category_id: "#{number}", size_id: 3},{category_id: "#{number}", size_id: 4},{category_id: "#{number}", size_id: 5}, {category_id: "#{number}", size_id: 6}, {category_id: "#{number}", size_id: 7}, {category_id: "#{number}", size_id: 8}, {category_id: "#{number}", size_id: 9}, {category_id: "#{number}", size_id: 10}])
end
(369..377).each do |number|
  category_size = CategorySize.create([{category_id: "#{number}", size_id: 1}, {category_id: "#{number}", size_id: 2}, {category_id: "#{number}", size_id: 3},{category_id: "#{number}", size_id: 4},{category_id: "#{number}", size_id: 5}, {category_id: "#{number}", size_id: 6}, {category_id: "#{number}", size_id: 7}, {category_id: "#{number}", size_id: 8}, {category_id: "#{number}", size_id: 9}, {category_id: "#{number}", size_id: 10}])
end
(403..406).each do |number|
  category_size = CategorySize.create([{category_id: "#{number}", size_id: 1}, {category_id: "#{number}", size_id: 2}, {category_id: "#{number}", size_id: 3},{category_id: "#{number}", size_id: 4},{category_id: "#{number}", size_id: 5}, {category_id: "#{number}", size_id: 6}, {category_id: "#{number}", size_id: 7}, {category_id: "#{number}", size_id: 8}, {category_id: "#{number}", size_id: 9}, {category_id: "#{number}", size_id: 10}])
end


(218..226).each do |number|
  category_size = CategorySize.create([{category_id: "#{number}", size_id: 11}, {category_id: "#{number}", size_id: 12}, {category_id: "#{number}", size_id: 13},{category_id: "#{number}", size_id: 14},{category_id: "#{number}", size_id: 15}, {category_id: "#{number}", size_id: 16}, {category_id: "#{number}", size_id: 17}, {category_id: "#{number}", size_id: 18}, {category_id: "#{number}", size_id: 20}, {category_id: "#{number}", size_id: 21}, {category_id: "#{number}", size_id: 22}, {category_id: "#{number}", size_id: 23}, {category_id: "#{number}", size_id: 24}, {category_id: "#{number}", size_id: 25}, {category_id: "#{number}", size_id: 26}, {category_id: "#{number}", size_id: 27}])
end
(379..386).each do |number|
  category_size = CategorySize.create([{category_id: "#{number}", size_id: 19}, {category_id: "#{number}", size_id: 20}, {category_id: "#{number}", size_id: 21},{category_id: "#{number}", size_id: 22},{category_id: "#{number}", size_id: 23}, {category_id: "#{number}", size_id: 24}, {category_id: "#{number}", size_id: 25}, {category_id: "#{number}", size_id: 26}, {category_id: "#{number}", size_id: 28}, {category_id: "#{number}", size_id: 29}, {category_id: "#{number}", size_id: 30}, {category_id: "#{number}", size_id: 31}, {category_id: "#{number}", size_id: 32}, {category_id: "#{number}", size_id: 33}, {category_id: "#{number}", size_id: 34}, {category_id: "#{number}", size_id: 35}])
end


(469..471).each do |number|
  category_size = CategorySize.create([{category_id: "#{number}", size_id: 36}, {category_id: "#{number}", size_id: 37}, {category_id: "#{number}", size_id: 38},{category_id: "#{number}", size_id: 39},{category_id: "#{number}", size_id: 40}])
end
(473..475).each do |number|
  category_size = CategorySize.create([{category_id: "#{number}", size_id: 36}, {category_id: "#{number}", size_id: 37}, {category_id: "#{number}", size_id: 38},{category_id: "#{number}", size_id: 39},{category_id: "#{number}", size_id: 40}])
end
(477..479).each do |number|
  category_size = CategorySize.create([{category_id: "#{number}", size_id: 36}, {category_id: "#{number}", size_id: 37}, {category_id: "#{number}", size_id: 38},{category_id: "#{number}", size_id: 39},{category_id: "#{number}", size_id: 40}])
end


(481..483).each do |number|
  category_size = CategorySize.create([{category_id: "#{number}", size_id: 41}, {category_id: "#{number}", size_id: 42}, {category_id: "#{number}", size_id: 43},{category_id: "#{number}", size_id: 44},{category_id: "#{number}", size_id: 45}, {category_id: "#{number}", size_id: 46}, {category_id: "#{number}", size_id: 47}])
end
(485..487).each do |number|
  category_size = CategorySize.create([{category_id: "#{number}", size_id: 41}, {category_id: "#{number}", size_id: 42}, {category_id: "#{number}", size_id: 43},{category_id: "#{number}", size_id: 44},{category_id: "#{number}", size_id: 45}, {category_id: "#{number}", size_id: 46}, {category_id: "#{number}", size_id: 47}])
end
(489..491).each do |number|
  category_size = CategorySize.create([{category_id: "#{number}", size_id: 41}, {category_id: "#{number}", size_id: 42}, {category_id: "#{number}", size_id: 43},{category_id: "#{number}", size_id: 44},{category_id: "#{number}", size_id: 45}, {category_id: "#{number}", size_id: 46}, {category_id: "#{number}", size_id: 47}])
end


(493..491).each do |number|
  category_size = CategorySize.create([{category_id: "#{number}", size_id: 48}, {category_id: "#{number}", size_id: 49}, {category_id: "#{number}", size_id: 50},{category_id: "#{number}", size_id: 51},{category_id: "#{number}", size_id: 52}, {category_id: "#{number}", size_id: 53}, {category_id: "#{number}", size_id: 54}, {category_id: "#{number}", size_id: 55}])
end


(828..830).each do |number|
  category_size = CategorySize.create([{category_id: "#{number}", size_id: 56}, {category_id: "#{number}", size_id: 57}, {category_id: "#{number}", size_id: 58},{category_id: "#{number}", size_id: 59},{category_id: "#{number}", size_id: 60}, {category_id: "#{number}", size_id: 61}, {category_id: "#{number}", size_id: 62}, {category_id: "#{number}", size_id: 63}, {category_id: "#{number}", size_id: 64}, {category_id: "#{number}", size_id: 65}, {category_id: "#{number}", size_id: 66}, {category_id: "#{number}", size_id: 67}, {category_id: "#{number}", size_id: 68}])
end



category_size = CategorySize.create([{category_id: 844, size_id: 69}, {category_id: 844, size_id: 70}, {category_id: 844, size_id: 71},{category_id: 844, size_id: 72},{category_id: 844, size_id: 73}, {category_id: 844, size_id: 74}, {category_id: 844, size_id: 75}, {category_id: 844, size_id: 76}])

