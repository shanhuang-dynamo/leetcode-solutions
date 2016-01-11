[007. Reverse Integer](https://leetcode.com/problems/reverse-integer/)

[![java]](../java/007-reverse-integer.md)
[![cpp]](../cpp/007-reverse-integer.md)
[![c]](../c/007-reverse-integer.md)
[![csharp]](../csharp/007-reverse-integer.md)
[![ruby]](../ruby/007-reverse-integer.md)
[![python]](../python/007-reverse-integer.md)
[![js]](../js/007-reverse-integer.md)
[java]: ../images/java-logo.png
[cpp]: ../images/cpp-logo.png
[c]: ../images/c-logo.png
[csharp]: ../images/csharp-logo.png
[ruby]: ../images/ruby-logo.png
[python]: ../images/python-logo.png
[js]: ../images/js-logo.png

- [prev: 006. ZigZag Conversion](006-zigzag-conversion.md)
- [next: 008. String to Integer (atoi)](008-string-to-integer-atoi.md)

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

- [prev: 006. ZigZag Conversion](006-zigzag-conversion.md)
- [next: 008. String to Integer (atoi)](008-string-to-integer-atoi.md)
