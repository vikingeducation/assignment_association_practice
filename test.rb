
def give
a = Array (1..9)
b = Array (10..52)
c = b+a
print c
puts shuffled_deck(c)
end

def shuffled_deck(arr)
  count=0
  0.upto(arr.length-2) do |i|
    count+=1 unless arr[i]+1==arr[i+1]
  end
  puts count
end

give