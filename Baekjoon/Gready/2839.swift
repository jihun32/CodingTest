import Foundation

var input = Int(readLine()!)!

var result = 0
var range = input / 5
var n = input


while range > 0 {
    n = input - 5 * range
    result += range
    
    if n % 3 == 0 {
        result += n / 3
        break
    } else {
        range -= 1
        result = 0
    }
}

if range == 0 {
    if input % 3 == 0 { print(input / 3) }
    else { print("-1") }
}
else { print(result) }
