[012. Integer to Roman](https://leetcode.com/problems/integer-to-roman/)

[![java]](../java/012-integer-to-roman.md)
[![cpp]](../cpp/012-integer-to-roman.md)
[![c]](../c/012-integer-to-roman.md)
[![csharp]](../csharp/012-integer-to-roman.md)
[![ruby]](../ruby/012-integer-to-roman.md)
[![python]](../python/012-integer-to-roman.md)
[![js]](../js/012-integer-to-roman.md)
[java]: ../images/java-logo.png
[cpp]: ../images/cpp-logo.png
[c]: ../images/c-logo.png
[csharp]: ../images/csharp-logo.png
[ruby]: ../images/ruby-logo.png
[python]: ../images/python-logo.png
[js]: ../images/js-logo.png

- [prev: 011. Container With Most Water](011-container-with-most-water.md)
- [next: 013. Roman to Integer](013-roman-to-integer.md)

---

Just count the digits without lack-one notation, and then fix it:

1. if it's a in-half base (i.e. 500, 50, 5)
  - next digit is 4 => next present + previous present (VIIII => IX)
  - otherwise => this present (V)
2. otherwise
  - next digit is 4 => this present + previous present (IIII => IV)
  - otherwise => digits * this present (III)
   
```java
// Time: O(n)
// Space: O(1)
public class Solution {
    private static final int[] bases = new int[] {1000, 500, 100, 50, 10, 5, 1};
    private static final char[] presents = new char[] {'M', 'D', 'C', 'L', 'X', 'V', 'I'};
    
    public String intToRoman(int num) {
        int [] digits = new int[bases.length];
        for (int i = 0; i < bases.length; i++) {
            int base = bases[i];
            digits[i] = num / base;
            num %= base;
        }
        StringBuilder builder = new StringBuilder();
        for (int i = 0; i < bases.length; i++) {
            if (digits[i] == 0) continue;
            if (i % 2 == 1) { // in-half base
                if (digits[i+1] == 4) {
                    digits[i+1] -= 4;
                    builder.append(presents[i+1]).append(presents[i-1]);
                } else {
                    builder.append(presents[i]);
                }
            } else if (digits[i] == 4) {
                builder.append(presents[i]).append(presents[i-1]);
            } else {
                for (int j = 0; j < digits[i]; j++) {
                    builder.append(presents[i]);
                }
            }
        }
        return builder.toString();
    }
}
```

Of cause you can just insert 900, 400, ... as bases. Well solution above just demonstrate the inner logic of Roman numerals.

---

- [prev: 011. Container With Most Water](011-container-with-most-water.md)
- [next: 013. Roman to Integer](013-roman-to-integer.md)
