require( 'sinatra' )
require( 'sinatra/contrib/all' )

require_relative('../models/tag')
require_relative('../models/transaction')
require_relative('../models/retailer')

get '/transactions' do

end

get '/transactions/new' do

end

post '/transactions' do
  transaction = Transaction.new(params)
  transaction.save()

end

get '/transactions/:id' do

end

get '/transactions/:id/edit' do

end

delete '/transactions/:id' do

end

put 'transactions/:id' do
  
end
