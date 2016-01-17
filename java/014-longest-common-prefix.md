[014. Longest Common Prefix](https://leetcode.com/problems/longest-common-prefix/)

[![java]](../java/014-longest-common-prefix.md)
[![cpp]](../cpp/014-longest-common-prefix.md)
[![c]](../c/014-longest-common-prefix.md)
[![csharp]](../csharp/014-longest-common-prefix.md)
[![ruby]](../ruby/014-longest-common-prefix.md)
[![python]](../python/014-longest-common-prefix.md)
[![js]](../js/014-longest-common-prefix.md)
[java]: ../images/java-logo.png
[cpp]: ../images/cpp-logo.png
[c]: ../images/c-logo.png
[csharp]: ../images/csharp-logo.png
[ruby]: ../images/ruby-logo.png
[python]: ../images/python-logo.png
[js]: ../images/js-logo.png

- [prev: 013. Roman to Integer](013-roman-to-integer.md)
- [next: 015. 3Sum](015-3sum.md)

---

NOTE: [This solution](https://leetcode.com/discuss/79168/1ms-java-solution-beats-86-81%25) is O(n^3)
for `String.startsWith()` is O(n)! Don't misled by its runtime.
```
// Time: O(n^2)
// Space: O(1)
public class Solution {
    public String longestCommonPrefix(String[] strs) {
        if (strs == null || strs.length == 0) { return ""; }
        String prefix = strs[0];
        if (prefix == null || prefix.isEmpty()) { return ""; }
        char[] one = prefix.toCharArray();
        int max = one.length;
        
        for (int i = 1; i < strs.length; i++) {
            String that = strs[i];
            if (that == null || that.isEmpty()) { return ""; }
            char[] another = that.toCharArray();
            
            int commonLen = 0;
            while (commonLen < one.length &&
                commonLen < another.length &&
                one[commonLen] == another[commonLen]) commonLen++;
            if (commonLen < max) {
                max = commonLen;
            }
        }
        return strs[0].substring(0, max);
    }
}
```

---

- [prev: 013. Roman to Integer](013-roman-to-integer.md)
- [next: 015. 3Sum](015-3sum.md)
