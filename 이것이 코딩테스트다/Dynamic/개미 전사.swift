let n = Int(readLine()!)!

let input = readLine()!.split(separator: " ").map { Int($0)! }


var result = Array(repeating: 0, count: 100)
result[0] = input[0]
result[1] = max(input[0], input[1])

for i in 2..<n {
    result[i] = max(result[i - 2] + input[i], result[i - 1])
}

print(result.max()!)
