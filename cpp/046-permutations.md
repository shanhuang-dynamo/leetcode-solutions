[046. Permutations](https://leetcode.com/problems/permutations/)

[![java]](../java/046-permutations.md)
[![cpp]](../cpp/046-permutations.md)
[![c]](../c/046-permutations.md)
[![csharp]](../csharp/046-permutations.md)
[![ruby]](../ruby/046-permutations.md)
[![python]](../python/046-permutations.md)
[![js]](../js/046-permutations.md)
[java]: ../images/java-logo.png
[cpp]: ../images/cpp-logo.png
[c]: ../images/c-logo.png
[csharp]: ../images/csharp-logo.png
[ruby]: ../images/ruby-logo.png
[python]: ../images/python-logo.png
[js]: ../images/js-logo.png

- [prev: 045. Jump Game II](045-jump-game-ii.md)
- [next: 047. Permutations II](047-permutations-ii.md)

---
Given a collection of distinct numbers, return all possible permutations.

For example,
```[1,2,3]``` have the following permutations:
```[1,2,3]```, ```[1,3,2]```, ```[2,1,3]```, ```[2,3,1]```,``` [3,1,2]```, and ```[3,2,1]```.

```C++
//Time:
//Beat:25.43%
//Runtime:16ms
//Solution: Backtracking. Use DFS to find every permutions start from i (i=0 ~ size). 
Then backtrack to the orginal array.

class Solution {
public:
    vector<vector<int>> permute(vector<int>& nums) {
        vector<vector<int> > res;
        recursive(nums,0,res);
        return res;
    }

    void recursive(vector<int> &nums, int begin, vector<vector<int> > &res)
    {
        if(begin >= nums.size())
        {
            res.push_back(nums);
            return;
        }

        for (int i = begin; i < nums.size(); ++i)
        {
            swap(nums[begin], nums[i]);
            recursive(nums,begin + 1, res);   // DFS find all permutions start from nums[begin]
            swap(nums[begin],nums[i]);        // backtrack to the original array
        }
    }
};
```

---

- [prev: 045. Jump Game II](045-jump-game-ii.md)
- [next: 047. Permutations II](047-permutations-ii.md)
