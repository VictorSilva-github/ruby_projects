def calculator(number1, number2, operation)
    case operation
    when "+"
      result = number1 + number2
    when "-"
      result = number1 - number2
    when "*"
      result = number1 * number2
    when "/"
      result = number2.zero? ? nil : number1 / number2
    else
      result = nil
    end
    result
    # 
  end
  