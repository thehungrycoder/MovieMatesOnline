class Movie < ActiveRecord::Base
  #include FlexiModel

  has_one :review

  #_string :name


  searchable do
    integer :id
    text :name
    integer :released
    string :imdbid
    boolean :is_public
    integer :id
  end
end
