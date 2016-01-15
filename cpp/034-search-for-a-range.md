[034. Search for a Range](https://leetcode.com/problems/search-for-a-range/)

[![java]](../java/034-search-for-a-range.md)
[![cpp]](../cpp/034-search-for-a-range.md)
[![c]](../c/034-search-for-a-range.md)
[![csharp]](../csharp/034-search-for-a-range.md)
[![ruby]](../ruby/034-search-for-a-range.md)
[![python]](../python/034-search-for-a-range.md)
[![js]](../js/034-search-for-a-range.md)
[java]: ../images/java-logo.png
[cpp]: ../images/cpp-logo.png
[c]: ../images/c-logo.png
[csharp]: ../images/csharp-logo.png
[ruby]: ../images/ruby-logo.png
[python]: ../images/python-logo.png
[js]: ../images/js-logo.png

- [prev: 033. Search in Rotated Sorted Array](033-search-in-rotated-sorted-array.md)
- [next: 035. Search Insert Position](035-search-insert-position.md)

---

Given a sorted array of integers, find the starting and ending position of a given target value.
Your algorithm's runtime complexity must be in the order of O(log n).
If the target is not found in the array, return [-1, -1].

For example,
Given [5, 7, 7, 8, 8, 10] and target value 8,
return [3, 4].

```C++
//Time:O(logn)
//Beat:10.91%
//Runtime:12ms
//Solution: Use binary search twice, find the left bound and the right bound separately

class Solution {
public:
    vector<int> searchRange(vector<int>& nums, int target) {
        int start = 0, end = nums.size(), mid,left,right;
        while(start < end)
        {
        	mid = (start + end) / 2;
        	if(nums[mid] >= target)
        	{
        		end = mid;
        	}
        	else
        	{
        		start = mid + 1;
        	}
        }
        left = start;  //find the left bound
        start = 0;
        end = nums.size();
        while(start < end)
        {
        	mid = (start + end) / 2;
        	if(nums[mid] > target)
        	{
        		end = mid;
        	}
        	else
        	{
        		start = mid + 1;
        	}
        }
        right = start; //find the right bound
        vector<int> res;
        if(left == right)
        {
        	res = {-1,-1};
        }
        else
        {
        	res = {left,right-1};
        }
        return res;
    }
};
```


---

- [prev: 033. Search in Rotated Sorted Array](033-search-in-rotated-sorted-array.md)
- [next: 035. Search Insert Position](035-search-insert-position.md)
