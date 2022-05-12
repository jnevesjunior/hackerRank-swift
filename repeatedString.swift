import Foundation

/*
 * Complete the 'repeatedString' function below.
 *
 * The function is expected to return a LONG_INTEGER.
 * The function accepts following parameters:
 *  1. STRING s
 *  2. LONG_INTEGER n
 */

func repeatedString(s: String, n: Int) -> Int {
    let elementToRepeat = "a"
    let count = s.count
    
    if n <= count {
        return s.prefix(n).filter {
            String($0) == elementToRepeat
        }.count
    }
    
    let repeatedPrimitiveStringCount = s.filter {
        String($0) == elementToRepeat
    }.count

    var repeatedStringCount = repeatedPrimitiveStringCount * (n / count)
    
    let missignValueCount = abs(n - count) % count
    repeatedStringCount += s.prefix(missignValueCount).filter {
        String($0) == elementToRepeat
    }.count
    
    return repeatedStringCount
}


let result = repeatedString(s: "epsxyyflvrrrxzvnoenvpegvuonodjoxfwdmcvwctmekpsnamchznsoxaklzjgrqruyzavshfbmuhdwwmpbkwcuomqhiyvuztwvq", n: 549382313570)
print(result, result == 16481469408)

let result2 = repeatedString(s: "ababa", n: 3)
print(result2, result2 == 2)