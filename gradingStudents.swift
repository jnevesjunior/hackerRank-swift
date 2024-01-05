import Foundation

/*
 * Complete the 'gradingStudents' function below.
 *
 * The function is expected to return an INTEGER_ARRAY.
 * The function accepts INTEGER_ARRAY grades as parameter.
 */
 
 // O(N)

func gradingStudents(grades: [Int]) -> [Int] {
    return grades.map { grade in
        guard grade >= 38 else { return grade }
        
        let nextGradeValue = Int(( Float(grade) / 5 ).rounded(.up)) * 5
        
        if (nextGradeValue - grade) > 2 {
            return grade
        } else {
            return nextGradeValue   
        }
    }
}

let result = gradingStudents(grades: [73, 67, 38, 33])
print(result, result == [75, 67, 40, 33])