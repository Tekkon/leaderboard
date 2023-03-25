class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.references :country, index: true, foreign_key: true
      t.integer :score, null: false, default: 0
      t.index :name
      t.index :score
      t.index %i[country_id score]

      t.timestamps
    end
  end
end
