class CreateAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :areas do |t|
      t.string :zipcode
      t.string :name
      t.timestamps
    end
  end
end
