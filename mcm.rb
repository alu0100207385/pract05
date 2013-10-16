#Este codigo calcula el minimo comun multiplo (MCM) de dos numeros

def mcm (a, b)
  ai = a
  bi = b
  if (a == 0) or (b == 0)
    0	#MCM = 0
  else
    mcd = false
    while (mcd == false)
      r = a%b
      if (r == 0)
	x = b
	mcd = true
      else
	a = b
	b = r
	mcd = false
      end
      resul=(ai*bi)/x;
    end
    resul
  end
end

puts mcm(72,50)
