class ItemCondition < ActiveHash::Base
  self.data = [
    {id: 1, item_condition: '新品、未使用'}, {id: 2, item_condition: '未使用に近い'}, {id: 3, item_condition: '目立った傷や汚れなし'},
    {id: 4, item_condition: 'やや傷や汚れあり'}, {id: 5, item_condition: '傷や汚れあり'}
]
end

# 新品、未使用：購入してからあまり時間が経っておらず、一度も使用していない
# 未使用に近い：数回しか使用しておらず、傷や汚れがない
# 目立った傷や汚れなし：よく見ないとわからない程度の傷や汚れがある
# やや傷や汚れあり：中古品とわかる程度の傷や汚れがある
# 傷や汚れあり：誰がみてもわかるような大きな傷や汚れがある