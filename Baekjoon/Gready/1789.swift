let n = Int(readLine()!)!

var sum = 0
var i = 0

while true {
    i += 1
    sum += i
    if sum + i + 1 > n { break }
}

print(i)
