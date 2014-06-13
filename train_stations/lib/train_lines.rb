class Line

  def initialize(attributes)
    @name = attributes['name']
    @id = attributes['id']
  end

  def self.create(attributes) #test?
    new_line = Line.new(attributes)
    new_line.save()
    new_line
  end

  def name
    @name
  end

  def self.all
    lines = []
    results = DB.exec("SELECT * FROM LINES;")
    results.each do |result|
      lines << Line.new(result)
    end
    lines
  end

  def save
    results = DB.exec("INSERT INTO lines (name) VALUES ('#{@name}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def ==(another_line) #test?
    self.name == another_line.name
  end
end

