require 'data_mapper'

class Request 
  include DataMapper::Resource
  property :id,     Serial
  property :date,   String, :required => true
  property :status, String, :default => 'Pending'

  belongs_to :space
  belongs_to :user
end
