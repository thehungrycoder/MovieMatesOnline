class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :movie
      t.references :user
      t.text :review
      t.string :impact

      t.timestamps
    end
    add_index :reviews, :movie_id
    add_index :reviews, :user_id
  end
end
