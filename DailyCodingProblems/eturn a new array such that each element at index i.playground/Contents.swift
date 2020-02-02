import UIKit
/**
 This problem was asked by Uber.

 Given an array of integers, return a new array such that each element at index i of the new array is the product of all the numbers in the original array except the one at i.

 For example, if our input was [1, 2, 3, 4, 5], the expected output would be [120, 60, 40, 30, 24]. If our input was [3, 2, 1], the expected output would be [2, 3, 6].

 Follow-up: what if you can't use division?
 */

// MARK: - With Division
//func solution(input: [Int]) -> [Int] {
//  let result = input.reduce(1) { $0 * $1 }
//  return input.map { result/$0 }
//}

// MARK: - Without division O(N) (Auxiliary space: O(N))
func solution1(input: [Int]) -> [Int] {
  let n = input.count
  var left = [Int](repeating: 1, count: n)

  for i in 1..<n {
    left[i] = left[i - 1] * input[i-1]
  }

  var right = [Int](repeating: 1, count: n)
  for j in stride(from: n-2, to: -1, by: -1) {
    right[j] = right[j + 1] * input[j + 1]
  }

  var final = [Int](repeating: 1, count: n)
  for i in 0..<n {
    final[i] = left[i] * right[i]
  }
  
  return final
}

// MARK: - Without division O(N) (Auxiliary space: O(1))
func solution2(input: [Int]) -> [Int] {
  let n = input.count
  var final = [Int](repeating: 1, count: n)
  
  // Left Side
  var temp = 1
  for i in 0..<n {
    final[i] = temp
    temp *= input[i]
  }
  
  // Right Side
  temp = 1
  for j in stride(from: n-1, to: -1, by: -1) {
    final[j] *= temp
    temp *= input[j]
  }
  
  return final
}

let input = [1,2,3,4,5]
let result = solution2(input: input)
print(result) //Result for [1,2,3,4,5] should be: [120, 60, 40, 30, 24]

