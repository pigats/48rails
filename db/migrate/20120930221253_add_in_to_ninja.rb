class AddInToNinja < ActiveRecord::Migration
  def change
    add_column :ninjas, :in, :text
  end
end
