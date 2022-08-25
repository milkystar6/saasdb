package model

import (
	"fmt"
	"github.com/google/uuid"
	"gorm.io/gorm"
)

func CreateBackLog(db *gorm.DB, backlog *BackLog) error {
	return db.Debug().Create(&backlog).Error
}

// func UpdateBackLogByUuid update the backlog table by uuid
func UpdateBackLogByUuid(db *gorm.DB, uuid uuid.UUID, setvars map[string]interface{}) {
	db.Debug().Model(&BackLog{}).Where("back_up_uuid = ?", uuid).Updates(setvars)
}

// func UpdateBackLogJsonByUuid update the backlog use native sql
// 入参说明: UUID:根据UUID来确定唯一的一条日志记录
//         extra:这个参数用来实现 json字段的更新,如果传入的json字段key个数不确定的话，可以通过这种方式方便的组装成sql语句
//         当然,set的内容跟where的内容我们也可以通过map[string]interface的方式来做，并适当断言类型，不过这里这样写就够了
func UpdateBackLogJsonByUuid(db *gorm.DB, uuid uuid.UUID, status string, size int64, extra map[string]interface{}) {
	_prefix := "UPDATE saas_back_log SET "
	_updates := fmt.Sprintf("data_size=%v,status=\"%v\",finished_at=NOW()", size, status)
	_jsonFiled := " "

	if len(extra) > 0 {
		_jsonFiled = ",back_up_feature=JSON_SET(back_up_feature,"
		i := 1
		for key, value := range extra {
			if i < len(extra) {
				_jsonFiled = _jsonFiled + fmt.Sprintf("\"$.%v\",\"%v\",", key, value)
			} else {
				_jsonFiled = _jsonFiled + fmt.Sprintf("\"$.%v\",\"%v\"", key, value)
			}
			i++
		}
		_jsonFiled = _jsonFiled + fmt.Sprintf(") ")
	}
	_where := fmt.Sprintf("WHERE back_up_uuid = \"%v\"", uuid)
	sql := _prefix + _updates + _jsonFiled + _where
	db.Debug().Model(&BackLog{}).Exec(sql)
}
