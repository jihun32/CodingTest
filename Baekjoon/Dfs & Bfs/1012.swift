let n = Int(readLine()!)!

var bachus: [[Int]]!
var maxX: Int!
var maxY: Int!

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    var sum = 0
    maxX = input[0]
    maxY = input[1]
    bachus = Array(repeating: Array(repeating: 0, count: maxX), count: maxY)
    
    for _ in 0..<input[2] {
        let bachu = readLine()!.split(separator: " ").map { Int($0)! }
        
        bachus[bachu[1]][bachu[0]] = 1
    }
    
    for i in 0..<maxY {
        for j in 0..<maxX {
            if dfs(x: j, y: i) {
                sum += 1
            }
        }
    }
    print(sum)
}

func dfs(x: Int, y: Int) -> Bool {
    if x < 0 || y < 0 || x >= maxX || y >= maxY {
        return false
    }
    
    if bachus[y][x] == 1 {
        bachus[y][x] = 0
        dfs(x: x + 1, y: y)
        dfs(x: x - 1, y: y)
        dfs(x: x, y: y + 1)
        dfs(x: x, y: y - 1)
        
        return true
    }
    
    return false
}
