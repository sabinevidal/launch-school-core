produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}
nada = {}

def select_fruit(produce_list)
  selected_fruits = produce_list.select {|key, value| value == 'Fruit'}
  selected_fruits
end



p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
p select_fruit(nada)
