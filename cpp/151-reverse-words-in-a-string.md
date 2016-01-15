[151. Reverse Words in a String](https://leetcode.com/problems/reverse-words-in-a-string/)

[![java]](../java/151-reverse-words-in-a-string.md)
[![cpp]](../cpp/151-reverse-words-in-a-string.md)
[![c]](../c/151-reverse-words-in-a-string.md)
[![csharp]](../csharp/151-reverse-words-in-a-string.md)
[![ruby]](../ruby/151-reverse-words-in-a-string.md)
[![python]](../python/151-reverse-words-in-a-string.md)
[![js]](../js/151-reverse-words-in-a-string.md)
[java]: ../images/java-logo.png
[cpp]: ../images/cpp-logo.png
[c]: ../images/c-logo.png
[csharp]: ../images/csharp-logo.png
[ruby]: ../images/ruby-logo.png
[python]: ../images/python-logo.png
[js]: ../images/js-logo.png

- [prev: 150. Evaluate Reverse Polish Notation](150-evaluate-reverse-polish-notation.md)
- [next: 152. Maximum Product Subarray](152-maximum-product-subarray.md)

---
Given an input string, reverse the string word by word.

For example,
Given s = "the sky is blue",
return "blue is sky the".

```C++
//Time: O(n)
//Beat:11.32%
//Runtime:12ms
//Space: O(n)
//My solution: Simply use a new string to store the new order. Can not satisfic the requirement: O(1) space.
class Solution {
public:
    void reverseWords(string &s) {
    	string res;
        int pos = 0;
        for (int i = 0; i < s.size(); ++i)
        {
        	if(s[i] == ' ')
        	{
        		if(i > pos)
        		{
        			res = s.substr(pos,i-pos) + " " + res;
        		}
        		pos = i + 1;
        	}
        	else if(i == s.size() - 1)
        	{
        		res = s.substr(pos, s.size() - pos) + " " + res; 
        	}
        }
        s = res.substr(0,res.size()-1);
    }
};
```
```C++
//Time:O(n)
//Beat:40.11%
//Runtime:8ms
//Space: O(1)
//Soltion: This solution is simple and concise. Mostly it satisfic the requirement reverse the word in string in O(1) space.
//This question can be solved by Python much easier, using the function split()
class Solution {
    public:
        void reverseWords(string &s) {
            istringstream is(s);
            string tmp="";
            string out="";
            while(is>>tmp){
                tmp+=" ";
                tmp+=out;
                out=tmp;
            }
            s=out.substr(0,out.length()-1);
        }
    };
    ```
---

- [prev: 150. Evaluate Reverse Polish Notation](150-evaluate-reverse-polish-notation.md)
- [next: 152. Maximum Product Subarray](152-maximum-product-subarray.md)
