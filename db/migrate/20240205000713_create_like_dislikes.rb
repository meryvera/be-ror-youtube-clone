class CreateLikeDislikes < ActiveRecord::Migration[7.1]
  def change
    create_table :like_dislikes do |t|
      t.boolean :like
      t.references :user, null: false, foreign_key: true, type: :bigint
      t.references :like_dislike_model, polymorphic: true, null: false, type: :bigint

      t.timestamps
    end

    # Agregar índices
    add_index :like_dislikes, [:like_dislike_model_type, :like_dislike_model_id]
    add_index :like_dislikes, :user_id
  end
end
