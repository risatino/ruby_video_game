require 'vg_tools'
require 'io/console'

session = Maze.session(skip_intro: true)

session.play do |game|
    finished = false
    game.reset_screen
    error_message = false
    winner = false
    
    until finished == true
     game.reset_screen
     game.reset_map
     game.place_character
     game.print_map
     
     if error_message == true
         puts "invalid entry please try again"
         error_message = false
     else
         puts ""
     end
    puts "Enter w = ⬆, a = ⬅, s = ⬇, d = ➡"
    puts "or 'l' to leave"
    
    input = STDIN.getch
    
    if input ==  'w'
       game.move_up
       if game.moved_to_a_valid_square? == false
           game.move_down
           error_message = true
       end
    elsif input == "a"
       game.move_left
       if game.moved_to_a_valid_square? == false
           game.move_right
           error_message = true
       end
    elsif input == "s"
       game.move_down
       if game.moved_to_a_valid_square? == false
           game.move_up
           error_message = true
       end
    elsif input == "d"
       game.move_right
       if game.moved_to_a_valid_square? == false
           game.move_left
           error_message = true
        end
    elsif input == 'l'
       finished = true
       winner = true
    end
    
    end
    if game.win?
        finished = true
        winner = true
    end
    
    if winner == true
        puts "Congratulations. You Won!!!"
    end

    puts "Thank you for playing"
end
    
    






















# puts "Enter w = ⬆, a = ⬅, s = ⬇, d = ➡ o move, or ‘exit’ to leave game"