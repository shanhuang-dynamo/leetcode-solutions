[128. Longest Consecutive Sequence](https://leetcode.com/problems/longest-consecutive-sequence/)

[![java]](../java/128-longest-consecutive-sequence.md)
[![cpp]](../cpp/128-longest-consecutive-sequence.md)
[![c]](../c/128-longest-consecutive-sequence.md)
[![csharp]](../csharp/128-longest-consecutive-sequence.md)
[![ruby]](../ruby/128-longest-consecutive-sequence.md)
[![python]](../python/128-longest-consecutive-sequence.md)
[![js]](../js/128-longest-consecutive-sequence.md)
[java]: ../images/java-logo.png
[cpp]: ../images/cpp-logo.png
[c]: ../images/c-logo.png
[csharp]: ../images/csharp-logo.png
[ruby]: ../images/ruby-logo.png
[python]: ../images/python-logo.png
[js]: ../images/js-logo.png

- [prev: 127. Word Ladder](127-word-ladder.md)
- [next: 129. Sum Root to Leaf Numbers](129-sum-root-to-leaf-numbers.md)

---
Given an unsorted array of integers, find the length of the longest consecutive elements sequence.

For example,
Given ```[100, 4, 200, 1, 3, 2]```,
The longest consecutive elements sequence is ```[1, 2, 3, 4]```. Return its length: ```4```.

Your algorithm should run in O(n) complexity.
```C++
//Time:O(n)
//Beat:94.54%
//Runtime:12ms
//My Solution: First sort the array. Then find all consecutive subarray. Once the next number is unconsecutive, store current count into max and reset count. If the next number equals to the current number, just ignore it. Finally, return the maximum max.
class Solution {
public:
    int longestConsecutive(vector<int>& nums) {
        int count = 1;
        int max = 1;
        sort(nums.begin(), nums.end());
        for (int i = 1; i < nums.size(); ++i)
        {
            if(nums[i] - nums[i-1] == 1)
            {
                count++;
            }
            else if(nums[i] == nums[i-1])
            {
                continue;
            }
            else
            {
                if(count >= max)
                    max = count;
                count = 1;
            }
        }
        if(count >= max)
            max = count;
        return max;
    }
};
```


---

- [prev: 127. Word Ladder](127-word-ladder.md)
- [next: 129. Sum Root to Leaf Numbers](129-sum-root-to-leaf-numbers.md)
