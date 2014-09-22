require_relative 'estados_de_juego'

class Ahorcado
	attr_accessor :vidas, :palabra_clave, :estado_de_juego

	def initialize(clave)
		@vidas = 3
		@palabra_clave = clave.split(//).inject([]) { |a, c| a.push({c => false}); a }
		@estado_de_juego = Jugando.new(self)
	end

	def restar_vida
		@vidas -= 1
	end

	def estado
		palabra_clave.inject('') { |s, l| s + (l.values[0] ? l.keys[0] : '*') }
	end

	def arriesgar(letra)
		estado_de_juego.arriesgar(letra)
	end
end