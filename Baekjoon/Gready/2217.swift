let n = Int(readLine()!)!

var arr = [Int]()

for _ in 0..<n {
    arr.append(Int(readLine()!)!)
}

arr.sort()

var i = 1
var max = -1
for n in arr.reversed() {
    max = n * i > max ? n * i : max
    i += 1
}

print(max)

