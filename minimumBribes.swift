import Foundation

/*
 * Complete the 'minimumBribes' function below.
 *
 * The function accepts INTEGER_ARRAY q as parameter.
 */

func minimumBribes(q: [Int]) -> Void {
    var bribesCount = 0
    
    for (index, stickerNumber) in q.enumerated() {
        let position = index + 1
        if (stickerNumber - position) > 2 { 
            print("Too chaotic")
            bribesCount = -1
            break
        }
        var startPosition = stickerNumber - 2
        if startPosition >= index {
            startPosition -= 1
        }
        if startPosition < 0 {
            startPosition = 0
        }
        
        for nextIndex in startPosition..<index {
            if (q[nextIndex] > stickerNumber) { 
                bribesCount += 1
            }
        }
    }
    
    if bribesCount >= 0 {
        print(bribesCount)   
    }
}

print("expected: 3")
minimumBribes(q: [2, 1, 5, 3, 4])

print("--")

print("expected: Too chaotic")
minimumBribes(q: [2, 5, 1, 3, 4])

print("--")

print("expected: Too chaotic")
minimumBribes(q: [5, 1, 2, 3, 7, 8, 6, 4])

print("--")

print("expected: 7")
minimumBribes(q: [1, 2, 5, 3, 7, 8, 6, 4])
