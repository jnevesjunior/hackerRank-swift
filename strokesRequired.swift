
import Foundation

/*
 * Complete the 'strokesRequired' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts STRING_ARRAY picture as parameter.
 */

func strokesRequired(picture: [String]) -> Int {
    
    let pictureStringArray = picture.map { Array($0).map { String($0) } }
    
    // [letter: [row: column]]
    var positions = [
        String: [ // letter
            [Int: Int] // [row: column]
        ]
    ]()
    
    for (rowIndex, rowStringArray) in pictureStringArray.enumerated() {
        for (columnIndex, stringItem) in rowStringArray.enumerated() {
            if var previousPositions = positions[stringItem] {
                previousPositions.append([rowIndex: columnIndex])
                positions[stringItem] = previousPositions
            } else {
                positions[stringItem] = [[rowIndex: columnIndex]]
            }
        }
    }
    
    var strokesCount = 0
    
    for positionDict in positions {
        
        var letterPositionsToCheck = positionDict.value
        
        var index = 0
        var sequency = [[Int: Int]]()
        var allSequency = [[Int: Int]]()
        
        while index <= letterPositionsToCheck.count - 1 {
            
            var lastResult = getItemsArround(position: letterPositionsToCheck[index], list: letterPositionsToCheck)
            sequency = lastResult
            
            while lastResult.count != 0 {
                lastResult.forEach { result in
                    
                    letterPositionsToCheck.removeAll(where: { $0 == result })
                    
                    lastResult = getItemsArround(position: result, list: letterPositionsToCheck)
                    sequency.append(contentsOf: lastResult)
                }
            }
            
            allSequency.append(contentsOf: sequency)
            if sequency.count > 0 {
                strokesCount += 1
            }
            
            index += 1
        }
        
        letterPositionsToCheck.removeAll(where: { letterPositionsToCheckItem in
            if let item = allSequency.first(where: {
                $0 == letterPositionsToCheckItem
            }) {
                return letterPositionsToCheckItem == item
            }
            return false
        })
        
        strokesCount += letterPositionsToCheck.count
    }
    return strokesCount
}

func getItemsArround(position: [Int: Int], list: [[Int: Int]]) -> [[Int: Int]] {
    let row = position.first?.key ?? 0
    let nextRow = row + 1
    let previousRow = row - 1
    
    let column = position.first?.value ?? 0
    let nextColumn = column + 1
    let previousColumn = column - 1
    
    return list.filter { item in
        item == [row: nextColumn] ||
        item == [row: previousColumn] ||
        item == [previousRow: column] ||
        item == [nextRow: column]
    }
}

let result = strokesRequired(picture: ["aaaba", "ababa", "aaaca"])
print(result, result == 5)

let result2 = strokesRequired(picture: ["aabba", "aabba", "aaacb"])
print(result2, result2 == 5)

let result3 = strokesRequired(picture: ["ababc", "abbba", "aaabb", "bcccb", "acbbb", "aaabb"])
print(result3, result3 == 8)
