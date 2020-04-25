class PostagePayer < ActiveHash::Base
  self.data = [
    {id: 1, postagepayer: '送料込み(出品者負担)'}, {id: 2, postagepayer: '着払い(購入者負担)'}
]
end
