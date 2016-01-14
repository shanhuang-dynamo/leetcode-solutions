[010. Regular Expression Matching](https://leetcode.com/problems/regular-expression-matching/)

[![java]](../java/010-regular-expression-matching.md)
[![cpp]](../cpp/010-regular-expression-matching.md)
[![c]](../c/010-regular-expression-matching.md)
[![csharp]](../csharp/010-regular-expression-matching.md)
[![ruby]](../ruby/010-regular-expression-matching.md)
[![python]](../python/010-regular-expression-matching.md)
[![js]](../js/010-regular-expression-matching.md)
[java]: ../images/java-logo.png
[cpp]: ../images/cpp-logo.png
[c]: ../images/c-logo.png
[csharp]: ../images/csharp-logo.png
[ruby]: ../images/ruby-logo.png
[python]: ../images/python-logo.png
[js]: ../images/js-logo.png

- [prev: 009. Palindrome Number](009-palindrome-number.md)
- [next: 011. Container With Most Water](011-container-with-most-water.md)

---

This is the first Dynamic Programming problem on Leetcode. If you are not familiar with it, you'd better to check out the discussion of `Longest Common Subsequence`
before diving into it. And DP code is super tricky to program! Prepare yourself a bunch of scratch papers and get ready to draw dozens of
grids.

## Corner cases
- "\*": it's a literal "\*"
- "\*\*": 0+ of "\*"
- "\*\*\*": 0+ of "\*" and a literal "\*"

Conclusion is only the "*" after a char is a regex pattern.

NOTE: if don't wanna handle such cases, you can still pass the OJ. Well if you wanna do this, test these samples:
```
"*"
"***"
```
and
```
"a"
"a**"
```

## Naive Solution
It's just a mutation of [Longest Common Subsequence](https://en.wikipedia.org/wiki/Longest_common_subsequence_problem) with extra rules. The naive solution is brute force subtract and conquer.
```java
// Time: O(2^n)
// Space: O(2^n) in call stack
// Runtime: 50ms
// Note: Brute Force Version
public class Solution {
    public boolean isMatch(String s, String p) {
        return isMatchFrom(s, p, 0, 0);
    }

    private boolean isMatchFrom(String input, String pattern, int inputFrom, int patternFrom) {
        int inputLen = input.length();
        int patternLen = pattern.length();
        if (inputFrom == inputLen && patternFrom == patternLen) {
            return true; // successfully matched to the end
        } else if (patternFrom == patternLen) {
            return false; // pattern exhausted but string not
        } else if (inputFrom == inputLen) { // there may be "a*b*c*" pattern left
            return patternFrom+1 < patternLen && pattern.charAt(patternFrom+1) == '*' &&
                    isMatchFrom(input, pattern, inputFrom, patternFrom+2);
        }

        char p = pattern.charAt(patternFrom);
        if (patternFrom+1 != patternLen && pattern.charAt(patternFrom+1) == '*') { // either match current or skip
            return isMatchFrom(input, pattern, inputFrom, patternFrom+2) ||
                    matches(input.charAt(inputFrom), p) && isMatchFrom(input, pattern, inputFrom+1, patternFrom);
        } else if (matches(input.charAt(inputFrom), p)) {
            return isMatchFrom(input, pattern, inputFrom+1, patternFrom+1);
        }
        return false;
    }

    private boolean matches(char in, char pat) {
        return pat == '.' || pat == in;
    }
}
```

## Basic DP Solution
Note that [this solution](https://leetcode.com/discuss/66032/java-solution-o-n-2-dp-with-some-explanations) is wrong. It didn't consider the case
when '*' could be literal.

Similar to `Longest Common Subsequence`'s DP solution. Former subsequence provide necessary info for further sequence.

Let `S` be the string, `P` be the pattern, `Ss` is `S` concatenate char `s`, `Pp` is `P` concatenate `p`.

Example: S = "abc", a = "d", b = "e", Ss = "abcd", Sab = "abcde"

The rules are:

- `p` is not "*" pattern: `Ss` matches `Pp` <=> `S` matches `P` and (`p` == '.' or `p` == `s`)
- `p` is "*" pattern: 
  1. skipItIsFine: this "*" pattern may matches 0 characters, so, `Ss` matches `Pabp` <=> `Ss` matches `Pa`
  2. matchMore: this "*" pattern has matches 1+ characters, `Ss` mathces `Pap` <=> `S` matches `Pap` and (`a` == '.' or `a` == `s`)

```java
// Time: O(n^2)
// Space: O(n^2)
// Note: DP
public class Solution {
    public boolean isMatch(String s, String p) {
        int strLen = s.length();
        int patLen = p.length();
        boolean[][] matchTable = new boolean[strLen+1][patLen+1];
        matchTable[0][0] = true; // isMatch("", "") == true
        boolean starIsPattern = false; // "*" is either literal or a pattern

        for (int sr = 0; sr <= strLen; sr++) { // must starts from 0, so "" matches /a*/
            for (int pr = 1; pr <= patLen; pr++) { // can skip 0, cuz "a" doesn't match //
                char pch = p.charAt(pr-1);
                if (pch == '*' && starIsPattern) {
                    boolean skipItIsFine = matchTable[sr][pr-2];
                    char prev = p.charAt(pr-2);
                    boolean matchMore = sr > 0 &&
                            matchTable[sr-1][pr] && (prev == '.' || prev == s.charAt(sr-1));
                    matchTable[sr][pr] = skipItIsFine || matchMore;
                } else if (sr > 0 && (pch == '.' || pch == s.charAt(sr-1))) {
                    matchTable[sr][pr] = matchTable[sr-1][pr-1];
                }
                starIsPattern = (!starIsPattern && pr < patLen && p.charAt(pr) == '*');
            }
        }
        return matchTable[strLen][patLen];
    }
}
```

## Space Optimized DP Solution
Similar to most of DP problems, valuation of current row is just depends previous row. 
Thus we have no need to store the whole matrix but squeeze them into one row.
```java
// Time: O(n^2)
// Space: O(n)
// Runtime: 4ms
public class Solution {
    public boolean isMatch(String str, String pat) {
        int strLen = str.length();
        int patLen = pat.length();
        boolean[] matchPatternTill = new boolean[patLen+1];

        // process first line
        matchPatternTill[0] = true; // str == "" and pat == ""
        for (int pr = 1; pr <= patLen - 1; pr++) {
            if (pat.charAt(pr) == '*') {
                matchPatternTill[pr+1] = matchPatternTill[pr-1];
                pr++; // next char have to be literal even if it's '*'
            }
        }

        // process rest
        boolean starIsPattern = false; // first char is always literal
        for (int sr = 1; sr <= strLen; sr++) {
            char sch = str.charAt(sr-1);
            boolean leftTop = matchPatternTill[0];
            matchPatternTill[0] = false;
            for (int pr = 1; pr <= patLen; pr++) {
                boolean top = matchPatternTill[pr];
                char pch = pat.charAt(pr-1);
                if (pch == '*' && starIsPattern) {
                    boolean skipItIsFine = matchPatternTill[pr-2];
                    char prev = pat.charAt(pr-2);
                    boolean matchMore = top && (prev == '.' || prev == sch);
                    matchPatternTill[pr] = skipItIsFine || matchMore;
                } else {
                    matchPatternTill[pr] = leftTop && (pch == '.' || pch == sch);
                }
                leftTop = top;
                starIsPattern = !starIsPattern && pr < patLen && pat.charAt(pr) == '*';
            }
        }
        return matchPatternTill[patLen];
    }
}
```

---

- [prev: 009. Palindrome Number](009-palindrome-number.md)
- [next: 011. Container With Most Water](011-container-with-most-water.md)
