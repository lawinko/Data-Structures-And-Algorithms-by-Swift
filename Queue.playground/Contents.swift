import Foundation

public struct Queue<T>{
    private var array = [T?]()
    private var head: Int = 0
    
    public var size: Int{
        return array.count
    }
    
    public var isEmpty: Bool{
        return array.isEmpty
    }
    
    public mutating func queue(value: T){
        array.append(value)
    }
    
    //Optimize dequeue function
    //Time Complexity **0(1)**
    public mutating func dequeue() -> T?{
        guard head < array.count, let element = array[head] else {
            return nil
        }
        array[head] = nil
        head = head + 1
        
        let percentage = Double(head)/Double(array.count)
        if array.count > 50 && percentage > 0.25{
            array.removeFirst(head)
            head = 0
        }
        
        return element
    }
    
    public func front() ->T?{
        return array.first!
    }
}

