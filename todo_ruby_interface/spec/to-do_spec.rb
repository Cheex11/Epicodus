require 'rspec'
require 'task'
require 'list'
require './interface'

describe Task do
  it 'is initialized with a description' do
    test_task = Task.new('scrub the zebra',1,'thursday')
    test_task.should be_an_instance_of Task
  end

  it 'lets you read the desctiptyion out' do
    test_task = Task.new('scrub the zebra', 2, 'tomorrow')
    test_task.description.should eq 'scrub the zebra'
  end

describe 'remove_task' do
  it 'lets you remove items from your to-do list' do
    test_task = Task.new('eat the potato' ,2 , 'tuesday')
    test_task1 = Task.new('slice the banana', 3, 'wednesday')
    test_list = List.new('testlist')
    test_list.list << test_task
    test_list.list << test_task1
    remove_task(1, test_list)
    test_list.list.should == [test_task1]
  end
 end

describe 'new_task_description' do
  it 'lets you modify the decription of the task' do
    test_list = List.new('testlist')
    test_list.add_task('eat the potato' ,2 , 'tuesday')
    test_list.list[0].new_task_description('chop the banana')
    test_list.list[0].description.should eq 'chop the banana'
  end
 end
end

describe List do
  it 'should have a list of tasks and the ability to add to them' do
    test_list = List.new('things for tomorrrow ')
    test_list.should be_an_instance_of List
  end
  describe 'add_task' do
    it 'lets you add tasks to the list' do
    test_list = List.new('things for today')
    test_list.add_task('scrub the donkey', 2, 'wednesday')
    test_list.list[0].description.should eq 'scrub the donkey'
    end
  end

  describe 'sort_tasks_by_priority' do
    it 'sorsts tasks by priorty' do
      testlist = List.new('test')
      testlist.add_task('item 1', 2, 'Wednesday')
      testlist.add_task('item 2', 1, 'Thursday')
      testlist.add_task('item 3', 3, 'Friday')
      testlist.sort_tasks_by_priority()
      testlist.list[0].priority.should == 1
    end
  end

  describe 'sort_tasks_by_due_date' do
    it 'sorsts tasks by priorty' do
      testlist = List.new('test')
      testlist.add_task('item 1', 2, '2/12')
      testlist.add_task('item 2', 1, '2/8')
      testlist.add_task('item 3', 3, '2/13')
      testlist.sort_tasks_by_due_date
      testlist.list[0].due_date.should == '2014-02-08'
    end
  end

  describe 'sort_tasks_by_description' do
    it 'sorsts tasks by priorty' do
      testlist = List.new('test')
      testlist.add_task('item 1', 2, 'Wednesday')
      testlist.add_task('item 2', 1, 'Thursday')
      testlist.add_task('item 3', 3, 'Friday')
      testlist.sort_tasks_by_description
      testlist.list[0].description.should == 'item 1'
    end
  end
end
