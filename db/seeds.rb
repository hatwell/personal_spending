require('pg')
require('pry-byebug')
require_relative('../models/tag')
require_relative('../models/retailer')
require_relative('../models/transaction')

Tag.delete_all()
tags = ["food", "clothing", "other", "entertainment", "health and fitness"]

tags.each do |tag|
  new_tag = Tag.new({
    'tag_name' => tag
    })
    new_tag.save()
end

Retailer.delete_all()

retailers = ["Tesco", "H&M", "Maplin", "Odeon", "Northampton Athletic Club"]
retailers.each do |retailer|
  new_retailer = Retailer.new({
    'retailer_name' => retailer
    })
    new_retailer.save()
end

Transaction.delete_all()
transaction1 = Transaction.new({
  'item_name' => 'weekly shop',
  'transaction_date' => 04/04/2017,
  'retailer_id' => Retailer.all[3].id,
  'tag_id' => Tag.all[0].id,
  'cost' => 5.00
})

transaction1.save()



binding.pry
nil
