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
        let result = ListNode(0)
        var result_tail = result
        var carry: Int = 0
        
        var p = l1
        var q = l2
        
        while p != nil || q != nil || carry != 0 {
            let val1 = p?.val ?? 0
            let val2 = q?.val ?? 0
            let result = (val1+val2+carry) % 10
            carry = (val1+val2+carry) / 10
            
            result_tail.next = ListNode(result)
            result_tail = result_tail.next!
            
            p = p?.next
            q = q?.next
        }
        
        return result.next
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
