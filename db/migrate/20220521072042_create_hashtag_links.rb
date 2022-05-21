class CreateHashtagLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :hashtag_links do |t|
      t.references :question, null: false, foreign_key: true
      t.references :hashtag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
