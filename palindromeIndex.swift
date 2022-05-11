
import Foundation

/*
 * Complete the 'palindromeIndex' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts STRING s as parameter.
 */

// Input
//
// STDIN   Function
// -----   --------
// 3       q = 3
// aaab    s = 'aaab' (first query)
// baa     s = 'baa'  (second query)
// aaa     s = 'aaa'  (third query)

// Output
// 3
// 0
// -1

func palindromeIndex(s: String) -> Int {
    let stringArray = Array(s)
    let count = s.count

    var index = 0
    var reverseIndex = count - 1
    for item in stringArray {
        if item != stringArray[reverseIndex] {
            break
        }
        index += 1
        reverseIndex -= 1
    }
    
    if index > reverseIndex {
        return -1
    }

    var indexToRemove = index + 1
    var reverseIndexToRemove = reverseIndex
    for _ in stringArray {
        if reverseIndexToRemove <= (index + 1) {
            break
        }

        if stringArray[indexToRemove] != stringArray[reverseIndexToRemove] {
            return reverseIndex
        }

        indexToRemove += 1
        reverseIndexToRemove -= 1
    }

    return index
}

let result = palindromeIndex(s: "aaab")
print(result, result == 3)

let result2 = palindromeIndex(s: "baa")
print(result2, result2 == 0)

let result3 = palindromeIndex(s: "aaa")
print(result3, result3 == -1)
