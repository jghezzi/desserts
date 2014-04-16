require 'rspec'
require './app.rb'

describe Dessert do
	it 'should have desserts' do
		Dessert.desserts.should_not be_empty
	end

	it 'should add a dessert' do
		first_count = Dessert.desserts.count
		dessert = "Pie"
		Dessert.add_to_desserts(dessert)
		second_count = Dessert.desserts.count

		second_count.should > first_count
	end

	it 'should delete a dessert' do
		first_count = Dessert.desserts.count
		dessert = "Pie"
		Dessert.delete_desserts(dessert)
		second_count = Dessert.desserts.count

		second_count.should < first_count
	end

	it 'should deliver an error if no such dessert exists to be deleted' do
		dessert = "Not In List"
		Dessert.delete_desserts(dessert).should be_false
	end

	it 'should deliver an error if ham is added' do
		first_count = Dessert.desserts.count
		dessert = "ham"
		Dessert.add_to_desserts(dessert)
		second_count = Dessert.desserts.count

		second_count.should == first_count
	end

end

