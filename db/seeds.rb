Admin.create!(email: 'ayaka@t', password: 'ayakaterada', name: 'ayaka')

area = Genre.create(:name => 'world')

#子要素作成
area_asia = area.children.create(:name => 'アジア')
area_europe = area.children.create(:name => 'ヨーロッパ')
area_north_america = area.children.create(:name => '北米')
area_latin_america = area.children.create(:name => '中南米')
area_oceania = area.children.create(:name => 'オセアニア')
area_middle_east = area.children.create(:name => '中東')
area_africa = area.children.create(:name => 'アフリカ')

#孫要素作成
#アジアの子要素
area_asia.children.create([{:name => 'インド'}, {:name => 'インドネシア'}, {:name => 'ウズベキスタン'}, {:name => 'カザフスタン'},
                           {:name => '韓国'}, {:name => 'カンボジア'}, {:name => 'キルギス'}, {:name => 'シンガポール'}, {:name => 'スリランカ'},
                           {:name => 'タイ'}, {:name => '台湾'}, {:name => 'タジキスタン'}, {:name => '中国'}, {:name => 'トルクメニスタン'},
                           {:name => 'ネパール'}, {:name => 'バングラデシュ'}, {:name => 'パキスタン'}, {:name => '東ティモール'},
                           {:name => 'フィリピン'}, {:name => 'ブルネイ'}, {:name => 'ブータン'}, {:name => 'ベトナム'}, {:name =>'香港'},
                           {:name => 'マカオ'}, {:name => 'マレーシア'}, {:name => 'ミャンマー'}, {:name => 'モルディブ'}, {:name => 'モンゴル'},
                           {:name => 'ラオス'}])

#ヨーロッパの子要素
area_europe.children.create([{:name => 'アイスランド'}, {:name => 'アイルランド'}, {:name => 'アゼルバイジャン'}, {:name => 'アルバニア'},
                             {:name => 'アルメニア'}, {:name => 'イギリス'}, {:name => 'イタリア'}, {:name => 'ウクライナ'}, {:name => 'エストニア'},
                             {:name => 'オランダ'}, {:name => 'オーストリア'}, {:name => 'キプロス'}, {:name => 'ギリシャ'}, {:name => 'クロアチア'},
                             {:name => 'ジョージア'}, {:name => 'スイス'}, {:name => 'スウェーデン'}, {:name => 'スペイン'}, {:name => 'スロバキア'},
                             {:name => 'スロベニア'}, {:name => 'セルビア'}, {:name => 'チェコ'}, {:name => 'デンマーク'}, {:name =>'ドイツ'}, {:name => 'ノルウェー'},
                             {:name => 'ハンガリー'}, {:name => 'フィンランド'}, {:name => 'フランス'}, {:name => 'ブルガリア'}, {:name => 'ベラルーシ'},
                             {:name => 'ベルギー'}, {:name => 'ボスニア・ヘルツェゴヴィナ'}, {:name => 'ポルトガル'}, {:name => 'ポーランド'}, {:name => 'マケドニア'},
                             {:name => 'マルタ'}, {:name => 'ルクセンブルク'}, {:name => 'ルーマニア'}, {:name => 'ロシア'}])

 #北米の子要素
 area_north_america.children.create([{:name => 'アメリカ'}, {:name => 'アラスカ'}, {:name => 'カナダ'},
                                     {:name => 'グアム'}, {:name => 'サイパン'}, {:name => 'ハワイ'}])


 #中南米の子要素
 area_latin_america.children.create([{:name => 'アルゼンチン'}, {:name => 'アルバ'}, {:name => 'イースター島'}, {:name => 'ウルグアイ'}, {:name => 'エクアドル'},
                                     {:name => 'エルサルバドル'}, {:name => 'キューバ'}, {:name => 'グアテマラ'}, {:name => 'ケイマン諸島'}, {:name => 'コスタリカ'},
                                     {:name => 'コロンビア'}, {:name => 'ジャマイカ'}, {:name => 'セントルシア'}, {:name => 'チリ'}, {:name => 'トリニダード・トバゴ'},
                                     {:name => 'ドミニカ共和国'}, {:name => 'ニカラグア'}, {:name => 'ハイチ'}, {:name => 'バハマ'}, {:name => 'バルバドス'},
                                     {:name => 'パナマ'}, {:name => 'パラグアイ'}, {:name => 'ブラジル'}, {:name => 'プエルトリコ'}, {:name =>'ベネズエラ'},
                                     {:name => 'ベリーズ'},{:name => 'ペルー'}, {:name => 'ボリビア'}, {:name => 'ホンジュラス'}, {:name => 'ベリーズ'}])


#オセアニアの子要素
area_oceania.children.create([{:name => 'オーストラリア'}, {:name => 'キリバス'}, {:name => 'クック諸島'}, {:name => 'サモア'}, {:name => 'ソロモン諸島'},
                              {:name => 'タヒチ'}, {:name => 'ツバル'}, {:name => 'トンガ'}, {:name => 'ニューカレドニア'}, {:name => 'ニュージーランド'},
                              {:name => 'パプアニューギニア'}, {:name => 'パラオ'}, {:name => 'フィジー'}, {:name => 'マーシャル諸島'}, {:name => 'ミクロネシア連邦'}])


#中東の子要素
area_middle_east.children.create([{:name => 'アフガニスタン'}, {:name => 'アラブ首長国連邦'}, {:name => 'イエメン'}, {:name => 'イスラエル'}, {:name => 'イラク'},
                                  {:name => 'イラン'}, {:name => 'オマーン'}, {:name => 'カタール'}, {:name => 'クウェート'}, {:name => 'サウジアラビア'},
                                  {:name => 'シリア'}, {:name => 'トルコ'}, {:name => 'バーレーン'}, {:name => 'パレスチナ'}, {:name => 'ヨルダン'}, {:name => 'レバノン'}])


#アフリカ大陸の子要素
area_africa.children.create([{:name => 'アルジェリア'}, {:name => 'ウガンダ'}, {:name => 'エジプト'}, {:name => 'エチオピア'}, {:name => 'ガーナ'},
                             {:name => 'カメルーン'}, {:name => 'ケニア'}, {:name => 'コートジボワール'}, {:name => 'ザンビア'}, {:name => 'ジンバブエ'},
                             {:name => 'セイシェル'}, {:name => 'セネガル'}, {:name => 'タンザニア'}, {:name => 'チュニジア'}, {:name => 'ナイジェリア'},
                             {:name => 'ナミビア'}, {:name => 'ブルキナファソ'}, {:name => 'ボツワナ'}, {:name => 'マダガスカル'}, {:name => '南アフリカ'},
                             {:name => 'モーリシャス'}, {:name => 'モロッコ'}])

