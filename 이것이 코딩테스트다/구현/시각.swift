//규칙을 찾아 풀이
let n = Int(readLine()!)!

var result = 0
for i in 0...n {
    if i % 10 == 3 {
        result += 3600
        continue
    }
    result += 1575
}

print(result)

//브루트 포스 풀이
//result = 0
//for i in 0...n {
//    for j in 0..<60 {
//        for k in 0..<60 {
//            let time = String(i) + String(j) + String(k)
//            if time.contains("3") { result += 1}
//        }
//    }
//}
