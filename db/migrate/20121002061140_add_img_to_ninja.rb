class AddImgToNinja < ActiveRecord::Migration
  def change
    add_column :ninjas, :img, :text
  end
end
