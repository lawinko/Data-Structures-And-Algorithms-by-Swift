import Foundation

public class Node<T>{
    
    var value: T?
    var next: Node?
    var previous: Node?
    
    init(value: T) {
        self.value = value
    }
    
}

public class LinkedList<T>{
    private var head: Node<T>?
    
    public var firstNode: Node<T>?{
        return self.head
    }
    
    public var lastNode: Node<T>?{
        guard var node = head else{
            return nil
        }
        while let next = node.next{
            node = next
        }
        return node
    }
    
    init(value: T) {
        self.head = Node(value: value)
    }
    
    public func append(value: T){
        if let last = lastNode{
            let node = Node(value: value)
            node.previous = last
            last.next = node
        }else{
            self.head = Node(value: value)
        }
    }
    
    public func insert(node: Node<T>, index: Int) -> Node<T>?{
        let newNode = node
        if index == 0{
            self.head?.previous = newNode
            newNode.next = self.head
            self.head = newNode
            return self.head
        }
        
        let prev = self.nodeAt(index: index - 1)
        let next = prev?.next
        
        newNode.previous = prev
        next?.previous = newNode
        newNode.next = next
        prev?.next = newNode
        return node
    }
    
    public func remove(node: Node<T>) -> Node<T>?{
        let prev = node.previous
        let next = node.next
        
        if let prev = prev{
            prev.next = next
        }else{
            self.head = next
        }
        
        next?.previous = prev
        node.value = nil
        node.previous = nil
        return node
    }
    
    public func removeAt(index: Int) -> Node<T>?{
        let node = nodeAt(index: index)
        assert(node != nil, "Index out of bounds")
        let next = node?.next
        let prev = node?.previous
        prev?.next = next
        next?.previous = prev
        node?.value = nil
        node?.next = nil
        return node
    }
    
    public func reverse() -> LinkedList{
        var node = self.head
        while let currentNode = node{
            node = currentNode.next
            swap(&currentNode.next, &currentNode.previous)
            head = currentNode
        }
        return self
    }
    
    public func nodeAt(index: Int) -> Node<T>?{
        if index == 0{
            return self.head
        }
        
        var node = head
        for _ in 1...index{
            node = node?.next
        }
        return node
    }
    
}

extension LinkedList: CustomStringConvertible{
    
    public var description: String{
        if let head = self.head{
            var strArray: [String] = []
            var node = head
            strArray.append(head.value as! String)
            while let next = node.next{
                node = next
                strArray.append(node.value as! String)
            }
            return strArray.joined(separator: ",")
        }
        return ""
    }
}

var list: LinkedList<String> = LinkedList(value: "h1")
list.append(value: "h2")
list.append(value: "h3")
list.append(value: "h4")
print(list)
print(list.reverse())
