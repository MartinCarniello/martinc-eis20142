class CharCounter

	def self.count(string)
		if string
			string.split(//).inject({}) { |h, c| h.update(c => !h[c] ? 1 : h[c] + 1) }
		else
			{}
		end
	end

end