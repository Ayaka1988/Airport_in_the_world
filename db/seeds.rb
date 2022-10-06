# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#親要素作成
area = Genre.create(name: '世界・エリア')
africa, asia, europe, middle_east, latin_america, north_america, oceania = area.children.create(
  [
    {name: 'アフリカ'},
    {name: 'アジア'},
    {name: 'ヨーロッパ'},
    {name: '中東'},
    {name: '中南米'},
    {name: '北米'},
    {name: 'オセアニア'}
  ]
)

#アフリカ大陸の子要素
['アルジェリア', 'ウガンダ', 'エジプト', 'エチオピア', 'ガーナ', 'カメルーン', 'ケニア',
 'コートジボワール', 'ザンビア', 'ジンバブエ', 'セイシェル', 'セネガル', 'タンザニア',
 'チュニジア', 'ナイジェリア', 'ナミビア', 'ブルキナファソ', 'ボツワナ', 'マダガスカル',
 '南アフリカ', 'モーリシャス', 'モロッコ'].each do |name|
  africa.children.create(name: name)
end

#アジアの子要素
['インド', 'インドネシア', 'ウズベキスタン', 'カザフスタン', '韓国', 'カンボジア', 'キルギス',
 'シンガポール', 'スリランカ', 'タイ', '台湾', 'タジキスタン', '中国', 'トルクメニスタン', 'ネパール',
 'バングラデシュ', 'パキスタン', '東ティモール', 'フィリピン', 'ブルネイ', 'ブータン', 'ベトナム',
 '香港', 'マカオ', 'マレーシア', 'ミャンマー', 'モルディブ', 'モンゴル', 'ラオス'].each do |name|
  asia.children.create(name: name)
end

#ヨーロッパの子要素
['アイスランド', 'アイルランド', 'アゼルバイジャン', 'アルバニア', 'アルメニア', 'イギリス',
 'イタリア', 'ウクライナ', 'エストニア', 'オランダ', 'オーストリア', 'キプロス', 'ギリシャ',
 'クロアチア', 'ジョージア', 'スイス', 'スウェーデン', 'スペイン', 'スロバキア', 'スロベニア',
 'セルビア', 'チェコ', 'デンマーク', 'ドイツ', 'ノルウェー', 'ハンガリー', 'フィンランド',
 'フランス', 'ブルガリア', 'ベラルーシ', 'ベルギー', 'ボスニア・ヘルツェゴヴィナ', 'ポルトガル',
 'ポーランド', 'マケドニア', 'マルタ', 'ルクセンブルク', 'ルーマニア', 'ロシア'].each do |name|
  europe.children.create(name: name)
end

#中東の子要素
['アフガニスタン', 'アラブ首長国連邦', 'イエメン', 'イスラエル', 'イラク', 'イラン',
 'オマーン', 'カタール', 'クウェート', 'サウジアラビア', 'シリア', 'トルコ', 'バーレーン',
 'パレスチナ', 'ヨルダン', 'レバノン'].each do |name|
  middle_east.children.create(name: name)
end

#中南米の子要素
['アルゼンチン', 'アルバ', 'イースター島', 'ウルグアイ', 'エクアドル', 'エルサルバドル',
 'キューバ', 'グアテマラ', 'ケイマン諸島', 'コスタリカ', 'コロンビア', 'ジャマイカ',
 'セントルシア', 'チリ', 'トリニダード・トバゴ', 'ドミニカ共和国', 'ニカラグア', 'ハイチ',
 'バハマ', 'バルバドス','パナマ', 'パラグアイ', 'ブラジル', 'プエルトリコ', 'ベネズエラ',
 'ベリーズ', 'ペルー', 'ボリビア', 'ホンジュラス', 'メキシコ'].each do |name|
  asia.children.create(name: name)
end

#北米の子要素
['アメリカ', 'アラスカ', 'カナダ', 'グアム', 'サイパン', 'ハワイ'].each do |name|
  north_america.children.create(name: name)
end

#オセアニアの子要素
['オーストラリア', 'キリバス', 'クック諸島', '', 'サモア', 'ソロモン諸島',
 'タヒチ', 'ツバル', 'トンガ', 'ニューカレドニア', 'ニュージーランド', 'パプアニューギニア',
 'パラオ', 'フィジー', 'マーシャル諸島', 'ミクロネシア連邦'].each do |name|
  oceania.children.create(name: name)
end


