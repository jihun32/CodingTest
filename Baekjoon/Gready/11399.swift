
let input = Int(readLine()!)!

var times = readLine()!.split(separator: " ").map { Int($0)! }
var result = 0
var sumArr = [Int]()

times.sort()

times.forEach { time in
    sumArr.append(time)
    result += sumArr.reduce(0, +)
}

print(result)
