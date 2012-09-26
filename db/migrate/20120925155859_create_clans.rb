class CreateClans < ActiveRecord::Migration
  def change
    create_table :clans do |t|
      t.string :name
      t.string :ensign

      t.timestamps
    end
  end
end
