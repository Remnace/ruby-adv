def bubble_sort(arr)
	loop do
		i, swap = 0, 0
		while i < arr.length - 1
			if arr[i+1] < arr[i]
				arr[i], arr[i+1] = arr[i+1], arr[i]
				swap+=1
			end
			i += 1
		end
		break if swap == 0
	end
	arr
end

def bubble_sort_by(arr)
	loop do
		i, swap = 0, 0
		while i < arr.length-1
			if yield(arr[i], arr[i+1]) > 0
				arr[i], arr[i+1] = arr[i+1], arr[i]
				swap+=1
			end
			i+=1
		end
		break if swap == 0
	end
	arr
end

puts(bubble_sort([4,3,78,2,0,2]))

puts(bubble_sort_by(["hi", "hello", "hey"]) do |left, right|
	left.length - right.length
end)