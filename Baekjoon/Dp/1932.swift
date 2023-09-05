let n = Int(readLine()!)!

var dp = [[Int]]()

for _ in 0..<n {
    dp.append(readLine()!.split(separator: " ").map { Int($0)! })
}

for i in 1..<n {
    for j in 0..<dp[i].count {
        if j == 0 { dp[i][j] = dp[i - 1][j] + dp[i][j] }
        else if j == dp[i].count - 1 { dp[i][j] = dp[i - 1][j - 1] + dp[i][j] }
        else {
            dp[i][j] = max(dp[i - 1][j - 1], dp[i - 1][j]) + dp[i][j]
        }
    }
}
print(dp.max(by: { $0.max()! < $1.max()! })!.max()!)
