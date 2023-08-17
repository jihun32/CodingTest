let input = readLine()!.split(separator: " ").map { Int($0)! }

let n = input[0]
let money = input[1]
var moneyUnit = [Int]()
var result = [Int](repeating: 10001, count: money + 1)

for _ in 0..<n {
    moneyUnit.append(Int(readLine()!)!)
}
result[0] = 0
moneyUnit.sort()

for i in 0..<n {
    for j in moneyUnit[i]...money {
        if result[j - moneyUnit[i]] != 10001 {
            result[j] = min(result[j], result[j - moneyUnit[i]] + 1)
        }
    }
}

if result[money] == 10001 {
    print(-1)
} else {
    print(result[money])
}
