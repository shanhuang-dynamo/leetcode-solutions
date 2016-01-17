[047. Permutations II](https://leetcode.com/problems/permutations-ii/)

[![java]](../java/047-permutations-ii.md)
[![cpp]](../cpp/047-permutations-ii.md)
[![c]](../c/047-permutations-ii.md)
[![csharp]](../csharp/047-permutations-ii.md)
[![ruby]](../ruby/047-permutations-ii.md)
[![python]](../python/047-permutations-ii.md)
[![js]](../js/047-permutations-ii.md)
[java]: ../images/java-logo.png
[cpp]: ../images/cpp-logo.png
[c]: ../images/c-logo.png
[csharp]: ../images/csharp-logo.png
[ruby]: ../images/ruby-logo.png
[python]: ../images/python-logo.png
[js]: ../images/js-logo.png

- [prev: 046. Permutations](046-permutations.md)
- [next: 048. Rotate Image](048-rotate-image.md)

---
Given a collection of numbers that might contain duplicates, return all possible unique permutations.

For example,
```[1,1,2]``` have the following unique permutations:
```[1,1,2]```, ```[1,2,1]```, and ```[2,1,1]```.
```C++
//Time:
//Beat:50.29%
//Runtime:32ms
//My solution: same solution as Leetcode 46--Permute I. Use recursion, DFS and do a little revise
class Solution {
public:
    void recursion(vector<int> nums, int begin,  vector<vector<int> > &res) {
        if (begin == nums.size() -1) {
            res.push_back(nums);
            return;
        }
        for (int i = begin; i < nums.size(); i++) {
            if (begin != i && nums[begin] == nums[i]) continue;     //difference from leetcode 46
            swap(nums[begin], nums[i]);
            recursion(nums, begin+1, res);
        }
    }
    vector<vector<int> > permuteUnique(vector<int> &nums) {
        sort(nums.begin(), nums.end());
        vector<vector<int> >res;
        recursion(nums, 0, res);
        return res;
    }
};
```


---

- [prev: 046. Permutations](046-permutations.md)
- [next: 048. Rotate Image](048-rotate-image.md)
