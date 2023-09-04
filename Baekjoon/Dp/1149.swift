let n = Int(readLine()!)!

var dp = [[Int]]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    dp.append(input)
}

for i in 1..<n {
    for j in 0..<3 {
        if j == 0 {
            dp[i][j] = min(dp[i - 1][1] + dp[i][j], dp[i - 1][2] + dp[i][j])
        }
        if j == 1 {
            dp[i][j] = min(dp[i - 1][0] + dp[i][j], dp[i - 1][2] + dp[i][j])
        }
        
        if j == 2 {
            dp[i][j] = min(dp[i - 1][0] + dp[i][j], dp[i - 1][1] + dp[i][j])
        }
    }
}
print(dp[n - 1].min()!)
