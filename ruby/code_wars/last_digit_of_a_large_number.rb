def last_digit(n1, n2)
  n1 = n1.to_s[/\A0\z|[1-9]{1,2}[0]*\z/].sub(/0{2,}/, '0')
  n2 = n2.to_s[/\A0\z|[1-9]{1,2}[0]*\z/].sub(/0{2,}/, '0')
  n1.to_i ** n2.to_i % 10
end
