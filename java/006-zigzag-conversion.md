[006. ZigZag Conversion](https://leetcode.com/problems/zigzag-conversion/)

[![java]](../java/006-zigzag-conversion.md)
[![cpp]](../cpp/006-zigzag-conversion.md)
[![c]](../c/006-zigzag-conversion.md)
[![csharp]](../csharp/006-zigzag-conversion.md)
[![ruby]](../ruby/006-zigzag-conversion.md)
[![python]](../python/006-zigzag-conversion.md)
[![js]](../js/006-zigzag-conversion.md)
[java]: ../images/java-logo.png
[cpp]: ../images/cpp-logo.png
[c]: ../images/c-logo.png
[csharp]: ../images/csharp-logo.png
[ruby]: ../images/ruby-logo.png
[python]: ../images/python-logo.png
[js]: ../images/js-logo.png

- [prev: 005. Longest Palindromic Substring](005-longest-palindromic-substring.md)
- [next: 007. Reverse Integer](007-reverse-integer.md)

---

The specific rules can be seen for such test case:
```
"PAYPALISHIRING"
4
```
According to the standard output, the corresponding output is:
```
P L I
AAIRN
YPSIG
P H
```
Consider a whole 2 columns as a block, then the length of a block is `numBlk = (2*numRows-2)`, 
that is `(numRows-1)*2`.

Cases are:

1. at the 1st and last row: step between each char is `numBlk`
2. otherwise, take odd columns and even columns separatedly
  - odd columns have step of `numBlk`
  - even columns have step of `numBlk` and offset `numBlk - itsRowIndex` from start of array

### corner case: numRows == 2
input:
```
"ABCDE"
2
```
output:
```
ACE
BD
```
just omit the "zag" part.

#### check if a row is either the 1st or the last one?
```
indexOfRow == 0 or (numRows-1)
```
Based on a math fact that `gcd(i, i-1) = 1`, the equation above can be transfered into:
```
indexOfRow % (numRows-1) == 0
```

```java
// Time: O(n)
// Space: O(n)
// Runtime: 5ms
public class Solution {
    public String convert(String s, int numRows) {
        if (numRows < 2 || s.length() < numRows) { return s; }
        
        int length = s.length();
        int numBlock = (numRows - 1) * 2;
        char[] converted = new char[length];
        int idx = 0;
        for (int row = 0; row < numRows; row++) {
            for (int oddIt = row, evenIt = numBlock - row; oddIt < length; oddIt += numBlock, evenIt += numBlock) {
                converted[idx++] = s.charAt(oddIt);
                if (row % (numRows-1) != 0 && evenIt < length) { converted[idx++] = s.charAt(evenIt); }
            }
        }
        return String.valueOf(converted);
    }
}
```
Note that it's efficiency is based on the assumption that `java.lang.String` is implemented to support random access well
(i.e. contiguous memory model).

    BONUS: Consider how to do it with in-order iteration.
  
    1. calculate true length of each row beforehand;
    2. or use a `StringBuilder` for each row and concat them at last.


---

- [prev: 005. Longest Palindromic Substring](005-longest-palindromic-substring.md)
- [next: 007. Reverse Integer](007-reverse-integer.md)
