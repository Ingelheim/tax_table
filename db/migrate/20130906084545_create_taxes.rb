class CreateTaxes < ActiveRecord::Migration
  def change
    create_table :taxes do |t|
    	t.datetime :left
    	t.datetime :return
    	t.integer :days
    	t.integer :hours
    	t.string :comment
    end
  end
end
