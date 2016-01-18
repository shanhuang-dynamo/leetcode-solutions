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
Given n non-negative integers a1, a2, ..., an, where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). Find two lines, which together with x-axis forms a container, such that the container contains the most water.
```C++
//Time:O(n)
//Beat:12.58%
//Runtime:28ms
/*Soultion: It takes me lots of time to understand the question: there are many lines (i,ai)(i,0) in the coordinate, 
each two lines(ai,aj) can make up a container, the bottom of this container is (j-i), 
the height of this container is min(ai,aj), the area of this container is (j-i)*min(ai,aj). 
Assume the largest container is made by the first line and the last line, 
then continuely change the short line until i > j. */

class Solution {
public:
    int maxArea(vector<int>& height) {
        int left = 0, right = height.size() - 1;
        int max1 = 0;
        while(left < right && left >= 0 && right <= height.size()-1)
        {
        	max1 = max(max1,min(height[left],height[right]) * (right-left));
        	if(height[left] > height[right])
        	{
        		right--;
        	}
        	else
        	{
        		left++;
        	}
        }
        return max1;
    }
};
```


---

- [prev: 010. Regular Expression Matching](010-regular-expression-matching.md)
- [next: 012. Integer to Roman](012-integer-to-roman.md)
