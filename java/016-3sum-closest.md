[016. 3Sum Closest](https://leetcode.com/problems/3sum-closest/)

[![java]](../java/016-3sum-closest.md)
[![cpp]](../cpp/016-3sum-closest.md)
[![c]](../c/016-3sum-closest.md)
[![csharp]](../csharp/016-3sum-closest.md)
[![ruby]](../ruby/016-3sum-closest.md)
[![python]](../python/016-3sum-closest.md)
[![js]](../js/016-3sum-closest.md)
[java]: ../images/java-logo.png
[cpp]: ../images/cpp-logo.png
[c]: ../images/c-logo.png
[csharp]: ../images/csharp-logo.png
[ruby]: ../images/ruby-logo.png
[python]: ../images/python-logo.png
[js]: ../images/js-logo.png

- [prev: 015. 3Sum](015-3sum.md)
- [next: 017. Letter Combinations of a Phone Number](017-letter-combinations-of-a-phone-number.md)

---

## Naive Solution
```java
// Time: O(n^2)
// Space: O(1)
public class Solution {
    public int threeSumClosest(int[] nums, int target) {
        Arrays.sort(nums);
        int minDistance = Integer.MAX_VALUE;
        int closestSum = Integer.MAX_VALUE;
        for (int i = 0; i < nums.length-2; i++) {
            int first = nums[i];
            for (int lo = i+1, hi = nums.length-1; lo < hi; ) {
                int sum = first + nums[lo] + nums[hi];
                int distance = Math.abs(sum - target);
                if (distance < minDistance) {
                    closestSum = sum;
                    minDistance = distance;
                } else if (distance == 0) {
                    return sum;
                }
                if (sum < target) { lo++; } else { hi--; }
            }
        }
        return closestSum;
    }
}
```

This [optimization](https://leetcode.com/discuss/77079/java-straightforward-solution-with-explanations) didn't
overwhelm solution above.


---

- [prev: 015. 3Sum](015-3sum.md)
- [next: 017. Letter Combinations of a Phone Number](017-letter-combinations-of-a-phone-number.md)
