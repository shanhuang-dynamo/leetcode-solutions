[019. Remove Nth Node From End of List](https://leetcode.com/problems/remove-nth-node-from-end-of-list/)

[![java]](../java/019-remove-nth-node-from-end-of-list.md)
[![cpp]](../cpp/019-remove-nth-node-from-end-of-list.md)
[![c]](../c/019-remove-nth-node-from-end-of-list.md)
[![csharp]](../csharp/019-remove-nth-node-from-end-of-list.md)
[![ruby]](../ruby/019-remove-nth-node-from-end-of-list.md)
[![python]](../python/019-remove-nth-node-from-end-of-list.md)
[![js]](../js/019-remove-nth-node-from-end-of-list.md)
[java]: ../images/java-logo.png
[cpp]: ../images/cpp-logo.png
[c]: ../images/c-logo.png
[csharp]: ../images/csharp-logo.png
[ruby]: ../images/ruby-logo.png
[python]: ../images/python-logo.png
[js]: ../images/js-logo.png

- [prev: 018. 4Sum](018-4sum.md)
- [next: 020. Valid Parentheses](020-valid-parentheses.md)

---

## Iteration Solution
NOTE: this solution will cause `Memory Limit Exceeded` on the OJ. Obviously it wanna you
do it with recursion. But in practice is not a good idea, it just move the space complexity
from the heap to the call stack, not to mention the call stack memory is much less than the heap.
```java
// Time: O(n)
// Space: O(n)
public class Solution {
    public ListNode removeNthFromEnd(ListNode head, int n) {
        if (head == null) { return null; }
        List<ListNode> nodes = new ArrayList<>();
        int i = 1;
        for (ListNode node = head; head.next != null; node = head.next, i++) {
            nodes.add(node);
        }
        int idxToRemove = i - n;
        if (idxToRemove == 0) {
            return head.next;
        }
        nodes.get(idxToRemove-1).next = nodes.get(idxToRemove).next;
        return head;
    }
}
```

## Recursion Solution
```java
// Time: O(n)
// Space: O(n) in call stack
public class Solution {
    public ListNode removeNthFromEnd(ListNode head, int n) {
        if (head == null) { return null; }
        int relativeRank = forward(head, n);
        if (relativeRank == 0) {
            return head.next;
        } else {
            return head;
        }
    }
    
    private int forward(ListNode node, int n) {
        if (node.next == null) {
            return n - 1;
        }
        int relativeRank = forward(node.next, n);
        if (relativeRank == 0) {
            node.next = node.next != null ? node.next.next : null;
        }
        return relativeRank - 1;
    }
}
```

---

- [prev: 018. 4Sum](018-4sum.md)
- [next: 020. Valid Parentheses](020-valid-parentheses.md)
