let input = readLine()!

var arr = input.sorted()
var result = ""
var sum = 0
for c in arr {
    if let num = Int(String(c)) {
        sum += num
        arr.removeFirst()
    }
    else { break }
}

result = String(arr)
result.append(String(sum))
print(result)


