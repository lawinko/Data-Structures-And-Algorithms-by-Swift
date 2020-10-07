//SELECTION SORT
import Foundation

let inputArray: [Int] = [3,2,6,192,384,291,1,0,-10]

//ascending order
//return sorted array
func selectionSort(inputArray: [Int]) -> [Int]{
    
    var array = inputArray
    var startIndex: Int = 0
    var index: Int = 0
    var smalletIndex: Int = 0
    
    while(index < array.count){
        if (array[index] < array[smalletIndex]){
            smalletIndex = index
        }
        index = index + 1
        if (index == array.count){
            array.swapAt(smalletIndex, startIndex)
            startIndex = startIndex + 1
            index = startIndex
        }
    }
    return array
}

print(selectionSort(inputArray: inputArray))
