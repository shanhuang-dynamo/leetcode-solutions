[209. Minimum Size Subarray Sum](https://leetcode.com/problems/minimum-size-subarray-sum/)

[![java]](../java/209-minimum-size-subarray-sum.md)
[![cpp]](../cpp/209-minimum-size-subarray-sum.md)
[![c]](../c/209-minimum-size-subarray-sum.md)
[![csharp]](../csharp/209-minimum-size-subarray-sum.md)
[![ruby]](../ruby/209-minimum-size-subarray-sum.md)
[![python]](../python/209-minimum-size-subarray-sum.md)
[![js]](../js/209-minimum-size-subarray-sum.md)
[java]: ../images/java-logo.png
[cpp]: ../images/cpp-logo.png
[c]: ../images/c-logo.png
[csharp]: ../images/csharp-logo.png
[ruby]: ../images/ruby-logo.png
[python]: ../images/python-logo.png
[js]: ../images/js-logo.png

- [prev: 208. Implement Trie (Prefix Tree)](208-implement-trie-prefix-tree.md)
- [next: 210. Course Schedule II](210-course-schedule-ii.md)

---

```C++
//Time:O(n)
//Beat:27.12%
//Runtime:4ms
//Naive solution
class Solution {
public:
    int minSubArrayLen(int s, vector<int>& nums) {
        int n = nums.size();
        int sum = 0, begin = 0, res = INT_MAX;
        for (int i = 0; i < n; ++i)
        {
        	sum += nums[i];
        	while(sum >=s)
        	{
        		res = min(res,i - begin + 1);
        		sum -= nums[begin];
        		begin++;
        	}
        }
        return res == INT_MAX?0:res;
    }
};
```

---

- [prev: 208. Implement Trie (Prefix Tree)](208-implement-trie-prefix-tree.md)
- [next: 210. Course Schedule II](210-course-schedule-ii.md)
