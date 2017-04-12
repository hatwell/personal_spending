require('pry-byebug')
require('sinatra')
require('sinatra/contrib/all')
require_relative('models/tag')
require_relative('models/transaction')
require_relative('models/retailer')
require_relative('controllers/tag_controller')
require_relative('controllers/transaction_controller')
require_relative('controllers/retailer_controller')


get '/' do
  erb(:index)
end
