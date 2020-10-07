import Foundation

var inputData: [Int] = [10,50,3,6,1,299,30]

//mergeSort recursive function
func mergeSort(inputArray: [Int]) -> [Int]{
    if inputArray.count > 1{
        let middleIndex = Int(inputArray.count / 2)

        let leftRange = Range(NSRange(location: 0, length: middleIndex))
        let rightRange = Range(NSRange(location: middleIndex, length: (inputArray.count) - middleIndex))
        let leftArray = Array(inputArray[leftRange!])
        let rightArray = Array(inputArray[rightRange!])
        
        let leftSortedArray = mergeSort(inputArray: leftArray)
        let rightSortedArray = mergeSort(inputArray: rightArray)
        
        var sortedArray: [Int] = []
        sortedArray.reserveCapacity(inputArray.count)
        
        var leftIndex = 0
        var rightIndex = 0
        
        while leftIndex < leftSortedArray.count && rightIndex < rightSortedArray.count{
            if leftSortedArray[leftIndex] < rightSortedArray[rightIndex]{
                sortedArray.append(leftSortedArray[leftIndex])
                leftIndex = leftIndex + 1
            }else if leftSortedArray[leftIndex] > rightSortedArray[rightIndex]{
                sortedArray.append(rightSortedArray[rightIndex])
                rightIndex = rightIndex + 1
            }
        }
        
        while leftIndex < leftSortedArray.count{
            sortedArray.append(leftSortedArray[leftIndex])
            leftIndex = leftIndex + 1
        }

        while rightIndex < rightSortedArray.count{
            sortedArray.append(rightSortedArray[rightIndex])
            rightIndex = rightIndex + 1
        }
        
        return sortedArray
    }
    
    return inputArray
}

print("MergeSort",mergeSort(inputArray: inputData))
