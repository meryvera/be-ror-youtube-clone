class CreateVideos < ActiveRecord::Migration[7.1]
  def change
    create_table :videos do |t|
      t.string :title, null: false
      t.text :description, limit: 200, null: false
      t.string :url_video, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    # Agregar índices
    add_index :videos, :user_id
  end
end
