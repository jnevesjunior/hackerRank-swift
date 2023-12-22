import Foundation

/*
 * Given an unsorted array of integers nums, return the length of the longest consecutive elements sequence.
 *
 * You must write an algorithm that runs in O(n) time.
 */
 
func longestConsecutive(_ nums: [Int]) -> Int {

    guard nums.count > 1 else {
        return nums.count
    }
    
    let numsOrdened = nums.sorted(by: { $0 < $1 })

    var longSet = 0
    var currentSet = 1
    for (index, num) in numsOrdened.enumerated() {

        let nextIndex = index + 1

        guard nextIndex < numsOrdened.count else {
            break
        }

        if numsOrdened[nextIndex] == num + 1 {
            currentSet += 1
        } else if numsOrdened[nextIndex] == num {
            continue
        } else {
            currentSet = 1
        }

        if currentSet > longSet {
            longSet = currentSet
        }
    }

    return longSet
}


let result = longestConsecutive([0,3,7,2,5,8,4,6,0,1])
print(result, result == 9)

let result1 = longestConsecutive([100,4,200,1,3,2])
print(result1, result1 == 4)
