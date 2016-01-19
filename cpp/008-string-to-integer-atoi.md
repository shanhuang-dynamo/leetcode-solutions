[008. String to Integer (atoi)](https://leetcode.com/problems/string-to-integer-atoi/)

[![java]](../java/008-string-to-integer-atoi.md)
[![cpp]](../cpp/008-string-to-integer-atoi.md)
[![c]](../c/008-string-to-integer-atoi.md)
[![csharp]](../csharp/008-string-to-integer-atoi.md)
[![ruby]](../ruby/008-string-to-integer-atoi.md)
[![python]](../python/008-string-to-integer-atoi.md)
[![js]](../js/008-string-to-integer-atoi.md)
[java]: ../images/java-logo.png
[cpp]: ../images/cpp-logo.png
[c]: ../images/c-logo.png
[csharp]: ../images/csharp-logo.png
[ruby]: ../images/ruby-logo.png
[python]: ../images/python-logo.png
[js]: ../images/js-logo.png

- [prev: 007. Reverse Integer](007-reverse-integer.md)
- [next: 009. Palindrome Number](009-palindrome-number.md)

---
Implement atoi to convert a string to an integer.

```C++
//Time:O(n)
//Beat:13.74%
//Runtime:12ms
//My solution: First, find the symbol('-'/'+') to judge positive or negative, 
//             Then traverse the string, turn every char to digit.
//             At the beginning, I ignored the overflow and the case '-+2'.

class Solution {
public:
   int myAtoi(string str) {
    	long result = 0;
    	int indicator = 1;
	    for(int i = 0; i<str.size();)
	    {
	        i = str.find_first_not_of(' ');
	        if(str[i] == '-' || str[i] == '+')
	            indicator = (str[i++] == '-')? -1 : 1;
	        while('0'<= str[i] && str[i] <= '9') 
	        {
	            result = result*10 + (str[i++]-'0');
	            if(result*indicator >= INT_MAX) return INT_MAX;
	            if(result*indicator <= INT_MIN) return INT_MIN;                
	        }
	        return result*indicator;
	    }
	}
};
```


---

- [prev: 007. Reverse Integer](007-reverse-integer.md)
- [next: 009. Palindrome Number](009-palindrome-number.md)
