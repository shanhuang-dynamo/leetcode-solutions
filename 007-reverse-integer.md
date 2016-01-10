[7. Reverse Integer](https://leetcode.com/problems/reverse-integer/)

- [prev: 6. ZigZag Conversion](006-zigzag-conversion.md)
- [next: 8. String to Integer (atoi)](008-string-to-integer-atoi.md)

---

```java
public class Solution {
    public int reverse(int x) {
        long reversed = 0;
        for (; x != 0; x /= 10) reversed = reversed * 10 + x % 10;
        return (Integer.MIN_VALUE <= reversed && reversed <= Integer.MAX_VALUE) ? (int) reversed : 0;
    }
}
```
corner cases:
- reversed value overflow => return 0

---

- [prev: 6. ZigZag Conversion](006-zigzag-conversion.md)
- [next: 8. String to Integer (atoi)](008-string-to-integer-atoi.md)
