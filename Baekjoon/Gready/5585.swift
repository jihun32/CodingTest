let input = Int(readLine()!)!

var money = 1000 - input

var n = 500
var a = 0
var cnt = 0

var isOdd = true
while money > 0 {
    a = money / n
    money -= n * a
    
    if isOdd { n /= 5 }
    else { n /= 2 }
    isOdd = !isOdd
    
    cnt += a
}

print(cnt)
