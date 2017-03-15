class CreateAgendas < ActiveRecord::Migration[5.0]
  def change
    create_table :agendas do |t|
      t.string :title
      t.string :organizer
      t.string :image
      t.string :location
      t.date :date
      t.string :start
      t.string :end
      t.text :description
      t.decimal :price, :precision => 8, :scale => 2
      t.string :slug

      t.timestamps
    end
    add_index :agendas, :slug, unique: true
  end
end
