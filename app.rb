require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite:///desserts_app.db"

get "/Error" do
	"Ham is not a dessert!"
end

get "/not-in-list" do
	"That's not in the list!"
end

get "/desserts/:id" do
	@dessert = Dessert.find(params[:id])
	erb :"desserts/show"
end

get "/desserts" do
	@desserts = Dessert.all
	# Dessert.all
	# @dessert = Dessert.find(params[:id])
 	erb :"desserts/index"
end

get "/add-dessert" do
	@new_dessert = Dessert.new
	#@desserts = Dessert.find(params[:id])
	erb :"add-dessert/index"
end

get "/delete-dessert" do
	@desserts = Dessert.all
	@dessert_to_delete = Dessert.find(params[:id])
	erb :"delete-dessert/index"
end

post "/add-dessert" do
	@dessert = Dessert.new(params[:dessert]) #calls new instance in db and fills with 'dessert[description]' from erb'
	@dessert.save
	redirect "/desserts"
end

delete "/desserts/:id" do
	dessert = Dessert.find(params[:id])
	if dessert.delete 
		redirect "/desserts"
	else
		redirect "/desserts/:id"
	end
end

post "/delete-dessert" do
	@desserts = Dessert.all

end

class Dessert < ActiveRecord::Base


	def self.add_to_desserts(dessert)
		if dessert == "ham"
			return false
		end

	end

	def self.delete_desserts(dessert)
		if @@dessert.include? dessert
			@@dessert.delete(dessert)
		else
			return false
		end
	end
end

