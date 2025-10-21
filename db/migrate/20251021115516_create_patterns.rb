class CreatePatterns < ActiveRecord::Migration[8.0]
  def change
    create_table :patterns do |t|
      t.string :title
      t.string :source
      t.float :rating
      t.float :difficulty
      t.integer :made
      t.string :tags
      t.string :yarn_weight
      t.string :stitch_type
      t.string :size
      t.float :yarn_estimate
      t.string :notes
      t.string :link
      t.integer :user_id

      t.timestamps
    end
  end
end
