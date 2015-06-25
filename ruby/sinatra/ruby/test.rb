aa = ''

File.open('./html1','r') do |ff|
	while line = ff.gets
		aa += line
	end
end

puts aa
