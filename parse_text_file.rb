require 'natto'
require 'pp'

natto = Natto::MeCab.new
text = File.read("target.txt")
nouns = []
natto.parse(text) do |n|
    puts "#{n.surface}\t#{n.feature}\t#{n.cost}"

    if n.feature.split(',')[0] == "名詞"
      hash = nouns.find {|i| i[:word] == n.surface}
      if hash
        hash[:count] += 1
      else
        nouns << {word: n.surface, count: 1}
      end
    end
end

pp nouns
puts "after===="
nouns = nouns.sort_by {|i| i[:count]}
nouns.reverse!

nouns.each do |n|
  puts "#{n[:count]}, #{n[:word]}"
end

