public struct Stack<T>{
    fileprivate var array: [T] = []
    
    public var count: Int{
        return array.count
    }
    
    public var isEmpty: Bool{
        return array.isEmpty
    }
    
    public mutating func push(value: T){
        array.append(value)
    }
    
    public mutating func pop() -> T?{
        return array.popLast()
    }
    
    public func top() -> T?{
        return array.last
    }
    
}
