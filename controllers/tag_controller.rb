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

get '/tags' do
  @tags = Tag.all()
  erb(:"tags/index")
end

get '/tags/new' do

end

post '/tags' do
  tag = Tag.new(params)
  tag.save()

end

get '/tags/:id' do

end

get '/tags/:id/edit' do

end

delete '/tags/:id' do

end

put 'tags/:id' do

end
