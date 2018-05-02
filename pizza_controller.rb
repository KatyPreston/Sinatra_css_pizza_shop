require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative("./models/pizza_order.rb")


# READ orders
get '/pizza_orders' do
  @orders = PizzaOrder.all
  erb(:index)
end

# CREATE orders
get '/pizza_orders/new' do
  erb(:new)
end

post '/pizza_orders' do
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)
end

# SHOW order (like READ)
get '/pizza_orders/:id' do
  @order = PizzaOrder.find(params[:id])
  erb(:show)
end


# EDIT
get '/pizza_orders/:id/edit' do
  @order = PizzaOrder.find(params[:id])
  erb(:edit)
end

# UPDATE existing orders
post '/pizza_orders/:id' do
  @order = PizzaOrder.new(params)
  @order.update
  erb(:update)
end


# DELETE orders
post '/pizza_orders/:id/delete' do
  @order = PizzaOrder.find(params[:id])
  @order.delete
  erb(:destroy)
end
