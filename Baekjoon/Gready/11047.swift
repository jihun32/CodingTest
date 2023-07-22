let input = readLine()!.split(separator: " ").map { Int($0)! }

let n = input[0]
var money = input[1]

var result = 0
var arr = [Int]()

for _ in 0..<n {
    arr.append(Int(readLine()!)!)
}

arr.reverse()

arr.forEach { coin in
    if money / coin != 0 {
        result += money / coin
        money %= coin
    }
}

print(result)
