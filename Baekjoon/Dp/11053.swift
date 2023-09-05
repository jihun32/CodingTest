let n = Int(readLine()!)!

var dp = [Int](repeating: 1, count: n + 1)
let sequence = readLine()!.split(separator: " ").map { Int($0)! }


for i in 0..<n {
    var maxValue = 1
    for j in 0..<i {
        if sequence[i] > sequence[j] {
            maxValue = max(maxValue, dp[j + 1] + 1)
        }
        dp[i + 1] = maxValue
    }
}
print(dp.max()!)


