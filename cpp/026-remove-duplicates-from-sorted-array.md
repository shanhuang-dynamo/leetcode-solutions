[026. Remove Duplicates from Sorted Array](https://leetcode.com/problems/remove-duplicates-from-sorted-array/)

[![java]](../java/026-remove-duplicates-from-sorted-array.md)
[![cpp]](../cpp/026-remove-duplicates-from-sorted-array.md)
[![c]](../c/026-remove-duplicates-from-sorted-array.md)
[![csharp]](../csharp/026-remove-duplicates-from-sorted-array.md)
[![ruby]](../ruby/026-remove-duplicates-from-sorted-array.md)
[![python]](../python/026-remove-duplicates-from-sorted-array.md)
[![js]](../js/026-remove-duplicates-from-sorted-array.md)
[java]: ../images/java-logo.png
[cpp]: ../images/cpp-logo.png
[c]: ../images/c-logo.png
[csharp]: ../images/csharp-logo.png
[ruby]: ../images/ruby-logo.png
[python]: ../images/python-logo.png
[js]: ../images/js-logo.png

- [prev: 025. Reverse Nodes in k-Group](025-reverse-nodes-in-k-group.md)
- [next: 027. Remove Element](027-remove-element.md)

---
```C++
//My second solution
//Time:O(n)
//Beat:42.70%
//Runtime:32ms
class Solution {
public:
    int removeDuplicates(vector<int>& nums) {
        int count = 0;
        for (int i = 0; i < nums.size(); ++i)
        {
        	if(count < 1 || nums[i] > nums[count - 1])
        	{
        		nums[count] = nums[i];
        		count++;
        	}	

        }
        return count;
    }
};
```

```C++
//Time:O(n)
//Beat:42.70%
//Runtime:32ms
class Solution {
public:
    int removeDuplicates(vector<int>& nums) {
    	if(nums.size() == 0)
    	{
    		return 0;
    	}    
    	int len = 0;
    	for (int i = 1; i < nums.size(); ++i)
    	{
    		if(nums[i] != nums[len])
    		{
    		    len++;
    			nums[len] = nums[i];
    		}
    	}
    	return len+1;
    }
};
```


---

- [prev: 025. Reverse Nodes in k-Group](025-reverse-nodes-in-k-group.md)
- [next: 027. Remove Element](027-remove-element.md)
