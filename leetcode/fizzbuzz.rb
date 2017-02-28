def fizzbuzz(n)
  (1..n).to_a.map do |val|
    if val % 3 == 0 && val % 5 == 0
      "FizzBuzz"
    elsif val % 5 == 0
      "Buzz"
    elsif val % 3 == 0
      "Fizz"
    else
      "#{val}"
    end
  end
end

p fizzbuzz(15)
