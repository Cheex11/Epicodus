require 'pg'
require 'rspec'
require 'train_stations'
require 'train_lines'

DB = PG.connect(:dbname => 'train_system_choo_choo_test')

 RSpec.configure do |config|
   config.after(:each) do
     DB.exec("DELETE FROM stations *;")
     DB.exec("DELETE FROM lines *;")
   end
 end
