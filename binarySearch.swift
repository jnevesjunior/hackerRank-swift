

func search(list: [Int], value: Int) -> Int? {
    searchOrdenedList(list: list.sorted(by: { $0 < $1 }), value: value)
}

func searchOrdenedList(list: [Int], value: Int) -> Int? {

    guard 
        !list.isEmpty &&
        value >= list.first ?? 0 &&
        value <= list.last ?? 0
    else { return nil }

    var startIndex = 0
    var lastIndex = list.count - 1

    while startIndex <= lastIndex {
        let middleIndex = startIndex + (lastIndex - startIndex) / 2 
        let middleValue = list[middleIndex]

        if middleValue == value {
            return middleIndex
        } else if middleValue < value {
            startIndex = middleIndex + 1
        } else {
            lastIndex = middleIndex - 1
        }
    }

    return nil
}

let result = search(list: [72, 55, 3, 4, 5, 12, 13, 22, 33, 1], value: 5)
print(result ?? 0, result == 3)

let result1 = searchOrdenedList(list: [1, 2, 3, 4, 5, 12, 13, 22, 33], value: 5)
print(result1 ?? 0, result1 == 4)


func binarySearch(list: [Int], value: Int) -> Bool {

    guard 
        !list.isEmpty &&
        value >= list.first ?? 0 &&
        value <= list.last ?? 0
    else { return false }

    let startIndex = 0
    let lastIndex = list.count - 1

    let middleIndex = startIndex + (lastIndex - startIndex) / 2 
    let middleValue = list[middleIndex]

    if middleValue == value {
        return true
    } else if middleValue < value {
        return binarySearch(
            list: Array(list[middleIndex + 1...lastIndex]), 
            value: value
        )
    } else {
        return binarySearch(
            list: Array(list[startIndex...middleIndex - 1]), 
            value: value
        )
    }
}

let result2 = binarySearch(list: [1, 3, 4, 5, 12, 13, 22, 33, 72], value: 5)
print(result2, result2 == true)

let result3 = binarySearch(list: [1, 2, 3, 4, 5, 12, 13, 22, 33], value: 5)
print(result3, result3 == true)

let result4 = binarySearch(list: [1, 2, 3, 4, 5, 12, 13, 22, 33], value: -5)
print(result4, result4 == false)