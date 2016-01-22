[017. Letter Combinations of a Phone Number](https://leetcode.com/problems/letter-combinations-of-a-phone-number/)

[![java]](../java/017-letter-combinations-of-a-phone-number.md)
[![cpp]](../cpp/017-letter-combinations-of-a-phone-number.md)
[![c]](../c/017-letter-combinations-of-a-phone-number.md)
[![csharp]](../csharp/017-letter-combinations-of-a-phone-number.md)
[![ruby]](../ruby/017-letter-combinations-of-a-phone-number.md)
[![python]](../python/017-letter-combinations-of-a-phone-number.md)
[![js]](../js/017-letter-combinations-of-a-phone-number.md)
[java]: ../images/java-logo.png
[cpp]: ../images/cpp-logo.png
[c]: ../images/c-logo.png
[csharp]: ../images/csharp-logo.png
[ruby]: ../images/ruby-logo.png
[python]: ../images/python-logo.png
[js]: ../images/js-logo.png

- [prev: 016. 3Sum Closest](016-3sum-closest.md)
- [next: 018. 4Sum](018-4sum.md)

---

## Corner cases
- String with '0' or '1' : `[]`

## Backtracking Solution
The backtracking tree is perserved in the method call stack.
```java
// Time: O(3^n)
// Space: O(3^n) in call stack
public class Solution {
    private static final String[] alphbet = new String[] {
        "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"
    };
    
    public List<String> letterCombinations(String digits) {
        if (digits == null || digits.isEmpty()) { return Collections.<String>emptyList(); }
        List<String> combinations = new ArrayList<>();
        List<String> candidates = new ArrayList<>(digits.length());
        for (char digit : digits.toCharArray()) {
            if (digit < '2' || digit > '9') { return Collections.<String>emptyList(); }
            candidates.add(alphbet[digit - '2']);
        }
        StringBuilder builder = new StringBuilder(candidates.size());
        assembleCandidates(combinations, candidates, builder);
        return combinations;
    }
    
    private void assembleCandidates(List<String> combinations, List<String> candidates, StringBuilder current) {
        int candidateIdx = current.length();
        if (candidateIdx == candidates.size()) {
            combinations.add(current.toString());
            return;
        }
        for (char ch : candidates.get(candidateIdx).toCharArray()) {
            current.append(ch);
            assembleCandidates(combinations, candidates, current);
            current.setLength(current.length() - 1);
        }
    }
}
```

---

- [prev: 016. 3Sum Closest](016-3sum-closest.md)
- [next: 018. 4Sum](018-4sum.md)
