require 'data_mapper'
require 'dm-types'

class Space
  include DataMapper::Resource

  property :id,          Serial
  property :name,        String,     :required => true
  property :description, Text,       :required => true, lazy: false
  property :price,       Integer,    :required => true
  property :start_date,  Date,       :required => true
  property :end_date,    Date,       :required => true

  belongs_to :user
end
