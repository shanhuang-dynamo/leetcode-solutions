[031. Next Permutation](https://leetcode.com/problems/next-permutation/)

[![java]](../java/031-next-permutation.md)
[![cpp]](../cpp/031-next-permutation.md)
[![c]](../c/031-next-permutation.md)
[![csharp]](../csharp/031-next-permutation.md)
[![ruby]](../ruby/031-next-permutation.md)
[![python]](../python/031-next-permutation.md)
[![js]](../js/031-next-permutation.md)
[java]: ../images/java-logo.png
[cpp]: ../images/cpp-logo.png
[c]: ../images/c-logo.png
[csharp]: ../images/csharp-logo.png
[ruby]: ../images/ruby-logo.png
[python]: ../images/python-logo.png
[js]: ../images/js-logo.png

- [prev: 030. Substring with Concatenation of All Words](030-substring-with-concatenation-of-all-words.md)
- [next: 032. Longest Valid Parentheses](032-longest-valid-parentheses.md)

---
Implement next permutation, which rearranges numbers into the lexicographically next greater permutation of numbers.
If such arrangement is not possible, it must rearrange it as the lowest possible order (ie, sorted in ascending order).
The replacement must be in-place, do not allocate extra memory.

Here are some examples. Inputs are in the left-hand column and its corresponding outputs are in the right-hand column.
```1,2,3``` → ```1,3,2```
```3,2,1``` → ```1,2,3```
```1,1,5``` → ```1,5,1```
```C++
//Time:
//Beat:13.19%
//Runtime:12ms
//Solution/*
1. From end to the beginning, find the first in-order pair of numbers, which is nums[i] < nums[i+1]

2. From end to the beginning, find the first number j larger than nums[i], which is nums[i] < nums[j] 

3. swap nums[i] and nums[j]

4. reverse all the numbers after nums[i+1]

5. if step 1 can not find an i which satisfied nums[i] < nums[i+1], it means this order is the last permute of the array.
Thus, reverse all the numbers.
*/

class Solution {
public:

    static int cmp1(int a,int b)  
    {  
        return b>a;  
    } 

    void nextPermutation(vector<int>& nums) {
        int i;
        for (i = nums.size() - 2; i >= 0 ; --i)
        {
            if(nums[i] < nums[i+1])                 // find the first in-oder pair of numbers (step 1)
                break;
        }      
        if(i < 0)
        {
            sort(nums.begin(), nums.end());         // step 5
            return;
        }

        int j;
        for (j = nums.size() - 1; j > i; j--)  
        {
            if(nums[i] < nums[j])                   //find the first numbers larger than i (step 2)
                break;
        }
        swap(nums[i],nums[j]);                      //step 3
        sort(nums.begin()+i+1, nums.end(),cmp1);    //step 4
    }
};
```


---

- [prev: 030. Substring with Concatenation of All Words](030-substring-with-concatenation-of-all-words.md)
- [next: 032. Longest Valid Parentheses](032-longest-valid-parentheses.md)
