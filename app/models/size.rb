class Size < ActiveHash::Base
  include ActiveHash::Associations
  has_many :items
  self.data = [
    {id: 1, name: 'XXS'}, {id: 2, name: 'XS(SS)'}, {id: 3, name: 'S'},
    {id: 4, name: 'M'}, {id: 5, name: 'L'}, {id: 6, name: 'XL(LL)'},
    {id: 7, name: '2XL(3L)'}, {id: 8, name: '3XL(4L)'}, {id: 9, name: '指定なし'}
]
end
