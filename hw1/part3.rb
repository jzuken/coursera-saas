def combine_anagrams(words)
  hash = Hash.new [] 
  words.each do |w|
    if hash.include?(w.chars.sort) 
      hash[w.chars.sort].push(w)
    else
      hash[w.chars.sort] = [w]
    end    
  end
  hash.values
end


print combine_anagrams ['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream']
# => output: [["cars", "racs", "scar"], ["four"], ["for"], ["potatoes"],
