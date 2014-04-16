class FavDesserts < ActiveRecord::Migration
  def change
  	create_table :desserts do |t|
  		t.string :description
  		t.timestamps
  	end
  end
end
