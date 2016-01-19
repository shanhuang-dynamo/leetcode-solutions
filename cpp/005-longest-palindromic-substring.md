[005. Longest Palindromic Substring](https://leetcode.com/problems/longest-palindromic-substring/)

[![java]](../java/005-longest-palindromic-substring.md)
[![cpp]](../cpp/005-longest-palindromic-substring.md)
[![c]](../c/005-longest-palindromic-substring.md)
[![csharp]](../csharp/005-longest-palindromic-substring.md)
[![ruby]](../ruby/005-longest-palindromic-substring.md)
[![python]](../python/005-longest-palindromic-substring.md)
[![js]](../js/005-longest-palindromic-substring.md)
[java]: ../images/java-logo.png
[cpp]: ../images/cpp-logo.png
[c]: ../images/c-logo.png
[csharp]: ../images/csharp-logo.png
[ruby]: ../images/ruby-logo.png
[python]: ../images/python-logo.png
[js]: ../images/js-logo.png

- [prev: 004. Median of Two Sorted Arrays](004-median-of-two-sorted-arrays.md)
- [next: 006. ZigZag Conversion](006-zigzag-conversion.md)

---
Given a string S, find the longest palindromic substring in S. You may assume that the maximum length of S is 1000, and there exists one unique longest palindromic substring.

```C++
//Time:O(n^2)
//Beat:40.63%
//Runtime:92ms
//My solution: From middle to the end, find the palindromic substring, record length and start point every time. 
//             Finally, return the substring from start point and the size of result is length.

class Solution {
public:
    string longestPalindrome(string s) {
    	int length = 1;
    	int start = 0;
        for (int i = 0; i < 2*s.size() -1; ++i)
        {
        	int begin = i / 2;
        	int end = i / 2;
        	if(i % 2 == 1)
        		end++;
        	while(begin >= 0 && end <= s.size() && s[begin] == s[end])
        	{
        		int count = end - begin + 1;
        		if(count > length)
        		{
        			length = count;
        			start = begin;
        		}
        		begin--;
        		end++;
        	}
        }
        return s.substr(start,length);
    }
};
```


---

- [prev: 004. Median of Two Sorted Arrays](004-median-of-two-sorted-arrays.md)
- [next: 006. ZigZag Conversion](006-zigzag-conversion.md)
