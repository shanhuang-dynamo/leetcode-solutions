[142. Linked List Cycle II](https://leetcode.com/problems/linked-list-cycle-ii/)

[![java]](../java/142-linked-list-cycle-ii.md)
[![cpp]](../cpp/142-linked-list-cycle-ii.md)
[![c]](../c/142-linked-list-cycle-ii.md)
[![csharp]](../csharp/142-linked-list-cycle-ii.md)
[![ruby]](../ruby/142-linked-list-cycle-ii.md)
[![python]](../python/142-linked-list-cycle-ii.md)
[![js]](../js/142-linked-list-cycle-ii.md)
[java]: ../images/java-logo.png
[cpp]: ../images/cpp-logo.png
[c]: ../images/c-logo.png
[csharp]: ../images/csharp-logo.png
[ruby]: ../images/ruby-logo.png
[python]: ../images/python-logo.png
[js]: ../images/js-logo.png

- [prev: 141. Linked List Cycle](141-linked-list-cycle.md)
- [next: 143. Reorder List](143-reorder-list.md)

---
```C++
//Time:
//Beat:17.94%
//Runtime:12ms
//Solution: refer to Linked List Cycle I: first detect whether exists a cycle in linked list, then find the begin position of the cycle.
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
    ListNode *detectCycle(ListNode *head) {
        if(head == NULL || head->next == NULL)
        	return NULL;
        ListNode *first = head;
        ListNode *second = head;
        while(second!=NULL && second->next!=NULL)
        {
        	second = second->next->next;
        	first = first->next;
        	if(first == second)
        	{
        	    first = head;
        	    while(first != second)
        	    {
        	        first = first->next;
        	        second = second->next;
        	    }
        	    return second;
        	}
        }
        return NULL;
    }
};
```


---

- [prev: 141. Linked List Cycle](141-linked-list-cycle.md)
- [next: 143. Reorder List](143-reorder-list.md)
