class CreatePets < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :type
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
