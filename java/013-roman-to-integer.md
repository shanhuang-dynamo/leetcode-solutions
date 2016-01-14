[013. Roman to Integer](https://leetcode.com/problems/roman-to-integer/)

[![java]](../java/013-roman-to-integer.md)
[![cpp]](../cpp/013-roman-to-integer.md)
[![c]](../c/013-roman-to-integer.md)
[![csharp]](../csharp/013-roman-to-integer.md)
[![ruby]](../ruby/013-roman-to-integer.md)
[![python]](../python/013-roman-to-integer.md)
[![js]](../js/013-roman-to-integer.md)
[java]: ../images/java-logo.png
[cpp]: ../images/cpp-logo.png
[c]: ../images/c-logo.png
[csharp]: ../images/csharp-logo.png
[ruby]: ../images/ruby-logo.png
[python]: ../images/python-logo.png
[js]: ../images/js-logo.png

- [prev: 012. Integer to Roman](012-integer-to-roman.md)
- [next: 014. Longest Common Prefix](014-longest-common-prefix.md)

---

We are writing Java, thus for such tiny simple algorithm, fuck off the awkward performance hacking
(e.g. use array or function to replace the HashMap).

The function is in fact a one-dimension Dynamic Programming, and the evaluation logic is,
only when is successing char's base is larger, the value of current char is negative; otherwise
positive.

```java
public class Solution {
    private static final Map<Character, Integer> bases = new HashMap<>();
    static {
        bases.put('M', 1000);
        bases.put('D', 500);
        bases.put('C', 100);
        bases.put('L', 50);
        bases.put('X', 10);
        bases.put('V', 5);
        bases.put('I', 1);
    }
    
    public int romanToInt(String s) {
        int val = 0;
        char[] chars = s.toCharArray();
        for (int current = 0, next = 0, idx = 0; current >= 0; current = next) {
            next = idx < chars.length ? bases.get(chars[idx++]) : -1;
            val += current < next ? -current : current;
        }
        return val;
    }
}
```

---

- [prev: 012. Integer to Roman](012-integer-to-roman.md)
- [next: 014. Longest Common Prefix](014-longest-common-prefix.md)
