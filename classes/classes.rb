class Citizen
    # inicializamos nossa classe com três variáveis de instância
    def initialize(first_name, last_name, age)
      @first_name = first_name
      @last_name = last_name
      @age = age
    end

    # criamos o método can_vote? que retorna uma comparação entre age e 18, o resultado dessa comparação é um booleano
    def can_vote?
      @age >= 18
    end
  
    # retornamos uma string com as duas variáveis de instância interpoladas e devidamente capitalizadas
    def full_name
      "#{@first_name.capitalize} #{@last_name.capitalize}"
    end

    puts victor = Citizen.new("Victor", "Silva", 25)
    puts victor.full_name
    puts victor.can_vote?
# 
end