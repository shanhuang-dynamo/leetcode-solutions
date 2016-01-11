[7. Reverse Integer](https://leetcode.com/problems/reverse-integer/)
[![java]](https://github.com/leetcode-study-group/leetcode-java-solutions/blob/master/007-reverse-integer.md)
[![cpp]](https://github.com/leetcode-study-group/leetcode-cpp-solutions/blob/master/007-reverse-integer.md)
[![c]](https://github.com/leetcode-study-group/leetcode-c-solutions/blob/master/007-reverse-integer.md)
[![csharp]](https://github.com/leetcode-study-group/leetcode-csharp-solutions/blob/master/007-reverse-integer.md)
[![ruby]](https://github.com/leetcode-study-group/leetcode-ruby-solutions/blob/master/007-reverse-integer.md)
[![python]](https://github.com/leetcode-study-group/leetcode-python-solutions/blob/master/007-reverse-integer.md)
[![js]](https://github.com/leetcode-study-group/leetcode-js-solutions/blob/master/007-reverse-integer.md)
[java]: images/java-logo.png
[cpp]: images/cpp-logo.png
[c]: images/c-logo.png
[csharp]: images/csharp-logo.png
[ruby]: images/ruby-logo.png
[python]: images/python-logo.png
[js]: images/js-logo.png

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
