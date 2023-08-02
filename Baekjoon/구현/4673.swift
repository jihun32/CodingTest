var results = Set<Int>()
var first = 10
var sum = 0
var n = 0
for i in 1...10000 {
    n = i
    sum = 0
    while n != 0 {
        sum += n % 10
        n /= 10
    }
    
    results.insert(i + sum)
}

for i in 1...10000 {
    if !results.contains(i) { print(i) }
}
