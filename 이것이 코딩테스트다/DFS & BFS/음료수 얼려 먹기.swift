let input = readLine()!.split(separator: " ").map { Int($0)! }

var map = [[Int]]()
var directions = [1, -1, 1 ,-1]
var result = 0

for _ in 0..<input[0] {
    let row = readLine()!
    var rowInt = [Int]()
    row.forEach { rowInt.append(Int(String($0))!) }
    
    map.append(rowInt)
}

for i in 0..<input[0] {
    for j in 0..<input[1] {
        if dfs(x: j, y: i) { result += 1 }
    }
}

func dfs(x: Int, y: Int) -> Bool {
    
    if x < 0 || y < 0 || x == input[1] || y == input[0] { return true }
    
    if map[y][x] == 0 {
        map[y][x] = 1
        dfs(x: x + 1, y: y)
        dfs(x: x, y: y + 1)
        dfs(x: x - 1, y: y)
        dfs(x: x, y: y - 1)
        
        return true
    }
    return false
}

print(result)
