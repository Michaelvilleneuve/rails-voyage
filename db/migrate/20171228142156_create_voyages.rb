class CreateVoyages < ActiveRecord::Migration[5.1]
  def change
    create_table :voyages do |t|
      t.string :title
      t.string :cover
      t.string :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
