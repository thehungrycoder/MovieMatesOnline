class Movie < ActiveRecord::Base
  has_one :review

  searchable do
    text :name
    integer :released
    string :imdbid
    boolean :is_public
    integer :id
  end
end
