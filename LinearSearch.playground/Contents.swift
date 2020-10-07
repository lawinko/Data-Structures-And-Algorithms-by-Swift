var inputData: [Int] = [3,2,6182,384,32,183]

func linearSearch(inputArray: [Int], search: Int) -> Bool{
    for index in 0 ..< inputArray.count{
        if inputArray[index] == search{
            return true
        }
    }
    return false
}

print("Found?",linearSearch(inputArray: inputData, search: 6182))
