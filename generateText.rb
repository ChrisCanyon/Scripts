verbs = ["sell", "need to sell"]
object = ["house", "home"]
modif = ["For cash", "fast for cash"]
adj = ["quickly", "fast"]

sentences = [];

i = 0
while i < verbs.size do
  j = 0
  while j < object.size do
    m = 0
    sentences.push("[" + verbs[i] + " " + object[j] + "]")
    while m < modif.size do
      n = 0
      sentences.push("[" + verbs[i] + " " + object[j] + " " + modif[m] + "]")
      while n < adj.size do
        sentences.push("[" + verbs[i] + " " + object[j] + " " + modif[m] + " " + adj[n] + "]")
        n += 1
      end
      m += 1
    end
    j += 1
  end
  i += 1
end

sub = ["i", "we"]
verb = ["buy", "sell"]
adj = ["my", "ugly", "my ugly", "broken"]

dir_ob = ["houses", "homes"]
"i buy houses"
"buy houses"

""

i = 0
while i < sentences.size do
  puts sentences[i]
  i += 1
end
