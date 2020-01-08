# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# coding: utf-8

Admin.create!(
   email: 'admin@admin',
   password: 'adminadmin'
   )

Prefecture.create!([
  { :id => 0, :name => "北海道" },
  { :id => 1, :name => "青森県" },
  { :id => 2, :name => "岩手県" },
  { :id => 3, :name => "宮城県" },
  { :id => 4, :name => "秋田県" },
  { :id => 5, :name => "山形県" },
  { :id => 6, :name => "福島県" },
  { :id => 7, :name => "茨城県" },
  { :id => 8, :name => "栃木県" },
  { :id => 9, :name => "群馬県" },
  { :id => 10, :name => "埼玉県" },
  { :id => 11, :name => "千葉県" },
  { :id => 12, :name => "東京都" },
  { :id => 13, :name => "神奈川県" },
  { :id => 14, :name => "新潟県" },
  { :id => 15, :name => "富山県" },
  { :id => 16, :name => "石川県" },
  { :id => 17, :name => "福井県" },
  { :id => 18, :name => "山梨県" },
  { :id => 19, :name => "長野県" },
  { :id => 20, :name => "岐阜県" },
  { :id => 21, :name => "静岡県" },
  { :id => 22, :name => "愛知県" },
  { :id => 23, :name => "三重県" },
  { :id => 24, :name => "滋賀県" },
  { :id => 25, :name => "京都府" },
  { :id => 26, :name => "大阪府" },
  { :id => 27, :name => "兵庫県" },
  { :id => 28, :name => "奈良県" },
  { :id => 29, :name => "和歌山県" },
  { :id => 30, :name => "鳥取県" },
  { :id => 31, :name => "島根県" },
  { :id => 32, :name => "岡山県" },
  { :id => 33, :name => "広島県" },
  { :id => 34, :name => "山口県" },
  { :id => 35, :name => "徳島県" },
  { :id => 36, :name => "香川県" },
  { :id => 37, :name => "愛媛県" },
  { :id => 38, :name => "高知県" },
  { :id => 39, :name => "福岡県" },
  { :id => 40, :name => "佐賀県" },
  { :id => 41, :name => "長崎県" },
  { :id => 42, :name => "熊本県" },
  { :id => 43, :name => "大分県" },
  { :id => 44, :name => "宮崎県" },
  { :id => 45, :name => "鹿児島県" },
  { :id => 46, :name => "沖縄県" }
])

FestivalName.create!([
  { :id => 0, :name => "Rising Sun Rock Festival 2020 in EZO" },
  { :id => 1, :name => "JOIN ALIVE 2020" },
  { :id => 2, :name => "ARABAKI ROCK FEST.20" },
  { :id => 3, :name => "JAPAN JAM 2020" },
  { :id => 4, :name => "VIVA LA ROCK 2020" },
  { :id => 5, :name => "METROPOLITAN ROCK FESTIVAL 2020" },
  { :id => 6, :name => "ROCK IN JAPAN FESTIVAL 2020" },
  { :id => 7, :name => "SPACE SHOWER SWEET LOVE SHOWER 2020 -25th ANNIVERSARY-" },
  { :id => 8, :name => "FUJI ROCK FESTIVAL ’20" },
  { :id => 9, :name => "Daydream Festival" },
  { :id => 10, :name => "YON FES 2020" },
  { :id => 11, :name => "京都大作戦2020" },
  { :id => 12, :name => "MONSTER baSH 2020" },
  { :id => 13, :name => "NUMBER SHOT 2020" },
  { :id => 14, :name => "Miyako Island Rock Festival 2020" }
])

 Place.create!([
  { :id => 0, :name => "石狩湾新港樽川ふ頭横野外特設ステージ" },
  { :id => 1, :name => "いわみざわ公園 野外音楽堂キタオン＆北海道グリーンランド遊園地" },
  { :id => 2, :name => "エコキャンプみちのく" },
  { :id => 3, :name => "千葉市蘇我スポーツ公園" },
  { :id => 4, :name => "さいたまスーパーアリーナ" },
  { :id => 5, :name => "若洲公園" },
  { :id => 6, :name => "国営ひたち海浜公園" },
  { :id => 7, :name => "山中湖交流プラザ きらら" },
  { :id => 8, :name => "苗場スキー場" },
  { :id => 9, :name => "ナガシマリゾート" },
  { :id => 10, :name => "モリコロパーク" },
  { :id => 11, :name => "立山城総合運動公園　太陽が丘特設野外ステージ" },
  { :id => 12, :name => "国営讃岐まんのう公園" },
  { :id => 13, :name => "海の中道海浜公園" },
  { :id => 14, :name => "宮古島コースタルリゾートヒララ" }
])

