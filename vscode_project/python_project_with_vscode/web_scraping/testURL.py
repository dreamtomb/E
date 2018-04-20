import builtwith
import whois
from urllib import request


# 定义一个函数download来下载网页
def download(url):
    print('downloading:', url)
    response = request.urlopen(url)
    html = response.read()
    print(html)


dict = builtwith.parse('http://example.webscraping.com')  # 返回网站所使用的技术
print(dict)
print(whois.whois('appspot.com'))  # 返回网站的所有者
download("http://www.baidu.com")
