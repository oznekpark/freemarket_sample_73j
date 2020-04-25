class PostageType < ActiveHash::Base
  self.data = [
    {id: 1, postage_type: '小型サイズ - ネコポス（らくらくメルカリ便）
    '}, {id: 2, postage_type: '小型サイズ（A4）- ゆうパケット（ゆうゆうメルカリ便）'}, {id: 3, postage_type: 'ゆうメール（着払いあり）'},
    {id: 4, postage_type: 'ゆうパケット'}, {id: 5, postage_type: 'レターパック'}, {id: 6, postage_type: '普通郵便（定形、定形外）'},
    {id: 7, postage_type: 'クリックポスト'}, {id: 8, postage_type: '小〜中型サイズ - 宅急便コンパクト（らくらくメルカリ便）'}
]
end
