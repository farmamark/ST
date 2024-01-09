q = ("a".."z").to_a.zip(1..26).to_a.to_h

q.select! {|k,v| ["a", "e", "i", "o", "u", "y"].include?(k)}

puts q
