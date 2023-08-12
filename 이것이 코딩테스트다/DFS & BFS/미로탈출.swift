let input = readLine()!.split(separator: " ").map { Int($0)! }

var map = [[Int]]()
let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

var queue = [(Int, Int)]()

for _ in 0..<input[0] {
    let row = readLine()!
    var rowInt = [Int]()
    row.forEach { rowInt.append(Int(String($0))!) }
    
    map.append(rowInt)
}

func bfs(_ coordinate: (Int, Int)) -> Int {
    
    queue.append((coordinate.0, coordinate.1))
    
    while !queue.isEmpty {
        let xy = queue.removeFirst()
        let x = xy.0
        let y = xy.1

        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if nx < 0 || ny < 0 || nx == input[0] || ny == input[1] {
                continue
            }
            
            if map[nx][ny] == 1 {
                map[nx][ny] = map[x][y] + 1
                queue.append((nx, ny))
    
            }
        }
    }
    
    return map[input[0] - 1][input[1] - 1]
}
print(bfs((0,0)))