Festival.create!([
  { image:  Rails.root.join("db/fixtures/images/image1.jpg").open,
    festival_name_id: '0',
    place_id: '0',
    event_date: '2020/08/14(金)-08/15(土)',
    prefecture_id: '0',
    body: '日本初の本格的オールナイト野外ロックフェスティバル。
    ライヴ以外にも北海道ならではの味覚が味わえる飲食店や自然を満喫できるアトラクション、
    環境問題について学べるブースに至るまで、ステージ上で音が鳴っていない時間も楽しめる要素が満載。
    会場内にテントを張って一夜を明かせることも大きな特徴として挙げられます。'
  },
  { image:  Rails.root.join("db/fixtures/images/image6.jpg").open,
    festival_name_id: '1',
    place_id: '1',
    event_date: '2020/07/11(土)-07/12(日)',
    prefecture_id: '0',
    body: '本イベントは、「音楽・アミューズメント・自然・アートが融合するイベント」をコンセプトにした、北海道の野外フェス。
    また、1月13日（月）まで11回目の開催を記念した「スペシャル福袋」と「完全受注生産2wayトートバッグ（缶バッヂ２個付き）」が販売中となっている。'
  },
  { image:  Rails.root.join("db/fixtures/images/image21.jpg").open,
    festival_name_id: '2',
    place_id: '2',
    event_date: '2020/04/25(土)-04/26(日)',
    prefecture_id: '3',
    body: '2001年から続く東北最大のロックフェス。早くからGW開催に踏み切った日本を代表する春フェス。'
  },
  { image:  Rails.root.join("db/fixtures/images/image5.jpg").open,
    festival_name_id: '3',
    place_id: '3',
    event_date: '2020/05/04(月)-05/06(水)',
    prefecture_id: '11',
    body: 'ロッキング・オンが主催するGW開催のロックフェス。様々な会場を経て、現在の会場に定着。'
  },
  { image:  Rails.root.join("db/fixtures/images/image4.jpg").open,
    festival_name_id: '4',
    place_id: '4',
    event_date: '2020/05/02(土)-05/05(火)',
    prefecture_id: '10',
    body: 'VIVA LA ROCK（ビバ・ラ・ロック）は、FACT、DISK GARAGEが主催する、室内ロック・フェスティバルである。 初開催は2014年。
     ゴールデンウィークのに埼玉県のさいたまスーパーアリーナにて行われる。'
  },
  { image:  Rails.root.join("db/fixtures/images/image3.jpg").open,
    festival_name_id: '5',
    place_id: '5',
    event_date: '2020/05/23(土)-05/24(日)',
    prefecture_id: '12',
    body: '2都市で開催される「METROCK 2020」はそれぞれ、大阪・5月16日（土）～17日（日）、海とのふれあい広場にて、
    東京・5月23日（土）～24日（日）、新木場・若洲公園にての開催となる。'
  },
  { image:  Rails.root.join("db/fixtures/images/image9.jpg").open,
    festival_name_id: '6',
    place_id: '6',
    event_date: '2020/08/08(土)-08/10(月',
    prefecture_id: '7',
    body: '昨年20回目を迎え、開催日を5日間に拡大して行われた「ROCK IN JAPAN FESTIVAL 2019」の来場者数が発表された。
    5日間合計で、過去最大となる33万7,421人が来場した。'
  },
  { image:  Rails.root.join("db/fixtures/images/image8.jpg").open,
    festival_name_id: '7',
    place_id: '7',
    event_date: ' 2020/08/28(金)-08/29(土)',
    prefecture_id: '18',
    body: '世界文化遺産に登録されている富士山と、その富士山に一番近い湖の山中湖を望むロケーションで、音楽を楽しむことのできる本イベント。
    今回で25回目の開催となる。'
  },
  { image:  Rails.root.join("db/fixtures/images/image12.jpg").open,
    festival_name_id: '8',
    place_id: '8',
    event_date: '2020/08/21(金)-08/23(日)',
    prefecture_id: '14',
    body: '23回目を迎えた「FUJI ROCK FESTIVAL’19」は、7/25（木）の前夜祭から延べ4日間、130,000人が来場した。
    会場内で来年度の日程もアナウンスされ、2020年8月20日（金）〜8月23日（日）の3日間、2020年東京オリンピックの閉幕後に開催されることも明らかになった。'
  },
  { image:  Rails.root.join("db/fixtures/images/image13.jpg").open,
    festival_name_id: '9',
    place_id: '9',
    event_date: '2020/04/19(日)',
    prefecture_id: '23',
    body: 'ヨーロッパや中国でも開催されてきたオランダ発のEDMフェス。2020年日本初上陸。'
  },
  { image:  Rails.root.join("db/fixtures/images/image15.jpg").open,
    festival_name_id: '10',
    place_id: '10',
    event_date: '2020/04/04(土)-04/05(日)',
    prefecture_id: '22',
    body: '04 Limited Sazabysが地元・名古屋にて主催する野外フェス。今回で5回目の開催となる。'
  },
  { image:  Rails.root.join("db/fixtures/images/image14.jpg").open,
    festival_name_id: '11',
    place_id: '11',
    event_date: '2020/07/04(土)-07/05(日)',
    prefecture_id: '25',
    body: '今年で11回目を迎え、約4万人を動員する京都・宇治で7月7日(土)・8日(日)の2日間開催される野外ロックフェスティバル「京都大作戦」とジェイアール京都伊勢丹が初タッグを組み、
    6月27日(水)〜7月10日(火)まで、ジェイアール京都伊勢丹にリミテッドショップが登場する。'
  },
  { image:  Rails.root.join("db/fixtures/images/image16.jpg").open,
    festival_name_id: '12',
    place_id: '12',
    event_date: ' 2020/08/22(土)-08/23(日)',
    prefecture_id: '36',
    body: 'モンバスが初めて開催されたのはサマソニやロッキンジャパンと同じ2000年で、国内の主要ロックフェスの中でも歴史の長い老舗のフェス。'
  },
  { image:  Rails.root.join("db/fixtures/images/image17.jpg").open,
    festival_name_id: '13',
    place_id: '13',
    event_date: '2020/07/18(土)-07/19(日)',
    prefecture_id: '39',
    body: 'イベント名は博多弁の「なんばしよっと」（何をしている？）に引っ掛けたもの。'
  },
  { image:  Rails.root.join("db/fixtures/images/image19.jpg").open,
    festival_name_id: '14',
    place_id: '14',
    event_date: '2020/05/16(土)',
    prefecture_id: '46',
    body: 'フェスの正式タイトルは、「MIYAKO ISLAND ROCK FESTIVAL 2019～SAVE THE SEA, SAVE THE SKY～海に優しく、空に優しい、南の島のロックフェス」。'
  },
])