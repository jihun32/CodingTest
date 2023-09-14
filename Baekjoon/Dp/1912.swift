let n = Int(readLine()!)!

var sequence = readLine()!.split(separator: " ").map { Int($0)! }
var dp = [Int](repeating: Int.min, count: n)

dp[0] = sequence[0]

for i in 1..<n {
    dp[i] = max(sequence[i], dp[i - 1] + sequence[i])
}

print(dp.max()!)

