[017. Letter Combinations of a Phone Number](https://leetcode.com/problems/letter-combinations-of-a-phone-number/)

[![java]](../java/017-letter-combinations-of-a-phone-number.md)
[![cpp]](../cpp/017-letter-combinations-of-a-phone-number.md)
[![c]](../c/017-letter-combinations-of-a-phone-number.md)
[![csharp]](../csharp/017-letter-combinations-of-a-phone-number.md)
[![ruby]](../ruby/017-letter-combinations-of-a-phone-number.md)
[![python]](../python/017-letter-combinations-of-a-phone-number.md)
[![js]](../js/017-letter-combinations-of-a-phone-number.md)
[java]: ../images/java-logo.png
[cpp]: ../images/cpp-logo.png
[c]: ../images/c-logo.png
[csharp]: ../images/csharp-logo.png
[ruby]: ../images/ruby-logo.png
[python]: ../images/python-logo.png
[js]: ../images/js-logo.png

- [prev: 016. 3Sum Closest](016-3sum-closest.md)
- [next: 018. 4Sum](018-4sum.md)

---
Given a digit string, return all possible letter combinations that the number could represent.
A mapping of digit to letters (just like on the telephone buttons) is given below.
```
Input:Digit string "23"
Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
```
```C++
//Time:O(n^2)
//Beat:8.34%
//Runtime:0ms
//My solution: classic DFS

class Solution {
public:
	string dic[10] = {{""},{""},{"abc"},{"def"},{"ghi"},{"jkl"},{"mno"},{"pqrs"},{"tuv"},{"wxyz"}};
    vector<string> letterCombinations(string digits) {
        vector<string> res;
        if(digits.size() == 0)
        	return res;
        int n = digits.size();
        string tmp(n, 0);
        dfs(tmp,0,n,res,digits);
        return res;
    }

    void dfs(string &tmp, int cur, int depth, vector<string> &res, string &digits)
    {
    	if(cur >= depth)
    	{
    		res.push_back(tmp);
    		return;
    	}
    	for (int i = 0; i < dic[digits[cur]-'0'].size(); ++i)
    	{
    		tmp[cur] = dic[digits[cur] - '0'][i];
    		dfs(tmp,cur+1,depth,res,digits);
    	}
    	return;
    }
};
```


---

- [prev: 016. 3Sum Closest](016-3sum-closest.md)
- [next: 018. 4Sum](018-4sum.md)
