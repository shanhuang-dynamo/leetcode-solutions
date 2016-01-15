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
Reverse a linked list from position m to n. Do it in-place and in one-pass.

For example:
Given ``` 1->2->3->4->5->NULL```, m = 2 and n = 4, 
return ```1->4->3->2->5->NULL```.

Note:
Given m, n satisfy the following condition:
1 ≤ m ≤ n ≤ length of list.

```C++
//Time:
//Beat:2.33%
//Runtime:4ms
//My solution: 1)find the mth node; 2)find the nth node; 3) reverse the nodes after mth and nth.

/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode(int x) : val(x), next(NULL) {}
 * };
 */
class Solution {
public:
    ListNode* reverseBetween(ListNode* head, int m, int n) {
        ListNode* new_head = new ListNode(0);
        new_head->next = head;
        ListNode* pre = new_head;
        for (int i = 0; i < m-1; ++i)
        {
        	pre = pre->next;
        }
        ListNode* mth = pre->next;  			// find the mth Node
        for (int i = 0; i < n-m; ++i)
        {
        	ListNode* tmp = mth->next; 			//use tmp to store temp node until find the nth Node
        	mth->next = tmp->next;              
        	tmp->next = pre->next;
        	// reverse the node after mth and nth
        	pre->next = tmp;
        }
       // ListNode* nth = tmp;                    //find the nth Node and finish the reverse

        return new_head->next;
    }
};
```


---

- [prev: 091. Decode Ways](091-decode-ways.md)
- [next: 093. Restore IP Addresses](093-restore-ip-addresses.md)
