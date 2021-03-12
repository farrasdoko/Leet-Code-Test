import UIKit

// Template Class (ListNode)
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var holder = l1
        var holder2 = l2
        
        var carry = 0
        var sum = 0
        
        let dummyHead = ListNode()
        var currNode = dummyHead
        
        while holder != nil || holder2 != nil {
            let value = holder?.val ?? 0
            let value2 = holder2?.val ?? 0
            
            sum = value + value2 + carry
            carry = 0
            if sum > 9 {
                sum = sum % 10
                carry = 1
            }
            
            let node = ListNode(sum)
            currNode.next = node
            currNode = currNode.next!
            
            holder = holder?.next
            holder2 = holder2?.next
        }
        if carry != 0 {
            let node = ListNode(carry)
            currNode.next = node
            currNode = currNode.next!
        }
        return dummyHead.next
    }
}

// Testing
let numbers: [Int] = [2,4,3]
let numbers2: [Int] = [5,6,4]

func convert(_ array: [Int]) -> ListNode? {
    let dummy = ListNode()
    var tail = dummy

    for item in array {
        let node = ListNode(item)
        tail.next = node
        tail = tail.next!
    }
    return dummy.next
}

let l1 = convert(numbers)
let l2 = convert(numbers2)

let solution = Solution()

// Manage the result
var result = solution.addTwoNumbers(l1, l2)

var arrResult = Array<Int>()
while result != nil {
    if let val = result?.val {
        arrResult.append(val)
    }
    result = result?.next
}
print("the result is: \(arrResult)")
