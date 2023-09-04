import Foundation

let num = Int(readLine()!)!

for _ in 0..<num {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    var map = [[Int]](repeating: [Int](repeating: 0, count: input[1]), count: input[0])
    
    var gold = readLine()!.split(separator: " ").map { Int($0)! }
    var dp = [Int](repeating: 0, count: gold.count + 1)
    var k = 0
    for i in 0..<input[0] {
        for j in 0..<input[1] {
            map[i][j] = gold[k]
            k += 1
        }
    }
    
    for j in 1..<input[1] {
        for i in 0..<input[0] {
            var leftUp = 0
            var leftDown = 0
            if i != 0 { leftUp = map[i - 1][j - 1] }
            if i != input[0] - 1  { leftDown = map[i + 1][j - 1] }
            
            var left = map[i][j - 1]
            map[i][j] = max(left, leftUp, leftDown) + map[i][j]
        }
    }
    var maxRow = map.max(by: { $0.max()! < $1.max()! })!
    print(maxRow.max()!)
}
