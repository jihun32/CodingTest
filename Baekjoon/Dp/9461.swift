let n = Int(readLine()!)!

for _ in 0..<n {
    let input = Int(readLine()!)!
    var dp = [Int](repeating: 0, count: input)
    for i in 0..<input {
        if i < 3 {
            dp[i] = 1
        } else if i < 5 {
            dp[i] = 2
        }
        else {
            dp[i] = dp[i - 1] + dp[i - 5]
        }
    }
    print(dp[input - 1])
}

