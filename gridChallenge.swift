import Foundation

/*
 * Complete the 'gridChallenge' function below.
 *
 * The function is expected to return a STRING.
 * The function accepts STRING_ARRAY grid as parameter.
 */

func gridChallenge(grid: [String]) -> String {
    var isInAlphabeticallyOrder = "YES"
    
    let ordenedGrid = grid.map { row in 
        row.sorted()
    }
    
    let rowCount = grid.first?.count ?? 0
    
    for index in 0..<rowCount {
        var columnString = ""
        
        ordenedGrid.forEach { row in
            columnString += String(row[index])
        }
        
        let columnStringSorted = columnString.sorted()
                                             .map { String($0) }
                                             .joined(separator: "")

        if columnString != columnStringSorted {
            isInAlphabeticallyOrder = "NO"
            break
        }
    }
    
    return isInAlphabeticallyOrder
}

let result = gridChallenge(grid: ["eabcd", "fghij",  "olkmn",  "trpqs",  "xywuv"])
print(result, result == "YES")

let result2 = gridChallenge(grid: ["mpxz", "abcd", "wlmf"])
print(result2, result2 == "NO")