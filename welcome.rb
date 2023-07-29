class Welcome
    puts "Welcome to FilmManiacos, would you like to know more about"
    router = gets.chomp.downcase
    
    
    case router
    when "Filmes do ano"
        puts "Aqui voce vera os filmes do ano e os melhores comentaristas do cinema Brasileiro"
    when "Series do ano"
        puts "Aqui voce vai ver todas as melhores series do ano."
    else
        puts "ERRO, Escolha um dos menus"
    end
puts 
end
