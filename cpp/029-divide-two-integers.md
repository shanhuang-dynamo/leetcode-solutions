[029. Divide Two Integers](https://leetcode.com/problems/divide-two-integers/)

[![java]](../java/029-divide-two-integers.md)
[![cpp]](../cpp/029-divide-two-integers.md)
[![c]](../c/029-divide-two-integers.md)
[![csharp]](../csharp/029-divide-two-integers.md)
[![ruby]](../ruby/029-divide-two-integers.md)
[![python]](../python/029-divide-two-integers.md)
[![js]](../js/029-divide-two-integers.md)
[java]: ../images/java-logo.png
[cpp]: ../images/cpp-logo.png
[c]: ../images/c-logo.png
[csharp]: ../images/csharp-logo.png
[ruby]: ../images/ruby-logo.png
[python]: ../images/python-logo.png
[js]: ../images/js-logo.png

- [prev: 028. Implement strStr()](028-implement-strstr.md)
- [next: 030. Substring with Concatenation of All Words](030-substring-with-concatenation-of-all-words.md)

---
Divide two integers without using multiplication, division and mod operator.
If it is overflow, return MAX_INT.

```C++
//Time:
//Beat:8.31%
//Runtime:12ms
class Solution {
public:
    int divide(int dividend, int divisor) {
        if (dividend == -2147483648 && divisor == -1)
        {
            //change these two number to positive will overflow
        	return 2147483647;
        }
        static long long int array[40];
        // change number to positive
        long long a = llabs((long long)dividend);
        long long b = llabs((long long)divisor);
        int ret = 0;
        long long sum = 0;
        int i = -1;

        //equal to b*2^i
        while(b <= a)
        {
            array[++i] = b;
            b <<= 1;
        }

        for(int j = i; j >= 0; j--)
        {
            if(sum+array[j] > a)
            {
                continue;
            }
            else
            {
                sum += array[j];
                ret += pow(2, j);
            }
        }
        
        if((dividend < 0 && divisor > 0) || (dividend > 0 && divisor < 0))
        {
            return -ret;
        }
        else
        {
            return ret;
        }
    }
};
```


---

- [prev: 028. Implement strStr()](028-implement-strstr.md)
- [next: 030. Substring with Concatenation of All Words](030-substring-with-concatenation-of-all-words.md)
