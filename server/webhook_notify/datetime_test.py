import unittest

from datetime import datetime, timezone

import pytz


class MyTestCase(unittest.TestCase):

    def test_something(self):
        start_time = '2023-06-01T09:21:31Z'
        end_time = '2023-06-01T09:21:31Z'
        # 创建 UTC 时区对象
        utc_tz = pytz.timezone('UTC')
        # 将 UTC 时间转换为北京时间
        beijing_tz = pytz.timezone('Asia/Shanghai')
        # 将字符串转换为datetime对象，并指定时区为UTC
        utc_time = datetime.strptime(start_time, '%Y-%m-%dT%H:%M:%SZ').replace(tzinfo=utc_tz)
        # 转换为北京时间
        beijing_time = utc_time.astimezone(beijing_tz)

        start_time_bg = datetime.strptime(start_time, '%Y-%m-%dT%H:%M:%SZ').replace(tzinfo=utc_tz).astimezone(
            beijing_tz)
        end_time_bg = datetime.strptime(end_time, '%Y-%m-%dT%H:%M:%SZ').replace(tzinfo=utc_tz).astimezone(beijing_tz)
        print(start_time_bg,end_time_bg)



if __name__ == '__main__':
    unittest.main()
