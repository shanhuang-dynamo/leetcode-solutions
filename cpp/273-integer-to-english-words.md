[273. Integer to English Words](https://leetcode.com/problems/integer-to-english-words/)

[![java]](../java/273-integer-to-english-words.md)
[![cpp]](../cpp/273-integer-to-english-words.md)
[![c]](../c/273-integer-to-english-words.md)
[![csharp]](../csharp/273-integer-to-english-words.md)
[![ruby]](../ruby/273-integer-to-english-words.md)
[![python]](../python/273-integer-to-english-words.md)
[![js]](../js/273-integer-to-english-words.md)
[java]: ../images/java-logo.png
[cpp]: ../images/cpp-logo.png
[c]: ../images/c-logo.png
[csharp]: ../images/csharp-logo.png
[ruby]: ../images/ruby-logo.png
[python]: ../images/python-logo.png
[js]: ../images/js-logo.png

- [prev: 272. Closest Binary Search Tree Value II](272-closest-binary-search-tree-value-ii.md)
- [next: 274. H-Index](274-h-index.md)

---
```C++
//Time:
//Beat:23.38%
//Runtime:8ms
//Solution: A concise but stupid solution.
class Solution {
public:
	string digits[20] = {"Zero", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen"};
    string tens[10] = {"Zero", "Ten", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"};

    string inttostring(int n)
    {
    	if(n >= 1000000000)
    	{
    		return inttostring(n/1000000000) + " Billion" + inttostring(n%1000000000);
    	}
    	else if(n >= 1000000)
    	{
    		return inttostring(n/1000000) + " Million" + inttostring(n%1000000);
    	}
    	else if(n >= 1000)
    	{
    		return inttostring(n/1000) + " Thousand" + inttostring(n%1000);
    	}
    	else if (n >= 100)
    	{
    		return inttostring(n/100) + " Hundred" + inttostring(n%100);
    	}
    	else if (n >= 20)
    	{
    		return " " + tens[n/10] + inttostring(n%10);
    	}
    	else if (n >= 1)
    	{
    		return " " + digits[n];
    	}
    	else
    	{
    		return "";
    	}
    }

    string numberToWords(int num) {
        string res;
        if(num == 0)
        	return "Zero";
        else
        {
        	res = inttostring(num);
        	return res.substr(1,res.length() -1);
        }
    }
};
```


---

- [prev: 272. Closest Binary Search Tree Value II](272-closest-binary-search-tree-value-ii.md)
- [next: 274. H-Index](274-h-index.md)
