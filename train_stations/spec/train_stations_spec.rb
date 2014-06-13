require 'spec_helper'

describe 'Station' do
  it 'initiates with a name' do
    test_station = Station.new({'name' => 'Rosebank'})
    test_station.should be_an_instance_of Station
  end

  it 'should tell you its name' do
    test_station = Station.new({'name' => 'Rosebank'})
    test_station.name.should eq 'Rosebank'
  end

  it 'should start out with no stations' do
    Station.all.should eq []
  end

  it 'should save itself to the database when created' do
    test_station = Station.new({'name' => 'Gresham'})
    test_station.save
    Station.all.should eq [test_station]
  end

  describe 'create' do
    it 'should create a new instance of Station and save it to the database' do
      test_station = Station.create({"name" => "Muisenberg"})
      Station.all.should eq [test_station]
    end
  end
end
