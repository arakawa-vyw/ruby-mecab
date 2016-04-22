require 'natto'

natto = Natto::MeCab.new
text = File.read("target.txt")
natto.parse(text) do |n|
    puts "#{n.surface}\t#{n.feature}"
end

