[9. Palindrome Number](https://leetcode.com/problems/palindrome-number/)

[![java]](../java/009-palindrome-number.md)
[![cpp]](../cpp/009-palindrome-number.md)
[![c]](../c/009-palindrome-number.md)
[![csharp]](../csharp/009-palindrome-number.md)
[![ruby]](../ruby/009-palindrome-number.md)
[![python]](../python/009-palindrome-number.md)
[![js]](../js/009-palindrome-number.md)
[java]: ../images/java-logo.png
[cpp]: ../images/cpp-logo.png
[c]: ../images/c-logo.png
[csharp]: ../images/csharp-logo.png
[ruby]: ../images/ruby-logo.png
[python]: ../images/python-logo.png
[js]: ../images/js-logo.png

- [prev: 8. String to Integer (atoi)](008-string-to-integer-atoi.md)
- [next: 10. Regular Expression Matching](010-regular-expression-matching.md)

---
Caution: because of the O(1) space restriction, any algo that use multiplying
10s to compute the digit base will raise the time compexity to O(n^2)

## Naive solution
```java
// Time: O(n)
// Space: O(1)
// Runtime: 13ms
public class Solution {
    public boolean isPalindrome(int x) {
        return x == 0 || (x > 0 && x % 10 != 0 && reverse(x) == x);
    }
    
    private int reverse(int x) {
        int reversed = 0;
        for (; x != 0; x /= 10) reversed = reversed * 10 + x % 10;
        return reversed;
    }
}
```

---

- [prev: 8. String to Integer (atoi)](008-string-to-integer-atoi.md)
- [next: 10. Regular Expression Matching](010-regular-expression-matching.md)
