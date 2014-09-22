class EstadosDeJuego
	attr_accessor :ahorcado

	def initialize(ahorcado)
		@ahorcado = ahorcado
	end
end

class Jugando < EstadosDeJuego
	def arriesgar(letra)
		letras = ahorcado.palabra_clave.select { |t| t[letra] == false }
		letras.empty? ? ahorcado.restar_vida : letras.map { |l| l[letra] = true }

		if ahorcado.vidas == 0
			ahorcado.estado_de_juego= Perdido.new(ahorcado)
		elsif !ahorcado.palabra_clave.detect { |t| !t.values[0] }
			ahorcado.estado_de_juego= Ganado.new(ahorcado)
		end
	end
end

class Ganado < EstadosDeJuego
	def arriesgar(letra)
		"You Win"
	end
end

class Perdido < EstadosDeJuego
	def arriesgar(letra)
		"Game Over"
	end
end