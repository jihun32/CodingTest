//이진 탐색을 활용하여 문제 풀이를 해보려 했으나 1~max까지의 떡의 길이를 갖는 배열을 구하려다보니 결국 n^2의 시간 복잡도를 필요로 해 이진 탐색이 무의미함
let input = readLine()!.split(separator: " ").map { Int($0)! }
let riceCake = readLine()!.split(separator: " ").map { Int($0)! }

var arr = [Int]()
var totalLen = riceCake.reduce(0, +)

for i in 0...riceCake.max()! {
    arr.append(i)
}

for i in 0...riceCake.max()! {
    var sum = 0
    riceCake.forEach {
        if $0 - arr[i] < 0 { sum += 0 }
        else { sum += $0 - arr[i] }
    }
    arr[i] = sum
}
arr.sort()

if let index = binarySearch(start: 0, end: arr.count - 1, target: input[1]) {
    print(arr.count - index - 1)
} else { print ("no") }



func binarySearch(start: Int, end: Int, target: Int) -> Int? {
    var left = start
    var right = end

    while left <= right {
        let middle = (left + right) / 2
        if arr[middle] == target { return middle }
        else if target > arr[middle] {
            left = middle + 1
        } else { right = middle - 1 }
    }

    return nil
}

//강의에서 나온 풀이법
let input = readLine()!.split(separator: " ").map { Int($0)! }
let riceCake = readLine()!.split(separator: " ").map { Int($0)! }

var start = 0
var end = riceCake.max()!

var result = 0
    
while start <= end {
    var total = 0
    let middle = (start + end) / 2
    for i in riceCake {
        if i > middle { total += i - middle}
    }
    if total < input[1] { end = middle - 1}
    else {
        result = middle
        start = middle + 1
    }
}

print(result)
