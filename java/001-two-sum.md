[001. Two Sum](https://leetcode.com/problems/two-sum/)

[![java]](../java/001-two-sum.md)
[![cpp]](../cpp/001-two-sum.md)
[![c]](../c/001-two-sum.md)
[![csharp]](../csharp/001-two-sum.md)
[![ruby]](../ruby/001-two-sum.md)
[![python]](../python/001-two-sum.md)
[![js]](../js/001-two-sum.md)
[java]: ../images/java-logo.png
[cpp]: ../images/cpp-logo.png
[c]: ../images/c-logo.png
[csharp]: ../images/csharp-logo.png
[ruby]: ../images/ruby-logo.png
[python]: ../images/python-logo.png
[js]: ../images/js-logo.png

- prev: none
- [next: 002. Add Two Numbers](002-add-two-numbers.md)

---

## naive solution
```c++
// Time: O(n^2)
// Space: O(1)
class Solution {
public:
    vector<int> twoSum(vector<int>& nums, int target) {
        const auto size = nums.size();
        for (int i = 0; i < size - 1; i++) {
            for (int j = i + 1; j < size; j++) {
                if (nums[i] + nums[j] == target) {
                    return vector<int> {i + 1, j + 1};
                }
            }
        }
    }
};
```

## O(n) solution
To decrease the time complexity, could store previous info for further query. Here we could use element's `value` as `index`.
But using array as collection is impractical, just use a Hashmap.

```java
import java.util.HashMap;

// Time: O(n)
// Space: O(n)
// Runtime: 5ms
public class Solution {
    public int[] twoSum(int[] nums, int target) {
        HashMap<Integer, Integer> indices = new HashMap<>(nums.length);
        for (int i = 0; i < nums.length; i++) {
            int value = nums[i];
            int complement = target - value;
            if (indices.containsKey(complement)) {
                return new int[] {indices.get(complement), i+1};
            } else {
                indices.put(value, i+1);
            }
        }
        return null;
    }
}
```

P.S. Using array in Java could beat 99.9% at runtime. But to make it theorically correct u have at least allocate `INT_SIZE`
for the array. And it's not a good practice in engineering.


---

- prev: none
- [next: 002. Add Two Numbers](002-add-two-numbers.md)
