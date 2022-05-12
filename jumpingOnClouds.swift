import Foundation

/*
 * Complete the 'jumpingOnClouds' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts INTEGER_ARRAY c as parameter.
 */

func jumpingOnClouds(c: [Int]) -> Int {
    var jumpsCount = 0
    var indexesToSkip = [Int]()
    let cloudsCount = c.count
    
    c.enumerated().forEach { (index, cloud) in 
        if cloud == 1 
        || indexesToSkip.contains(index)
        || index == (cloudsCount - 1) {
            return
        }
        
        jumpsCount += 1
        
        var nextIndex = index + 1
        if nextIndex >= cloudsCount || c[nextIndex] == 1 {
            return
        }
        
        nextIndex += 1
        if nextIndex >= cloudsCount { 
            return    
        }
        
        if c[nextIndex] == 0 {
            indexesToSkip.append(nextIndex - 1)
        }
    }

    return jumpsCount
}

let result = jumpingOnClouds(c: [0, 0, 1, 0, 0, 1, 0])
print(result, result == 4)

let result2 = jumpingOnClouds(c: [0, 0, 0, 1, 0, 0])
print(result2, result2 == 3)
