q = {}
("a".."z").each_with_index {|k, v| q[k] = v +1}

q.select! {|k,v| ["a", "e", "i", "o", "u", "y"].include?(k)}
puts q
