package model

const UnknowVariable string = "Unknow Variable "
const UnknowVersion string = "Unknow Version"

func (c *MyDB) GetVersion() (string, error) {
	sql := "SELECT VERSION()"

	version := ""
	if err := c.DB.Debug().Raw(sql).Scan(&version).Error; err != nil {
		return UnknowVersion, err
	}
	return version, nil

}

func (c *MyDB) GetDatadir() (string, error) {
	sql := "SHOW VARIABLES LIKE 'datadir'"
	type searchdatadir struct {
		Variable_name string `json:"variable_name,omitempty"`
		Value         string `json:"value,omitempty"`
	}
	var datadir searchdatadir
	if err := c.DB.Debug().Raw(sql).Scan(&datadir).Error; err != nil {
		return UnknowVariable, err
	}
	return datadir.Value, nil
}
