class AddXAndYToNinja < ActiveRecord::Migration
  def change
    add_column :ninjas, :x, :integer
    add_column :ninjas, :y, :integer
  end
end
