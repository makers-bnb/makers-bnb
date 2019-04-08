require 'data_mapper'

if ENV['RACK_ENV'] == 'test'
  DataMapper.setup(:default,
    "postgres://student@localhost/makers_bnb_test")
else
  DataMapper.setup(:default,
    "postgres://student@localhost/makers_bnb")
end

DataMapper.finalize
DataMapper.auto_upgrade!