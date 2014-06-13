require './lib/conway'

def start_game
  puts "How big do you want your grid?"
  grid_size_input = gets.chomp.to_i
  new_game = Conway.new(grid_size_input)
  system('clear')
  new_game.spaces.each do |space|
    if space < 10
      print " 0#{space} "
    else
      print " #{space} "
    end
    if space % grid_size_input == grid_size_input - 1
      print "\n"
    end
  end

  puts "what cells do you want to activate?"
  active_input = gets.chomp
  active_array = active_input.split(',')
  active_array.map! {|num| num.to_i}
  system('clear')
  new_game.toggle(active_array)
  new_game.board_reset

  new_game.spaces.each_with_index do |space, index|
    print " #{space} "
    if index % grid_size_input == grid_size_input - 1
      print "\n"
    end
  end

  puts "Press enter to start"
  gets.chomp


  system('clear')
  new_game.make_future_array
  new_game.future_array.each_with_index do |space, index|
    print " #{space} "
    if index % grid_size_input == grid_size_input - 1
      print "\n"
    end
  end




end

start_game
