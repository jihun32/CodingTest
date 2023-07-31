let input = Int(readLine()!)!

var coordinate = (1, 2)
var num = 1
var isDown = true

if input == 1 {
    print("1/1")
    
} else {
    for _ in 2..<input {
        
        if isDown {
            if coordinate.1 == 1 {
                isDown = false
                coordinate.0 += 1
                num *= -1
                continue
            }
        } else {
            if coordinate.0 == 1 {
                isDown = true
                coordinate.1 += 1
                num *= -1
                continue
            }
        }
        
        coordinate.0 = coordinate.0 + num
        coordinate.1 = coordinate.1 - num
    }
    print("\(coordinate.0)/\(coordinate.1)")
}

