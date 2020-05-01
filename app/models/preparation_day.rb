class PreparationDay < ActiveHash::Base
  include ActiveHash::Associations
  has_many :items
  self.data = [
    {id: 1, preparation_day_name: '1〜2日で発送'}, {id: 2, preparation_day_name: '2〜3日で発送'}, {id: 3, preparation_day_name: '4〜7日で発送'}
]
end
