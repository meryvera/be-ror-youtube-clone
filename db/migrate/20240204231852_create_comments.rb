class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.text :content, limit: 500, null: false
      t.references :user, null: false, foreign_key: true
      t.references :video, null: false, foreign_key: true

      t.timestamps
    end
    # Agregar índices
    add_index :comments, :user_id
    add_index :comments, :video_id
  end
end
