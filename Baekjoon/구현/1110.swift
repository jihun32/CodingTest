let input = Int(readLine()!)!

let firstNum = input
var newNum = input
var count = 0
var tens = 0, units = 0

repeat {
    tens = newNum / 10
    units = newNum % 10
    newNum = (units * 10) + ((tens + units) % 10)
    count += 1
} while firstNum != newNum
print(count)

        
        
        
