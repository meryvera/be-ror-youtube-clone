class CreateVideos < ActiveRecord::Migration[7.1]
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.string :url_video
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    # Agregar índices
    # add_index :videos, :user_id
  end
end
