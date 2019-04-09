require 'data_mapper'

class Space
  include DataMapper::Resource

  property :id,          Serial
  property :name,        String,     :required => true
  property :description, Text,       :required => true, lazy: false
  property :price,       Integer,    :required => true

  belongs_to :user
end
