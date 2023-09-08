import Foundation

func customFilter<T>(_ array: [T], _ isIncluded: (T) -> Bool) -> [T] {
    var result: [T] = []
    for element in array {
        if isIncluded(element) {
            result.append(element)
        }
    }
    return result
}


let numbers = [1,2,3,4,5,6,7,8,9,10]
let evenNumbers = customFilter(numbers) { $0 % 2 != 0 }
let oddNumbers = customFilter(numbers) { $0 % 2 == 0 }
print("even numbers \(evenNumbers)")
print("odd numbers \(oddNumbers)")

func customReduce<T, U>(_ array: [T], 
                        _ initialResult: U,
                        _ nextPartialResult: (U, T) -> U) -> U {
    var result = initialResult
    for element in array {
        result = nextPartialResult(result, element)
    }
    return result
}

let numbers2 = [1,2,3,4,5]
let sum = customReduce(numbers2, 0) { $0 + $1 }
let product = customReduce(numbers2, 1) { $0 * $1 }
print(sum)
print(product)