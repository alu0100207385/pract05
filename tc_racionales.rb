#Pruebas Unitarias asociadas a la clase NumerosRacionales

require "./racionales.rb"
require "test/unit"

class Test_NumerosRacionales < Test::Unit::TestCase
# def test_simple
#     assert_equal((5,4), NumerosRacionales.new(1,2)+other(3,4))
#   end
 
  def test_typecheck		#En caso de que el denominador sea cero
    assert_raise( ZeroError ) { NumerosRacionales.b == 0 }
  end
 
end