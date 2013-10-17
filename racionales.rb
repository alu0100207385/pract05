require './gcd.rb'

class NumerosRacionales
  attr_reader :a, :b
  
  def initialize (a, b)
    @a,@b = a,b
  end
  
  def to_s
    "#{@a}/#{@b}"
  end
  
  def +(other) 					#para sumar dos nums racionales...
    deno = mcm(@b, other.b)			#MCM para hallar el denominador
    num = ((deno/@b) * @a) + ((deno/other.b) * other.a)
    simplifica = gcd(num,deno)			#averiguamos el valor para obtener el racional irreducible
    if ((num < 0) and (deno < 0)) or ((num > 0) and (deno < 0)) #corregimos el signo
      num = num * (-1)
      deno = deno * (-1)
    end
    NumerosRacionales.new(num/simplifica,deno/simplifica)
  end

  def -(other)					#para restar dos nums racionales...
    deno = mcm(@b, other.b)			#MCM para hallar el denominador
    num = ((deno/@b) * @a) - ((deno/other.b) * other.a)
    simplifica = gcd(num,deno)			#averiguamos el valor para obtener el racional irreducible
    if ((num < 0) and (deno < 0)) or ((num > 0) and (deno < 0)) #corregimos el signo
      num = num * (-1)
      deno = deno * (-1)
    end
    NumerosRacionales.new(num/simplifica,deno/simplifica)
  end
  
  def *(other)					#multiplicacion: multiplicamos numerador con numerador y denominador con denominador
    num = @a*other.a
    deno = @b*other.b
    simplifica = gcd(num,deno)			#averiguamos el valor para obtener el racional irreducible
    if ((num < 0) and (deno < 0)) or ((num > 0) and (deno < 0)) #corregimos el signo
      num = num * (-1)
      deno = deno * (-1)
    end
    NumerosRacionales.new(num/simplifica,deno/simplifica)
  end
  
   def /(other) #división: multiplicamos en cruz: numerador de uno x denominador del otro y viceversa
     num = @a*other.b
     deno = @b*other.a
     simplifica = gcd(num,deno)			#averiguamos el valor para obtener el racional irreducible
    if ((num < 0) and (deno < 0)) or ((num > 0) and (deno < 0)) #corregimos el signo
      num = num * (-1)
      deno = deno * (-1)
    end
     NumerosRacionales.new(num/simplifica,deno/simplifica)
   end
end

if (not ARGV[0])
  puts "Error de entrada. Escriba parametros de entrada de la forma: programa.rb 4 5 6 7"
  puts "Ej) programa.rb 2 3 4 5"
  puts "Crea los racionales 2/3 y 4/5"
else
  racional1 = NumerosRacionales.new(ARGV[0].to_i,ARGV[1].to_i)
  racional2 = NumerosRacionales.new(ARGV[2].to_i,ARGV[3].to_i)
  puts racional1
  puts racional2
  puts "Suma = #{racional1+racional2}"
  puts "Resta = #{racional1-racional2}"
  puts "Producto = #{racional1*racional2}"
  puts "Division = #{racional1/racional2}"
end