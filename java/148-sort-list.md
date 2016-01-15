[148. Sort List](https://leetcode.com/problems/sort-list/)

[![java]](../java/148-sort-list.md)
[![cpp]](../cpp/148-sort-list.md)
[![c]](../c/148-sort-list.md)
[![csharp]](../csharp/148-sort-list.md)
[![ruby]](../ruby/148-sort-list.md)
[![python]](../python/148-sort-list.md)
[![js]](../js/148-sort-list.md)
[java]: ../images/java-logo.png
[cpp]: ../images/cpp-logo.png
[c]: ../images/c-logo.png
[csharp]: ../images/csharp-logo.png
[ruby]: ../images/ruby-logo.png
[python]: ../images/python-logo.png
[js]: ../images/js-logo.png

- [prev: 147. Insertion Sort List](147-insertion-sort-list.md)
- [next: 149. Max Points on a Line](149-max-points-on-a-line.md)

---
```
The method is to split the list into single node, then merge--- merge sort. Time complexity and spcae complexity are nLog(n)
We can do this question into two part. The first part is splitting, second part is merge.
There are two methods to split:
1. Find the middle node of list by using a slow pointer and a fast pointer.
2. Calculate the length of the list first, then use for loop to let the temp node do temp = temp.next length/2 times.
( I found the first method can only beats 23%+ people, but the second can beat 49% others)
```

``` java
public class Solution {
    public ListNode sortList(ListNode head) {
        //this question can be done by using merge two sorted linked list
        //find the middle of the linkedList, then merge...merge sort
        if (head == null || head.next == null) return head; //base case
        /*ListNode fast = head;
        ListNode slow = head;
        //find middle
        while (fast.next != null && fast.next.next != null){
            fast = fast.next.next;
            slow = slow.next;
        }*/
        int nodeSum = 0;
        ListNode tmp = head;  
        while(tmp!=null){  
            tmp = tmp.next;  
            nodeSum++;  
        }  
        tmp = head;  
        for(int i=1; i<nodeSum/2; i++){  
            tmp=tmp.next;  
        }  
        ListNode left = head;
        ListNode right = tmp.next; // if it has odd numbers of nodes, the first half has one more node
        tmp.next = null;
        return merge(sortList(left), sortList(right) );
    }
    
    
    private ListNode merge(ListNode left, ListNode right){
        ListNode result = new ListNode(0);
        ListNode res = result;
        while (left != null && right != null){
            if (left.val <= right.val){
                res.next = left;
                left = left.next;
            }else{
                res.next = right;
                right = right.next;
            }
            res = res.next;
        }
        if (left != null){
            res.next = left;
        }else{
            res.next = right;
        }
        return result.next;
    }
}
```
---

- [prev: 147. Insertion Sort List](147-insertion-sort-list.md)
- [next: 149. Max Points on a Line](149-max-points-on-a-line.md)
