# 关于TopN的实现
## 数据结构 


> 为实现TopN,数据结构采用 最小堆(完全二叉树) 
> 原理如图 

![ 完全二叉树变换过程](https://pic1.zhimg.com/80/v2-9305a490e3b136e12dc633083ab8e4e8_1440w.webp)
> 实现过程参考`topN_test.go`文件的 miniHeaptest 函数
```go
// 使得每次操作完毕 堆顶的元素就是最小的，由于堆的特性，我们只需要从倒数第二层开始就可以了
func miniHeaptest(nums []int) {
	length := len(nums)
	floor := length/2 - 1
	for i := floor; i >= 0; i-- {
		// 然后比较的每一个节点与其两个孩子节点的大小，使得爸爸永远是最小的
		// 有一种特殊情况，就是最后一个节点的孩子节点可能不存在，和可能只有一个，所以需要加上一个判断
		baba := i
		left := 2*i + 1
		right := 2*i + 2

		if right < length && nums[baba] > nums[right] {
			nums[baba], nums[right] = nums[right], nums[baba]
		}

		if left < length && nums[baba] > nums[left] {
			nums[baba], nums[left] = nums[left], nums[baba]
		}

		//if left < length && right < length && nums[left] > nums[right]{
		//	nums[left], nums[right] = nums[right], nums[left]
		//}
	}
}

```