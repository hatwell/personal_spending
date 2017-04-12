require( 'sinatra' )
require( 'sinatra/contrib/all' )

require_relative('../models/tag')
require_relative('../models/transaction')
require_relative('../models/retailer')

require( 'sinatra' )
require( 'sinatra/contrib/all' )

require_relative('../models/tag')
require_relative('../models/transaction')
require_relative('../models/retailer')

get '/retailers' do

end

get '/retailers/new' do

end

post '/retailers' do
  retailer = Retailer.new(params)
  retailer.save()

end

get '/retailers/:id' do

end

get '/retailers/:id/edit' do

end

delete '/retailers/:id' do

end

put 'retailers/:id' do

end
