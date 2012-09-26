class CreateNinjas < ActiveRecord::Migration
  def change
    create_table :ninjas do |t|
      t.string :name
      t.string :surname
      t.string :tw
      t.string :fb
      t.text :desc
      t.integer :clan_id

      t.timestamps
    end
  end
end
