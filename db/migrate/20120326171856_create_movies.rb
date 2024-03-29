class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.text :overview
      t.integer :duration
      t.boolean :is_public
      t.string :imdbid
      t.float :imdb_rating
      t.string :certificate
      t.string :tmdbid
      t.string :released

      t.timestamps
    end
  end
end
