[134. Gas Station](https://leetcode.com/problems/gas-station/)

[![java]](../java/134-gas-station.md)
[![cpp]](../cpp/134-gas-station.md)
[![c]](../c/134-gas-station.md)
[![csharp]](../csharp/134-gas-station.md)
[![ruby]](../ruby/134-gas-station.md)
[![python]](../python/134-gas-station.md)
[![js]](../js/134-gas-station.md)
[java]: ../images/java-logo.png
[cpp]: ../images/cpp-logo.png
[c]: ../images/c-logo.png
[csharp]: ../images/csharp-logo.png
[ruby]: ../images/ruby-logo.png
[python]: ../images/python-logo.png
[js]: ../images/js-logo.png

- [prev: 133. Clone Graph](133-clone-graph.md)
- [next: 135. Candy](135-candy.md)

---
There are N gas stations along a circular route, where the amount of gas at station i is gas[i].
You have a car with an unlimited gas tank and it costs cost[i] of gas to travel from station i to its next station (i+1). You begin the journey with an empty tank at one of the gas stations.
Return the starting gas station's index if you can travel around the circuit once, otherwise return -1.

```C++
//Time:O(n^2)
//Beat:7.09%
//Runtime:8ms
//Solution: Classic Greedy Algorithm. Double for loop, the first for loop represents the start point i, 
//the second for loop represents the from i to j
//(here j denotes the arrival point, range from i+1 to the point right before i).

class Solution {
public:
    int canCompleteCircuit(vector<int>& gas, vector<int>& cost) {
        int j;
        for (int i = 0; i < gas.size(); i+=j)
        {
        	int left = 0;
        	for(j = 1; j <= gas.size(); ++j)
        	{
        		int k = (i+j-1) % gas.size();
        		left = left + gas[k] - cost[k];
        		if(left < 0)
        			break;
        	}
        	if(j > gas.size())
        		return i;
        }
        return -1;
    }
};
```


---

- [prev: 133. Clone Graph](133-clone-graph.md)
- [next: 135. Candy](135-candy.md)
