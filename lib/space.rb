require 'data_mapper'

class Space
  include DataMapper::Resource

  property :id,          Serial
  property :name,        String,     :required => true
  property :description, String,     :required => true
  property :price,       Integer,    :required => true
end
