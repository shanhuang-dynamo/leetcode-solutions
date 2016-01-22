[011. Container With Most Water](https://leetcode.com/problems/container-with-most-water/)

[![java]](../java/011-container-with-most-water.md)
[![cpp]](../cpp/011-container-with-most-water.md)
[![c]](../c/011-container-with-most-water.md)
[![csharp]](../csharp/011-container-with-most-water.md)
[![ruby]](../ruby/011-container-with-most-water.md)
[![python]](../python/011-container-with-most-water.md)
[![js]](../js/011-container-with-most-water.md)
[java]: ../images/java-logo.png
[cpp]: ../images/cpp-logo.png
[c]: ../images/c-logo.png
[csharp]: ../images/csharp-logo.png
[ruby]: ../images/ruby-logo.png
[python]: ../images/python-logo.png
[js]: ../images/js-logo.png

- [prev: 010. Regular Expression Matching](010-regular-expression-matching.md)
- [next: 012. Integer to Roman](012-integer-to-roman.md)

---

The goal is to find the maximum value of `(hi - lo) * min(height[hi], height[lo])`. 
Note that the naive O(n^2) brute force solution would exceed time limit.

The trick is easy, just consider the expression, you will see you can't build a
O(n) solution with in-order iteration (i.e. i = 0 and i++), cause the `(hi - lo)`
is monotonic increasing, when you encounter a bigger area, you can't figure out
whether is the `(hi - lo)` part or `height` part made the contribution.

To do it right, just make `(hi - lo)` monotonic decreasing while iterating, then
a bigger area is found only when a new `height` is large enough to beat the previous
one.

```java
// Time: O(n)
// Space: O(1)
public class Solution {
    @SuppressWarnings("StatementWithEmptyBody")
    public int maxArea(int[] height) {
        int max = 0;
        for (int lo = 0, hi = height.length-1; lo < hi; ) {
            int area = (hi - lo) * Math.min(height[lo], height[hi]);
            if (area > max) { max = area; }
            
            if (height[lo] < height[hi]) {
                for (int max = height[lo]; lo < hi && height[lo] <= max; lo++);
            } else {
                for (int max = height[hi]; lo < hi && height[hi] <= max; hi--);
            }
        }
        return max;
    }
}
```

---

- [prev: 010. Regular Expression Matching](010-regular-expression-matching.md)
- [next: 012. Integer to Roman](012-integer-to-roman.md)
