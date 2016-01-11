[4. Median of Two Sorted Arrays](https://leetcode.com/problems/median-of-two-sorted-arrays/)
[![java]](https://github.com/leetcode-study-group/leetcode-java-solutions/blob/master/004-median-of-two-sorted-arrays.md)
[![cpp]](https://github.com/leetcode-study-group/leetcode-cpp-solutions/blob/master/004-median-of-two-sorted-arrays.md)
[![c]](https://github.com/leetcode-study-group/leetcode-c-solutions/blob/master/004-median-of-two-sorted-arrays.md)
[![csharp]](https://github.com/leetcode-study-group/leetcode-csharp-solutions/blob/master/004-median-of-two-sorted-arrays.md)
[![ruby]](https://github.com/leetcode-study-group/leetcode-ruby-solutions/blob/master/004-median-of-two-sorted-arrays.md)
[![python]](https://github.com/leetcode-study-group/leetcode-python-solutions/blob/master/004-median-of-two-sorted-arrays.md)
[![js]](https://github.com/leetcode-study-group/leetcode-js-solutions/blob/master/004-median-of-two-sorted-arrays.md)
[java]: images/java-logo.png
[cpp]: images/cpp-logo.png
[c]: images/c-logo.png
[csharp]: images/csharp-logo.png
[ruby]: images/ruby-logo.png
[python]: images/python-logo.png
[js]: images/js-logo.png

- [prev: 3. Longest Substring Without Repeating Characters](003-longest-substring-without-repeating-characters.md)
- [next: 5. Longest Palindromic Substring](005-longest-palindromic-substring.md)

---

```java
// Time: O(lg(m+n))
// Space: O(lg(m+n)) in call stack
// Runtime: 5ms
public class Solution {
    public double findMedianSortedArrays(int[] nums1, int[] nums2) {
        int size = nums1.length + nums2.length;
        if (size == 0) { return null; }
        return findRankedSortedArrays((size+1)/2, size % 2 != 0,
                nums1, 0, nums1.length,
                nums2, 0, nums2.length);
    }

    // the signature is so Egg-Pain due to Java's primitive arrays don't provide non-copy slice view.
    private double findRankedSortedArrays(int rank, boolean isOdd,
            int[] nums1, int lo1, int hi1,
            int[] nums2, int lo2, int hi2) {
        if (lo1 == hi1) { return findRankedSortedArrays(rank, isOdd, nums2, lo2, hi2, nums1, lo1, hi1); }
        int rank1 = (lo1 + hi1)/2 + 1;
        int rank2 = getLastRankLessThan(nums1[rank1-1], nums2, lo2, hi2);
        // rank1 and rank2 are not symmetric, rank1 includes the first element >= value while rank2 does not
        if (rank1 + rank2 < rank) {
            return findRankedSortedArrays(rank, isOdd,
                    nums1, rank1, hi1,
                    nums2, rank2, hi2
                    );
        } else if (rank1 + rank2 > rank) {
            return findRankedSortedArrays(rank, isOdd,
                    nums1, lo1, rank1-1, // rank-1 to get rid of the element == value
                    nums2, lo2, rank2
                    );
        } else {
            if (isOdd) {
                return nums1[rank1-1];
            } else {
                int left = nums1[rank1-1];
                int right;
                if (rank1 >= nums1.length) {
                    right = nums2[rank2];
                } else if (rank2 >= nums2.length) {
                    right = nums1[rank1];
                } else {
                    right = Math.min(nums1[rank1], nums2[rank2]);
                }
                return (left + right)/2.0;
            }
        }
    }

    private int getLastRankLessThan(int target, int[] ary, int lo, int hi) {
        while (lo < hi) {
            int mid = (lo + hi) / 2;
            if (target < ary[mid]) { hi = mid; }
            else { lo = mid + 1; }
        }
        return lo; // it's a hack: (least index >= target) == (last rank < target)
    }
}
```

It's just the mutation of binary search. The most tricky part is the calculation of the indices/rank which tended to cause add-one/lack-one fault. Remember `rank = index + 1`.

corner cases:
- nums1 is empty but nums2 is not: cause we use nums1 as the search base of nums2, in this case swap nums1 and nums2.
- both are empty: return null
- when returning value: when total size is even, is possible that rank1/rank2 == end of array, but at any time only one of them might be at end of array.

---

- [prev: 3. Longest Substring Without Repeating Characters](003-longest-substring-without-repeating-characters.md)
- [next: 5. Longest Palindromic Substring](005-longest-palindromic-substring.md)
