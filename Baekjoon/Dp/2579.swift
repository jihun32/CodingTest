import Foundation

let n = Int(readLine()!)!

var scores = [Int]()
var dp = [Int](repeating: 0, count: n + 1)

for _ in 0..<n {
    scores.append(Int(readLine()!)!)
}

for i in 1...n {
    if i == 1 {
        dp[1] = scores[0]
        continue
    }
    else if i == 2 {
        dp[2] = scores[0] + scores[1]
        continue
    }
    else if i == 3 {
        dp[3] = max(scores[0] + scores[2], scores[1] + scores[2])
        continue
    }
    else {
        dp[i] = max(dp[i - 2], dp[i - 3] + scores[i - 2]) + scores[i - 1]
    }
}
print(dp[n])


