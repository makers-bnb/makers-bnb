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

  def self.filter_spaces(start_date, end_date, user)
    start_date = start_date.nil? || start_date.empty? ? Date.new(1900, 01, 01) : Date.strptime(start_date, "%Y-%m-%d")
    end_date = end_date.nil? || end_date.empty? ? Date.new(2200, 01, 01) : Date.strptime(end_date, "%Y-%m-%d")
    spaces_outside_range = Space.all(:start_date.gt => end_date) + Space.all(:end_date.lt => start_date)
    user_spaces = Space.all(:user => user)
    return Space.all - spaces_outside_range - user_spaces
  end
end
