number = '21030219840810223'
sum = 0
sum += (number[0].to_i) * 7
sum += (number[1].to_i) * 9
sum += (number[2].to_i) * 10
sum += (number[3].to_i) * 5
sum += (number[4].to_i) * 8
sum += (number[5].to_i) * 4
sum += (number[6].to_i) * 2
sum += (number[7].to_i) * 1
sum += (number[8].to_i) * 6
sum += (number[9].to_i) * 3
sum += (number[10].to_i) * 7
sum += (number[11].to_i) * 9
sum += (number[12].to_i) * 10
sum += (number[13].to_i) * 5
sum += (number[14].to_i) * 8
sum += (number[15].to_i) * 4
sum += (number[16].to_i) * 2

check = sum % 11

list = ['1', '0', 'x', '9', '8', '7', '6', '5', '4', '3', '2']
puts number + list[check]
