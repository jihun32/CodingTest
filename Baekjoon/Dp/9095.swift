let n = Int(readLine()!)!

for _ in 0..<n {
    print(getNum(Int(readLine()!)!))
}

func getNum(_ num: Int) -> Int {
    var dp = [Int](repeating: 0, count: num + 1)
    if num == 1 { return 1 }
    if num == 2 { return 2 }
    if num == 3 { return 4 }
    
    if num > 3 {
        dp[1] = 1
        dp[2] = 2
        dp[3] = 4
        for i in 4...num {
            dp[i] = dp[i-1] + dp[i-2] + dp[i-3]
        }
    }
    
    return(dp[num])
}
