[3. Longest Substring Without Repeating Characters](https://leetcode.com/problems/longest-substring-without-repeating-characters/)
[![java]](https://github.com/leetcode-study-group/leetcode-java-solutions/blob/master/003-longest-substring-without-repeating-characters.md)
[![cpp]](https://github.com/leetcode-study-group/leetcode-cpp-solutions/blob/master/003-longest-substring-without-repeating-characters.md)
[![c]](https://github.com/leetcode-study-group/leetcode-c-solutions/blob/master/003-longest-substring-without-repeating-characters.md)
[![csharp]](https://github.com/leetcode-study-group/leetcode-csharp-solutions/blob/master/003-longest-substring-without-repeating-characters.md)
[![ruby]](https://github.com/leetcode-study-group/leetcode-ruby-solutions/blob/master/003-longest-substring-without-repeating-characters.md)
[![python]](https://github.com/leetcode-study-group/leetcode-python-solutions/blob/master/003-longest-substring-without-repeating-characters.md)
[![js]](https://github.com/leetcode-study-group/leetcode-js-solutions/blob/master/003-longest-substring-without-repeating-characters.md)
[java]: images/java-logo.png
[cpp]: images/cpp-logo.png
[c]: images/c-logo.png
[csharp]: images/csharp-logo.png
[ruby]: images/ruby-logo.png
[python]: images/python-logo.png
[js]: images/js-logo.png

- [prev: 2 Add Two Numbers](002-add-two-numbers.md)
- [next: 4. Median of Two Sorted Arrays](004-median-of-two-sorted-arrays.md)

---

```java
// Time: O(n)
// Space: O(size of char set)
// Runtime: 5ms
public class Solution {
    public int lengthOfLongestSubstring(String s) {
        final int SIZE = 256;
        int[] lastOccurence = new int[SIZE];
        for (int i = 0; i < SIZE; i++) { lastOccurence[i] = -1; }

        int leftBoundary = -1;
        int maxLen = 0;
        int idx = 0;
        for (char c : s.toCharArray()) {
            int lastIdx = lastOccurence[c];
            if (lastIdx > leftBoundary) {
                leftBoundary = lastIdx;
            }
            int len = idx - leftBoundary;
            if (len > maxLen) {
                maxLen = len;
            }
            lastOccurence[c] = idx;
            idx++;
        }
        return maxLen;
    }
}
```

Corner cases:
- first occurence: so the `lastOccurence` need have a default value `-1`
- repetition inside 2 duplicated char ('abba'): the `leftBoundary` is always the left boundary of last repetition.

---

- [prev: 2 Add Two Numbers](002-add-two-numbers.md)
- [next: 4. Median of Two Sorted Arrays](004-median-of-two-sorted-arrays.md)
