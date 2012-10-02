class RemoveInFromNinja < ActiveRecord::Migration
  def up
    remove_column :ninjas, :in
  end

  def down
    add_column :ninjas, :in, :text
  end
end
