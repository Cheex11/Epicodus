require 'date'

class Task

  def initialize(description, priority, due_date)
    @description = description
    @due_date = due_date
    @priority = priority
  end

  def description
    @description.to_s
  end

  def due_date
    @due_date = Date.parse(@due_date).to_s
  end

  def priority
    @priority
  end

  def new_task_description(description)
    @description = description
  end

end

