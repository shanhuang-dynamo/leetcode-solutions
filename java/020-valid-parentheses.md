[020. Valid Parentheses](https://leetcode.com/problems/valid-parentheses/)

[![java]](../java/020-valid-parentheses.md)
[![cpp]](../cpp/020-valid-parentheses.md)
[![c]](../c/020-valid-parentheses.md)
[![csharp]](../csharp/020-valid-parentheses.md)
[![ruby]](../ruby/020-valid-parentheses.md)
[![python]](../python/020-valid-parentheses.md)
[![js]](../js/020-valid-parentheses.md)
[java]: ../images/java-logo.png
[cpp]: ../images/cpp-logo.png
[c]: ../images/c-logo.png
[csharp]: ../images/csharp-logo.png
[ruby]: ../images/ruby-logo.png
[python]: ../images/python-logo.png
[js]: ../images/js-logo.png

- [prev: 019. Remove Nth Node From End of List](019-remove-nth-node-from-end-of-list.md)
- [next: 021. Merge Two Sorted Lists](021-merge-two-sorted-lists.md)

---

```java
// Time: O(n)
// Space: O(n)
public class Solution {
    private static Map<Character, Character> pairs = new HashMap<>();
    static {
        pairs.put('(', ')');
        pairs.put('[', ']');
        pairs.put('{', '}');
    }
    
    public boolean isValid(String s) {
        Deque<Character> pairStack = new ArrayDeque<>();
        for (char ch : s.toCharArray()) {
            if (pairs.containsKey(ch)) {
                pairStack.push(ch);
            } else if (pairs.containsValue(ch)) {
                if (pairStack.isEmpty()) return false;
                char left = pairStack.pop();
                if (pairs.get(left) != ch) return false;
            }
        }
        return pairStack.isEmpty();
    }
}
```

---

- [prev: 019. Remove Nth Node From End of List](019-remove-nth-node-from-end-of-list.md)
- [next: 021. Merge Two Sorted Lists](021-merge-two-sorted-lists.md)
