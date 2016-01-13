[092. Reverse Linked List II](https://leetcode.com/problems/reverse-linked-list-ii/)

[![java]](../java/092-reverse-linked-list-ii.md)
[![cpp]](../cpp/092-reverse-linked-list-ii.md)
[![c]](../c/092-reverse-linked-list-ii.md)
[![csharp]](../csharp/092-reverse-linked-list-ii.md)
[![ruby]](../ruby/092-reverse-linked-list-ii.md)
[![python]](../python/092-reverse-linked-list-ii.md)
[![js]](../js/092-reverse-linked-list-ii.md)
[java]: ../images/java-logo.png
[cpp]: ../images/cpp-logo.png
[c]: ../images/c-logo.png
[csharp]: ../images/csharp-logo.png
[ruby]: ../images/ruby-logo.png
[python]: ../images/python-logo.png
[js]: ../images/js-logo.png

- [prev: 091. Decode Ways](091-decode-ways.md)
- [next: 093. Restore IP Addresses](093-restore-ip-addresses.md)

---
Requirement:Reverse a linked list from position m to n. Do it in-place and in one-pass.

For example:
Given 1->2->3->4->5->NULL, m = 2 and n = 4,

return 1->4->3->2->5->NULL.

Note:
Given m, n satisfy the following condition:
1 ≤ m ≤ n ≤ length of list.
------------------------------------------------------
This question requires us to reverse part of the linked list.
At first you must understand how to reverse a linked list proficiently.
As to reverse just part of linked list, we should take care several corner cases.
1. head == null || head.next == null || m = n = 1, at this case just return head.
2. When m == 1, the head of the old linked list will change to another position. As we know, we cannot lose the control of the head node in linkedlist. So I use a dummy node in the front    (P.S. the return value is dummy.next).
3. Do not forget to record the position of those useful nodes
My code is as follows:



```java

public class Solution {
    public ListNode reverseBetween(ListNode head, int m, int n) {
    if (head == null || head.next == null || n == 1){
    			return head;
    	}
    	ListNode dummy = new ListNode(0);
    	dummy.next = head;
    	ListNode cur = dummy; //use cur to do the reverse work
    	for (int i = 1; i < m; i++){
    		cur = cur.next;
    	}
    	ListNode before = cur; //before is the node before m-th node
    	ListNode mthNode = cur.next;
    	//do the reverse work
    	// since we have the condition 1 ≤ m ≤ n ≤ length of list, do not need to take care of out of bound situation
    	ListNode prev = mthNode;
    	cur = cur.next.next;
    	for (int i = 0; i < n - m; i++){ 
    		ListNode next = cur.next;
    		cur.next = prev;
    		prev = cur;
    		cur = next;
    	}
    	mthNode.next = cur; //now cur is the (nth + 1) node
    	before.next = prev; //prev is the new head of the reverse part
    	return dummy.next;
    }
}
```


---

- [prev: 091. Decode Ways](091-decode-ways.md)
- [next: 093. Restore IP Addresses](093-restore-ip-addresses.md)
