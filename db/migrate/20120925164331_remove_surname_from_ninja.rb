class RemoveSurnameFromNinja < ActiveRecord::Migration
  def up
    remove_column :ninjas, :surname
  end

  def down
    add_column :ninjas, :surname, :string
  end
end
