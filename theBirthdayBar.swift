import Foundation

// Two children, Lily and Ron, want to share a chocolate bar. Each of the squares has an integer on it.

// Lily decides to share a contiguous segment of the bar selected such that:

// The length of the segment matches Ron's birth month, and,
// The sum of the integers on the squares is equal to his birth day.
// Determine how many ways she can divide the chocolate.

/*
 * Complete the 'birthday' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts following parameters:
 *  1. INTEGER_ARRAY s // bar
 *  2. INTEGER d // day == sum of elements
 *  3. INTEGER m // month == lenght
 */

func birthday(s: [Int], d: Int, m: Int) -> Int {
    let sum = d
    let lenght = m
    
    var count = 0 
    
    for (index, _) in s.enumerated() { 
        let lastIndex = index + (lenght - 1)
        if lastIndex > (s.count - 1) {
            break
        }
        
        var currentSum = 0
        for currentItem in s[index...lastIndex] {
            currentSum += currentItem
            
            if currentSum > sum {
                break
            }
        }
        
        if currentSum == sum {
            count += 1
        }
    }

    return count
}

let result = birthday(s:[1, 2, 1, 3, 2], d: 3, m: 2)
print(result, result == 2)

let result2 = birthday(s:[1, 1, 1, 1, 1, 1], d: 3, m: 2)
print(result2, result2 == 0)

let result3 = birthday(s:[4], d: 4, m: 1)
print(result3, result3 == 1)
