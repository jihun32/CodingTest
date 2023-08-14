let n = Int(readLine()!)!

var map = [[Int]]()
var sum = 0
var houseCount = 1
var house = [Int]()

for _ in 0..<n {
    let row = readLine()!
    var rowInt = [Int]()
    row.forEach { rowInt.append(Int(String($0))!) }
    
    map.append(rowInt)
}

for i in 0..<n {
    for j in 0..<n {
        if dfs(y: i, x: j) {
            sum += 1
            house.append(houseCount)
            houseCount = 1
        }
    }
}

func dfs(y: Int, x: Int) -> Bool {
    
    if y >= n || y < 0 || x >= n || x < 0 {
        return false
    }
    
    if map[y][x] == 1 {
        map[y][x] = 0
        
        if dfs(y: y, x: x + 1) { houseCount += 1 }
        if dfs(y: y + 1, x: x) { houseCount += 1 }
        if dfs(y: y, x: x - 1) { houseCount += 1 }
        if dfs(y: y - 1, x: x) { houseCount += 1 }
        return true
    }
    return false
}

print(sum)
house.sort()
house.forEach { print($0) }
