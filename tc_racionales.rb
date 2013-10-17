#Pruebas Unitarias asociadas a la clase NumerosRacionales

require "./racionales.rb"
require "test/unit"

class Test_NumerosRacionales < Test::Unit::TestCase
  def test_simple 	#realizamos las pruebas simples: operaciones entre racionales
    assert_equal("1/2", NumerosRacionales.new(1,2).to_s)
    assert_equal("5/4", (NumerosRacionales.new(1,2)+NumerosRacionales.new(3,4)).to_s)
    assert_equal("-1/4", (NumerosRacionales.new(1,2)-NumerosRacionales.new(3,4)).to_s)
    assert_equal("3/8", (NumerosRacionales.new(1,2)*NumerosRacionales.new(3,4)).to_s)
    assert_equal("2/3", (NumerosRacionales.new(1,2)/NumerosRacionales.new(3,4)).to_s)
  end
 
   def test_typecheck	#En caso de que el denominador sea cero
     assert_raise( ZeroDivisionError ) { NumerosRacionales.new(1,0) }
   end
 
   def test_faliure	#Probamos una operación igualándola a un resultado incorrecto para que aparezca este test
     assert_equal("3/7", (NumerosRacionales.new(1,2)*NumerosRacionales.new(3,4)).to_s, "Error en la multiplicacion")
   end
end