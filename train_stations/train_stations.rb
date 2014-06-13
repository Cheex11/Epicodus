require './lib/train_stations'
require './lib/train_lines'
require 'pg'

DB = PG.connect(:dbname =>'train_system_choo_choo')

def main_menu
  system('clear')
  puts('SPRINGFIELD MONORAIL')
  puts('Are you an operator or a user?')
  puts('Type exit to exit')

  case gets.chomp
  when 'user'
    user_interface
  when 'operator'
    operator_interface
  when 'exit'
    puts ('goodbye')
  else
    puts 'Please enter u or o'
    sleep(2)
    main_menu
  end

end

def operator_interface
  system('clear')
  puts('Welcome Operator, what would you like to do?')
  puts('Type "add station" to add a station')
  puts('Type "add line" to add a line')
  puts('Type "add stop" to add a stop')
  puts('Type "view stations" to view all stations')
  puts('Type "view lines" to view all lines')
  puts('Type "view stops" to view all stops')
  puts('Type "delete station" to delete a station')
  puts('Type "delete line" to delete a line')
  puts('Type "main" to return to the main menu')
  input = gets.chomp

  case input
  when 'add station'
    add_station
  when 'add stop'
    add_line_to_station
  when 'delete station'
    delete_station
  when 'view stations'
    view_stations_operator
  when 'add line'
    add_line
  when 'delete line'
    delete_line
  when 'view lines'
    view_lines_operator
  when 'view stops'
    view_stops
  when 'main'
    main_menu
  else
    puts('Try again, operator')
    operator_interface
  end
end

def add_station
  puts ("What is the name of the station you want to add?")
  input = gets.chomp
  new_station = Station.create({'name' => input})
  operator_interface
end

def delete_station
  list_stations
  puts ("What station would you like to delete?  If you have changed your mind and no longer wish to delete a station you can type 'go back' to return to the operator interface")
  input = gets.chomp
  case input
  when 'go back'
    operator_interface
  else
    DB.exec("DELETE FROM stations WHERE name = '#{input}';")
    operator_interface
  end
end

def view_stations_operator
  list_stations
  puts ("Type a station to see all lines that stop at that station.")
  puts ("Type 'go back' to return to the operaotr interface")
  input = gets.chomp
  case input
  when 'go back'
    operator_interface
  else
    lines_by_station(input)
  end
end

def add_line
  puts ("What is the name of the line you want to add?")
  input = gets.chomp
  new_station = Line.create({'name' => input})
  operator_interface
end

def delete_line
  list_lines
  puts ("What lines would you like to delete?  If you have changed your mind and no longer wish to delete a line you can type 'go back' to return to the operator interface")
  input = gets.chomp
  case input
  when 'go back'
    operator_interface
  else
    DB.exec("DELETE FROM lines WHERE name = '#{input}';")
    operator_interface
  end
end

def view_lines_operator
  list_lines
  puts ("Type the name of a line to see all stations that the line stops at.")
  puts ("Type add to add a station to a line")
  puts ("Type 'go back' to return to the operaotr interface")
  input = gets.chomp
  case input
  when 'go back'
    operator_interface
  when 'add'
    add_line_to_station
  else
    station_by_lines(input)
  end
end

def add_line_to_station
  system('clear')
  list_stations
  puts('')
  list_lines
  puts('')

  puts ("Type 'LINE stops STATION to add the stop")
  puts ("Type 'go back' to go back")
  input = gets.chomp
  if input == 'go back'
    view_lines_operator
  else
    input = input.split(' stops ')
    add_stop(input[0], input[1])
  end
end




def user_interface
  system('clear')
  puts('Welcome user, what would you like to do?')
  puts('Type "view lines" to view lines')
  puts('Type "view stations" to view stations')
  puts('Type "view stops" to view all stops made by all lines')
  puts('Type main to return to the main menu')

  case gets.chomp
  when 'view lines'
    view_lines_user
  when 'view stations'
    view_stations_user
  when 'view stops'
    view_stops
  when 'main'
    main_menu
  else
    puts("Try again")
    sleep(2)
    user_interface
  end
end

def view_lines_user
  system('clear')
  list_lines

  puts("type go back to return to the user interface")
  puts('type view stations to see all the stations a particular line stops at.')
  case gets.chomp
  when 'go back'
    user_interface
  when 'view stations'
    view_stations_from_lines
  else
    puts ('try again')
    sleep(1)
    view_lines_user
  end
end

def view_stations_user
  system('clear')
  list_stations
  puts("type go back to return to the user interface")
  puts('type view lines to view all the lines at a particular station.')
  case gets.chomp
  when 'go back'
    user_interface
  when 'view lines'
    view_lines_at_station
  else
    puts('try again')
    sleep (1)
    view_stations_user
  end
end

def view_lines_at_station
  puts("What station would you like to see stops for?")
  input = gets.chomp
  requested_station_id = (DB.exec("SELECT * FROM stations WHERE name = '#{input}';"))[0]['id']
  stops_results = DB.exec("select * from stops where station_id = '#{requested_station_id}';")
  stops_results.each do |result|
    station_name = DB.exec("SELECT name FROM stations WHERE id = '#{result['station_id']}';")[0]['name']
    line_name = DB.exec("SELECT name FROM lines WHERE id = '#{result['line_id']}';")[0]['name']
    puts line_name + ' stops at ' + station_name
  end


  puts 'type anything to go back'
  input = gets.chomp
  view_lines_user
end


def view_stations_from_lines
  puts("What line would you like to know about?")
  input = gets.chomp

  requested_line_id = (DB.exec("SELECT * FROM lines WHERE name = '#{input}';"))[0]['id']
  stops_results = DB.exec("SELECT * FROM stops WHERE line_id = '#{requested_line_id}';")

  stops_results.each do |result|
    station_name = DB.exec("SELECT name FROM stations WHERE id = '#{result['station_id']}';")[0]['name']
    line_name = DB.exec("SELECT name FROM lines WHERE id = '#{result['line_id']}';")[0]['name']
    puts line_name + ' stops at ' + station_name
  end


  puts 'type anything to go back'
  input = gets.chomp
  view_lines_user
end


def list_stations
  puts("Here are the stations:")
  Station.all.each do |station|
    puts station.name
  end
end

def list_lines
  puts ("Here are all the lines:")
  Line.all.each do |line|
    puts line.name
  end
end

def add_stop(line_name, station_name)
  new_line_id = (DB.exec("SELECT * FROM lines WHERE name = '#{line_name}';"))[0]['id']
  new_station_id = (DB.exec("SELECT * FROM stations WHERE name = '#{station_name}';"))[0]['id']
  DB.exec("INSERT INTO stops (station_id, line_id) VALUES ('#{new_station_id}', '#{new_line_id}') RETURNING id;")
  operator_interface
end

def view_stops
  stops = DB.exec("SELECT * FROM STOPS")

  puts ('STOPS:')
  stops.each do |stop|
    station_name = DB.exec("SELECT name FROM stations WHERE id = '#{stop['station_id']}';")[0]['name']
    line_name = DB.exec("SELECT name FROM lines WHERE id = '#{stop['line_id']}';")[0]['name']
    puts line_name + ' stops at ' + station_name
  end

  puts "type anything to return to the main menu"

  case gets.chomp
  when 'main'
    main_menu
  else
    main_menu
  end
end

main_menu
