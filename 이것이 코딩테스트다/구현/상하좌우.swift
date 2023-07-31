let n = Int(readLine()!)!

let input = readLine()!.split(separator: " ")
var x = 1, y = 1
input.forEach { direction in
    switch direction {
    case "R": if x < n { x += 1 }
    case "U": if y > 1 { y -= 1 }
    case "D": if y < n { y += 1 }
    case "L": if x > 1 { x -= 1 }
    default: break
    }
}

print("\(y) \(x)")
