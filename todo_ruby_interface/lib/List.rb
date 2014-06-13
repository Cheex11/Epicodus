class List

  def initialize(name)
    @name = name
    @list =[]
  end

  def list
    @list
  end

  def name
    @name
  end

  def add_task(description, priority, due_date)
    a = Task.new(description, priority, due_date)
    self.list << a
  end

  def sort_tasks_by_priority
    @list.sort_by! {|task| task.priority }
    @list.each do |task|
      puts task.description + " and the priority is " + task.priority.to_s
    end
   @list
  end

  def sort_tasks_by_due_date
    @list.sort_by! {|task| task.due_date }
    @list.each do |task|
      puts task.description + " and the due date is " + task.due_date.to_s
    end
    @list
  end

  def sort_tasks_by_description
    @list.sort_by! {|task| task.description }
    @list.each do |task|
      puts task.description
    end
    @list
  end



end


