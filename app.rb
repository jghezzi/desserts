require 'sinatra'

get "/Error" do
	"Error"
end

get "/not-in-list" do
	"That's not in the list!"
end

get "/desserts" do
	"Desserts"
	@desserts = Dessert.desserts
	erb :"desserts/index"
end

get "/add-dessert" do
	"Input a dessert to add and click 'Submit'"
	@desserts = Dessert.desserts
	erb :"add-dessert/index"
end

get "/delete-dessert" do
	"Input a dessert to delete and click 'Submit'"
	@desserts = Dessert.desserts
	erb :"delete-dessert/index"
end

post "/add-dessert" do
	text = params[:description]
	if Dessert.add_to_desserts(text)
	 redirect "/desserts"
	else
		redirect "/Error"
	end
end

post "/delete-dessert" do
	kill = params[:to_delete]
	if Dessert.delete_desserts(kill)
		redirect "/desserts"
	else
		redirect "/not-in-list"
	end
end


class Dessert
	@@desserts = ["Ice Cream", "Cake"]

	def initialize
	end

	def self.desserts
		@@desserts
	end

	def self.add_to_desserts(dessert)
		if dessert == "ham"
			return false
		else
			@@desserts << dessert
		end
	end

	def self.delete_desserts(dessert)
		if @@desserts.include? dessert
			@@desserts.delete(dessert)
		else
			return false
		end
	end
end

