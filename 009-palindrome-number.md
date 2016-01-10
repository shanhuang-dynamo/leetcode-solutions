[9. Palindrome Number](https://leetcode.com/problems/palindrome-number/)

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
