class NumerosRacionales
  attr_reader :a, :b
  
  def initialize (a, b)
    @a , @b = a, b
  end
  
  def to_s
    "#{@a}/#{@b}"
  end
  
  def + (other)
    #MCM n = (b, d)
    #(n/b * a) + (n/d * b)
  end
  
  def - (other)
    #MCM n = (b, d)
    #(n/b * a) - (n/d * b)
  end
  
  def *(other) #multiplicacion
    NumerosRacionales.new (@a*(other.a), @b*(other.b))
  end
  
  def ///(other) #división
    NumerosRacionales.new (@a*other.b, @b*other.a)
  end
end