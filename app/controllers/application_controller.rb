class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end

  get '/bakeries/:id' do
    bakeries = Bakery.find(params[:id])
    bakeries.to_json(include: :baked_goods)
end

  get '/baked_goods/by_price' do
    baked_goods = BakedGood.all.order(price: :desc)
    baked_goods.to_json
  end

  get '/baked_goods/most_expensive' do
    baked_goods = BakedGood.all.order(price: :desc).first
    baked_goods.to_json
  end
  

end


# GET /bakeries: returns an array of JSON objects for all bakeries in the database.
# GET /bakeries/:id: returns a single bakery as JSON with its baked goods nested in an array. Use the id from the URL to look up the correct bakery. (HINT: you'll need to pass in some custom options to the #to_jsonLinks to an external site. method.)
# GET /baked_goods/by_price: returns an array of baked goods as JSON, sorted by price in descending order. (HINT: how can you use Active Record to sort the baked goods in a particular order?)
# GET /baked_goods/most_expensive: returns the single most expensive baked good as JSON. (HINT: how can you use Active Record to sort the baked goods in a particular order?)