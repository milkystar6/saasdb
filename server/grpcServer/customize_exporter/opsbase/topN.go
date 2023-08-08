package opsbase

func heapsort(nums []int64) []int64 {
	length := len(nums)
	if length == 0 {
		return nil
	}
	for i := 0; i < length; i++ {
		// 第一下 使得第一个元素最小，接下来就从第二个来构造，使得下一个最小，
		miniHeap(nums[i:])
	}
	return nums
}

// 使得每次操作完毕 堆顶的元素就是最小的，由于堆的特性，我们只需要从倒数第二层开始就可以了
func miniHeap(nums []int64) {
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

// TopN ncr No calculation required
func TopN(bigData []int64, n int) (r []int64, ncr bool) {
	// 如果 bigData本身的长度小于topN 直接返回
	if len(bigData) <= n {
		return bigData, true
	}
	// topN 先取得前0 -> N-1个原始切片的值
	startNums := bigData[:n]
	// 通过最小堆算法, 整理startNums
	miniHeap(startNums)
	// 从N开始 继续载入后续切片
	for _, data := range bigData[10:] {
		if data <= startNums[0] {
			continue
		} else {
			startNums[0] = data
			miniHeap(startNums)
		}
	}
	return heapsort(startNums), false
}
