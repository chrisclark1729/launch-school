family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }

person = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'}
         
immediate_family = family.select do |k, v|
  k == :sisters || k == :brothers
end
          
arr = immediate_family.values.flatten       
p arr

p person[:name]

def hash_methods(person)
  p person.keys
  p person.values
  p person.each
end

hash_methods(person)