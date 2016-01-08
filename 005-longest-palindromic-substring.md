[5. Longest Palindromic Substring](https://leetcode.com/problems/longest-palindromic-substring/)

```java
// Time: O(n^2)
// Space: O(n)
// Runtime: 11ms
public class Solution {

    public String longestPalindrome(String s) {
        if (s.isEmpty()) return "";
        char[] ary = s.toCharArray();
        int lo = 0;
        int hi = 0;
        int leap = 1;
        for (int center = 0, i = 0, symmetric = i; i <= ary.length; i++, symmetric--) {
            if (symmetric < 0 || i >= ary.length || ary[symmetric] != ary[i]) {
                if (i - symmetric - 1 > hi - lo) {
                    lo = symmetric + 1;
                    hi = i;
                }
                center += leap;
                symmetric = i = center;
                leap = 1;
            }
            if (symmetric == center) {
                while (i + 1 < ary.length && ary[i] == ary[i + 1]) { i++; leap++; }
            }
        }
        return s.substring(lo, hi);
    }
}
```

corner cases:
- undeterministic center: might be "a" or "aa", so just skip all identical chars in the center

optimization:
- cache the length of duplicated central chars so that center index can jump through them
- THEORICAL: Is there an algo better than O(n^2) time and O(n) space?
