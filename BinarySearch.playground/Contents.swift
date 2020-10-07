import Foundation

let inputData: [Int] = [1,2,4,7,10,399,575,1000,4858,8989]  //sorted input data

//binary search recursive function
func binarySearch(inputData: [Int], searchValue: Int) -> Bool{
    let middleIndex = Int(inputData.count / 2)
    var isFound: Bool = false
    if inputData[middleIndex] == searchValue{
        isFound = true
    }
    
    if inputData.count > 1{
        if inputData[middleIndex] > searchValue{
            let leftArray = Array(inputData[0..<middleIndex])
            isFound = binarySearch(inputData: leftArray, searchValue: searchValue)
        }else{
            let rightArray = Array(inputData[middleIndex..<inputData.count])
            isFound = binarySearch(inputData: rightArray, searchValue: searchValue)
        }
    }
    
    return isFound
}

print("Found?",binarySearch(inputData: inputData, searchValue: 10000))
