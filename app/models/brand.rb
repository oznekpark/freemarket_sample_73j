class Brand < ActiveHash::Base
  include ActiveHash::Associations
  has_many :items

  self.data = [
      {id: 1, name: 'シャネル'}, {id: 2, name: 'グッチ'}, {id: 3, name: 'ヴィトン'},
      {id: 4, name: 'ナイキ'}, {id: 5, name: 'アディダス'}, {id: 6, name: 'プーマ'},
      {id: 7, name: 'ブリーズ'}, {id: 8, name: 'マールマール'}, {id: 9, name: 'ユナイテッドアローズ'},
      {id: 10, name: 'ユニクロ'}, {id: 11, name: '無印良品'}, {id: 12, name: 'アバクロ'},
      {id: 13, name: 'H＆M'}, {id: 14, name: '岩波新書'}, {id: 15, name: '小学館'},
      {id: 16, name: 'パナソニック'}, {id: 17, name: 'HITACHI'}, {id: 18, name: '東芝'},
      {id: 19, name: '邦楽'}, {id: 20, name: '洋楽'}, {id: 21, name: 'K-POP'},
      {id: 22, name: 'クラシック'}, {id: 23, name: 'JASS'}, {id: 24, name: 'アニソン'},
      {id: 25, name: 'ダーバン'}, {id: 26, name: 'ラルフローレン'}, {id: 27, name: 'ダンヒル'},
      {id: 28, name: 'チフォネリ'}, {id: 29, name: 'ニューヨーカー'}, {id: 30, name: 'その他'}
  ]
end