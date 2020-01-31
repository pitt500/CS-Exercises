import Foundation

func twoNumbersEqualToK(array: [Int], k: Int) -> Bool {
  let objectSet = Set(array)
  
  for element in objectSet {
    let x = k - element
    
    if objectSet.contains(x) {
      return true
    }
  }
  
  return false
}

let result = isTheSumEqualToK(array: [10, 15, 3, 7], k: 1)
print(result)
