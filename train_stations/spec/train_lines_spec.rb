require 'spec_helper'

describe 'Line' do
  it 'initiates with a name' do
    test_line = Line.new({'name' => 'Yellow'})
    test_line.should be_an_instance_of Line
  end

  it 'should tell you its name' do
    test_line = Line.new({'name' => 'Orange'})
    test_line.name.should eq 'Orange'
  end

  it 'should start out with no stations' do
    Line.all.should eq []
  end

  it 'should save itself to the database when created' do
    test_line = Line.new({'name' => 'Blue'})
    test_line.save
    Line.all.should eq [test_line]
  end

  describe 'create' do
    it 'should create a new instance of Line and save it to the database' do
      test_line = Line.create({"name" => "Green"})
      Line.all.should eq [test_line]
    end
  end
end
