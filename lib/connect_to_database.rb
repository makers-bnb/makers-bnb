require 'data_mapper'
require 'dotenv/load'

user = ENV['POSTGRES_USER']

if ENV['RACK_ENV'] == 'test'
  DataMapper.setup(:default,
    "postgres://#{user}@localhost/makers_bnb_test")
else
  DataMapper.setup(:default,
    "postgres://#{user}@localhost/makers_bnb"
end

DataMapper.finalize
DataMapper.auto_upgrade!
