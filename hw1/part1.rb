def palindrome?(string)  
  modified_string = string.gsub(/\W/, "").downcase 
  modified_string == modified_string.reverse
end

def count_words(string)
  hash = Hash.new(0)
  string.split(/\b/).keep_if { |m| m.downcase =~ /\w/}.each do |str|
    hash[str.downcase] = (hash[str.downcase] + 1)
  end
  hash
end

# print palindrome? "asd ds, a" #=> true
# print palindrome?("A man, a plan, a canal -- Panama")  #=> true
# print palindrome?("Madam, I'm Adam!") # => true
# print palindrome?("Abracadabra") # => (nil is also ok)


