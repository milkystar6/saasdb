package schedule

import (
	"fmt"
	"strconv"
	"testing"
	"time"
)

func TestWeekdays(t *testing.T) {
	// 定义每周一和每周三
	monday := time.Monday
	wednesday := time.Wednesday

	// 测试每周一是否正确
	if monday.String() != "Monday" {
		t.Errorf("Unexpected weekday: %v", monday)
	}

	// 测试每周三是否正确
	if wednesday.String() != "Wednesday" {
		t.Errorf("Unexpected weekday: %v", wednesday)
	}
	fmt.Println(fmt.Sprintf(strconv.Itoa(int(monday))))
}
