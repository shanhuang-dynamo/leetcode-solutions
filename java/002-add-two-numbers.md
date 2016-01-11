[002. Add Two Numbers](https://leetcode.com/problems/add-two-numbers/)

[![java]](../java/002-add-two-numbers.md)
[![cpp]](../cpp/002-add-two-numbers.md)
[![c]](../c/002-add-two-numbers.md)
[![csharp]](../csharp/002-add-two-numbers.md)
[![ruby]](../ruby/002-add-two-numbers.md)
[![python]](../python/002-add-two-numbers.md)
[![js]](../js/002-add-two-numbers.md)
[java]: ../images/java-logo.png
[cpp]: ../images/cpp-logo.png
[c]: ../images/c-logo.png
[csharp]: ../images/csharp-logo.png
[ruby]: ../images/ruby-logo.png
[python]: ../images/python-logo.png
[js]: ../images/js-logo.png

- [prev: 001. Two Sum](001-two-sum.md)
- [next: 003. Longest Substring Without Repeating Characters](003-longest-substring-without-repeating-characters.md)

---

```java
// Time: O(n)
// Space: O(n)
// Runtime: 4ms
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) { val = x; }
 * }
 */
public class Solution {
    public ListNode addTwoNumbers(ListNode l1, ListNode l2) {
        int carry = 0;
        ListNode sumHead = new ListNode(-1); // dummy heads
        ListNode sumIter = sumHead;
        for (ListNode iter1 = l1, iter2 = l2;
             iter1 != null || iter2 != null;
             sumIter = sumIter.next) {
                 int val1 = iter1 != null ? iter1.val : 0;
                 int val2 = iter2 != null ? iter2.val : 0;
                 if (val1 > 9 || val2 > 9) { // for Software Engineering needs, not for the question
                     throw new AssertionError("node value should between 0 and 9");
                 }
                 int addition = val1 + val2 + carry;
                 sumIter.next = new ListNode(addition >= 10 ? addition - 10 : addition);
                 carry = addition >= 10 ? 1 : 0;
                 if (iter1 != null) {iter1 = iter1.next;}
                 if (iter2 != null) {iter2 = iter2.next;}
        }
        if (carry == 1) sumIter.next = new ListNode(1);
        return sumHead.next;
    }
}
```
Corner cases:
- carry at the last digit
- different length of 2 input list

If the naive solution didn't suffer from performance issue, just use the most intuitive code.


---

- [prev: 001. Two Sum](001-two-sum.md)
- [next: 003. Longest Substring Without Repeating Characters](003-longest-substring-without-repeating-characters.md)
