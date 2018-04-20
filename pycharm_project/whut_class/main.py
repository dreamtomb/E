import urllib.request
import urllib.parse
import http.cookiejar
import time
import re


url = "http://sso.jwc.whut.edu.cn/Certification//login.do"
user = input("Username: ")
password = input("Password: ")

# 表单参数
params = {
    'systemId': '',
    'xmlmsg': '',
    'userName': user,
    'password': password,
    'type': 'xs',
    'imageField.x': '60',
    'imageField.y': '19'
}

# 处理 Cookie
cookie = http.cookiejar.CookieJar()
opener = urllib.request.build_opener(urllib.request.HTTPCookieProcessor(cookie))
opener.addheaders = [
    ('User-Agent', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:28.0) Gecko/20100101 Firefox/28.0'),
    ('Host', 'sso.jwc.whut.edu.cn'),
    ('Accept', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'),
    ('Referer', 'http://sso.jwc.whut.edu.cn/Certification/toLogin.do'),
    ('Connection', 'keep=alive')
]
data = urllib.parse.urlencode(params).encode()

# 打开教务处首页
response_index = opener.open(url, data)

# 打开成绩首页
response_score_index = opener.open("http://202.114.90.180/Score/")
text_score_index = response_score_index.read().decode()

# 正则表达式从成绩首页的 HTML 中获取 snkey 字段
# （这个字段很重要，如果省略掉会提示非法查询）
snkey = re.findall(r'snkey=([0-9a-z]{8}-(?:[0-9a-z]{4}-){3}[0-9a-z]{12})',
                   text_score_index, re.I)[0]

# 打开历史成绩页面
response_score_history = opener.open("http://202.114.90.180/Score/lscjList.do?snkey={snkey}&_={ts}"
                                     .format(snkey=snkey, ts=int(round(time.time() * 1000))))

# 显示 200 条记录
params_score = {
    'pageNum': '1',  # 当前页码
    'numPerPage': '200',  # 每页显示记录条数
    'xh': user,  # 学号
    'xn': '',  # 学年
    'xnxq': '',  # 学年学期
    'nj': '',
    'xydm': '',
    'zydm': '',
    'bjmc': '',
    'kcmc': '',
    'kcdm': '',
    'xslb': '',
    'kcxz': '',
    'jsxm': '',
    'snkey': snkey
}
show_200 = opener.open("http://202.114.90.180/Score/lscjList.do",
                       urllib.parse.urlencode(params_score).encode())
show_200_html = show_200.read().decode()
print(show_200_html)

# 学分、绩点、排名
credit_and_gpa = opener.open("http://202.114.90.180/Score/xftjList.do?_={ts}"
                             .format(ts=int(round(time.time() * 1000))))
print(credit_and_gpa.read().decode())