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
            print(sum)
            print(holder?.next?.val)
            print("bef = \(dummyHead.next?.val)")
            
            let node = ListNode(sum)
            currNode.next = node
            print("val = \(currNode.next?.val)")
            currNode = currNode.next!
            
            holder = holder?.next
            holder2 = holder2?.next
        }
        if carry != 0 {
            let node = ListNode(carry)
            currNode.next = node
            currNode = currNode.next!
        }
        print("-- start from here --")
        print(dummyHead.val)
        print(dummyHead.next?.val)
        print(dummyHead.next?.next?.val)
        print(dummyHead.next?.next?.next?.val)
        return dummyHead.next
    }
}

let last = ListNode(3)
let last2 = ListNode(4)
let next = ListNode(4, last)
let next2 = ListNode(6, last2)

let solution = Solution()
let l1 = ListNode(2, next)
let l2 = ListNode(5, next2)
solution.addTwoNumbers(l1, l2)
