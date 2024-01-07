import Foundation

// Given an array of integers, find the longest subarray where the absolute difference between any two elements is less than or equal to 1.

// Example
// a = [1, 1, 2, 2, 4, 4, 5, 5, 5]

// There are two subarrays meeting the criterion: [1, 1 , 2, 2] and [4, 4, 5, 5, 5]. The maximum length subarray has 5 elements.

/*
 * Complete the 'pickingNumbers' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts INTEGER_ARRAY a as parameter.
 */

func pickingNumbers(a: [Int]) -> Int {
    
    var numberTable = [Int: Int]()
    var biggestCountOfSameNumber = 0
    
    a.forEach { currentNumber in
        if let count = numberTable[currentNumber] {
            
            let nextCount = count + 1
            numberTable[currentNumber] = nextCount
            
            if nextCount > biggestCountOfSameNumber {
                biggestCountOfSameNumber = nextCount
            }
        } else {
            numberTable[currentNumber] = 1
        }
    }
    
    var biggestSequence = 0
    
    numberTable.forEach { numberTableItem in
        let nextNumber = numberTableItem.key + 1
        
        if let nextNumberCount = numberTable[nextNumber] {
            let actualSequence = nextNumberCount + numberTableItem.value
            
            if actualSequence > biggestSequence {
                biggestSequence = actualSequence
            }
        }
    }
    
    if biggestSequence < biggestCountOfSameNumber {
        biggestSequence = biggestCountOfSameNumber
    }
    
    return biggestSequence
}

let result = pickingNumbers(a:[4, 6, 5, 3, 3, 1])
print(result, result == 3)

let result2 = pickingNumbers(a:[1, 2, 2, 3, 1, 2])
print(result2, result2 == 5)

let result3 = pickingNumbers(a:[
    4 ,97, 5, 97, 97, 4, 97, 4, 97, 97, 97, 97, 4, 4, 5, 5, 97, 5, 97, 99, 4, 97, 5, 97, 97, 97, 5, 5, 97, 4, 5, 97, 97, 5, 97, 4, 97, 5, 4, 4, 97, 5, 5, 5, 4, 97, 97, 4, 97, 5, 4, 4, 97, 97, 97,
    5, 5, 97, 4, 97, 97, 5, 4, 97, 97, 4, 97, 97, 97, 5, 4, 4, 97, 4, 4, 97, 5, 97, 97, 97, 97, 4, 97, 5, 97, 5, 4, 97, 4, 5, 97, 97, 5, 97, 5, 97, 5, 97, 97, 97
])
print(result3, result3 == 50)