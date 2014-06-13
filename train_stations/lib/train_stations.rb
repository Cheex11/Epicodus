class Station

  def initialize(attributes)
    @name = attributes['name']
    @id = attributes['id']
  end

  def self.create(attributes) #test?
    new_station = Station.new(attributes)
    new_station.save()
    new_station
  end

  def name
    @name
  end

  def self.all
    stations = []
    results = DB.exec("SELECT * FROM STATIONS;")
    results.each do |result|
      stations << Station.new(result)
    end
    stations
  end

  def save
    results = DB.exec("INSERT INTO stations (name) VALUES ('#{@name}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def ==(another_station) #test?
    self.name == another_station.name
  end
end

