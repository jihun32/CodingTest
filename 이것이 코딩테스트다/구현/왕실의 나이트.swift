var input = readLine()!

let col = Int(input[input.startIndex].asciiValue! - 96)
let row = Int(String(input[input.index(after: input.startIndex)]))!

var result = 0

let moves = [(2, 1), (2, -1), (-2, 1), (-2, 1), (1, 2), (-1, 2), (1, -2), (-1, 2)]

for move in moves {
    var x = col
    var y = row
    
    x += move.0
    y += move.1
    
    if x <= 8 && y <= 8 && x >= 1 && y >= 1 { result += 1}
}

print(result)

