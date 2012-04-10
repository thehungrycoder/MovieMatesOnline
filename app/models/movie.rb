class Movie
  include Mongoid::Document

  field :name, :type => String
  field :alternate_names, :type => String
  field :imdbid, :type => String
  field :released, :type => Integer
  field :tagline, :type => String
  field :overview, :type => String
  field :imdb_rating, :type => String
  field :certificate, :type => String
  field :runtime, :type => String
  field :cover_image, :type => String
  field :display, :type => Boolean, :Default => 1
  field :created_at, :type => Date, :Default => Time.now
  field :updated_at, :type => Date

  default_scope where(:display => 1)
end
