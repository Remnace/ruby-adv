module Enumerable
	def my_each
		return self unless block_given?
		for i in self
			yield(i)
		end
	end

	def my_each_with_index
		return self unless block_given?
		for i in 0...self.size
			yield(self[i], i)
		end
	end
	
	def my_select
		return self unless block_given?
		new_array = []
		my_each {|i| new_array << i if yield(i)}
		new_array
	end

	def my_all?
		if block_given?
			for i in 0...self.size
				return false unless yield(self[i])
			end
			true
		else
			for i in 0...self.size
				return false unless self[i]
			end
			true
		end
	end

	def my_any?
		if block_given?
			for i in 0...self.size
				if yield(self[i])
					return true
				end
			end
		else
			for i in 0...self.size
				if self[i]
					return true
				end
			end
		end
		return false
	end

	def my_none?
		if block_given? 
			for i in 0...self.size
				return true unless yield(self[i])
			end
			false
		else
			for i in 0...self.size
				return true unless self[i]
			end
			false
		end
	end

	def my_count(*arg)
		return self.size unless block_given? || arg!= []
		count = 0
		if block_given?
			for i in 0...self.size
				if yield(self[i])
					count+=1
				end
			end
			return count
		else
			for i in 0...self.size
				if self[i] == arg[0]
					count+=1
				end
			end
			return count
		end
	end

	def my_map
		return to_enum(:my_map) unless block_given?
		arr = []
		for i in 0...self.size
			arr.push(yield(self[i]))
		end
		return arr
	end

	def my_inject(arg = self[0])
		self.unshift(self[0]) unless arg == self[0]
		for i in 0...self.size
			arg = yield(arg, self[i])
		end
		return arg
	end
end

def muiltiply_els(arg)
	arg.my_inject(1){|result, element| result * element}
end