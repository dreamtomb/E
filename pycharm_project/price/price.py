#! F://pycharm_project
# encoding: utf-8
'''
@author: dreamtomb
@license: (C) Copyright 2013-2017, Node Supply Chain Manager Corporation Limited.
@contact: 171395837@qq.com
@software: garner
@file: price.py
@time: 2017/3/10 20:14
@desc:
'''

from urllib import parse, request
from bs4 import BeautifulSoup as BS
from multiprocessing import Pool
import re
import lxml
import datetime
import cProfile
import socket
import copy
import xlsxwriter


starttime = datetime.datetime.now()

base_url = r'http://bj.fangjia.com/ershoufang/'


test_search_dict = {'昌平': {'霍营': {'13号线': 'http://bj.fangjia.com/ershoufang/--r-%E6%98%8C%E5%B9%B3|w-13%E5%8F%B7%E7%BA%BF|b-%E9%9C%8D%E8%90%A5'}}}

search_list = []  # 房源信息url列表
tmp_list = []  # 房源信息url缓存列表
layer = -1


# 获取列表页面
def get_page(url):
    headers = {
        'User-Agent': r'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) '
                      r'Chrome/45.0.2454.85 Safari/537.36 115Browser/6.0.3',
        'Referer': r'http://bj.fangjia.com/ershoufang/',
        'Host': r'bj.fangjia.com',
        'Connection': 'keep-alive'
    }
    timeout = 60
    socket.setdefaulttimeout(timeout)  # 设置超时
    req = request.Request(url, headers=headers)
    response = request.urlopen(req).read()
    page = response.decode('utf-8')
    return page


# 获取查询关键词dict
def get_search(page, key):
    soup = BS(page, 'lxml')
    search_list = soup.find_all(href=re.compile(key), target='')
    search_dict = {}
    for i in range(len(search_list)):
        soup = BS(str(search_list[i]), 'lxml')
        key = soup.select('a')[0].get_text()
        value = soup.a.attrs['href']
        search_dict[key] = value
    return search_dict


# 获取房源信息列表(嵌套字典遍历)
def get_info_list(search_dict, layer, tmp_list, search_list):
    layer += 1  # 设置字典层级
    for i in range(len(search_dict)):
        tmp_key = list(search_dict.keys())[i]  # 提取当前字典层级key
        tmp_list.append(tmp_key)   # 将当前key值作为索引添加至tmp_list
        tmp_value = search_dict[tmp_key]
        if isinstance(tmp_value, str):   # 当键值为url时
            tmp_list.append(tmp_value)   # 将url添加至tmp_list
            search_list.append(copy.deepcopy(tmp_list))   # 将tmp_list索引url添加至search_list
            tmp_list = tmp_list[:layer]  # 根据层级保留索引
        elif tmp_value == '':   # 键值为空时跳过
            layer -= 2           # 跳出键值层级
            tmp_list = tmp_list[:layer]   # 根据层级保留索引
        else:
            get_info_list(tmp_value, layer, tmp_list, search_list)  # 当键值为列表时，迭代遍历
            tmp_list = tmp_list[:layer]
    return search_list


# 获取房源信息详情
def get_info_pn_list(search_list):
    fin_search_list = []
    for i in range(len(search_list)):
        print('>>>正在抓取%s' % search_list[i][:3])
        search_url = search_list[i][3]
        try:
            page = get_page(search_url)
        except:
            print('获取页面超时')
            continue
        soup = BS(page, 'lxml')
        # 获取最大页数
        pn_num = soup.select('span[class="mr5"]')[0].get_text()
        rule = re.compile(r'\d+')
        max_pn = int(rule.findall(pn_num)[1])
        # 组装url
        for pn in range(1, max_pn+1):
            print('************************正在抓取%s页************************' % pn)
            pn_rule = re.compile('[|]')
            fin_url = pn_rule.sub(r'|e-%s|' % pn, search_url, 1)
            tmp_url_list = copy.deepcopy(search_list[i][:3])
            tmp_url_list.append(fin_url)
            fin_search_list.append(tmp_url_list)
    return fin_search_list


# 获取tag信息
def get_info(fin_search_list, process_i):
    print('进程%s开始' % process_i)
    fin_info_list = []
    for i in range(len(fin_search_list)):
        url = fin_search_list[i][3]
        try:
            page = get_page(url)
        except:
            print('获取tag超时')
            continue
        soup = BS(page, 'lxml')
        title_list = soup.select('a[class="h_name"]')
        address_list = soup.select('span[class="address]')
        attr_list = soup.select('span[class="attribute"]')
        price_list = soup.find_all(attrs={"class": "xq_aprice xq_esf_width"})  # select对于某些属性值（属性值中间包含空格）无法识别，可以用find_all(attrs={})代替
        for num in range(20):
            tag_tmp_list = []
            try:
                title = title_list[num].attrs["title"]
                print(r'************************正在获取%s************************' % title)
                address = re.sub('\n', '', address_list[num].get_text())
                area = re.search('\d+[\u4E00-\u9FA5]{2}', attr_list[num].get_text()).group(0)
                layout = re.search('\d[^0-9]\d.', attr_list[num].get_text()).group(0)
                floor = re.search('\d/\d', attr_list[num].get_text()).group(0)
                price = re.search('\d+[\u4E00-\u9FA5]', price_list[num].get_text()).group(0)
                unit_price = re.search('\d+[\u4E00-\u9FA5]/.', price_list[num].get_text()).group(0)
                tag_tmp_list = copy.deepcopy(fin_search_list[i][:3])
                for tag in [title, address, area, layout, floor, price, unit_price]:
                    tag_tmp_list.append(tag)
                fin_info_list.append(tag_tmp_list)
            except:
                print('【抓取失败】')
                continue
    print('进程%s结束' % process_i)
    return fin_info_list


# 分配任务
def assignment_search_list(fin_search_list, project_num):  # project_num每个进程包含的任务数，数值越小，进程数越多
    assignment_list = []
    fin_search_list_len = len(fin_search_list)
    for i in range(0, fin_search_list_len, project_num):
        start = i
        end = i+project_num
        assignment_list.append(fin_search_list[start: end])  # 获取列表碎片
    return assignment_list


# 存储抓取结果
def save_excel(fin_info_list, file_name):
    tag_name = ['区域', '板块', '地铁', '标题', '位置', '平米', '户型', '楼层', '总价', '单位平米价格']
    book = xlsxwriter.Workbook(r'C:\Users\Administrator\Desktop\%s.xls' % file_name)  # 默认存储在桌面上
    tmp = book.add_worksheet()
    row_num = len(fin_info_list)
    for i in range(1, row_num):
        if i == 1:
            tag_pos = 'A%s' % i
            tmp.write_row(tag_pos, tag_name)
        else:
            con_pos = 'A%s' % i
            content = fin_info_list[i-1]  # -1是因为被表格的表头所占
            tmp.write_row(con_pos, content)
    book.close()


if __name__ == '__main__':
    file_name = input(r'抓取完成，输入文件名保存：')
    fin_save_list = []  # 抓取信息存储列表
    # 一级筛选
    page = get_page(base_url)
    search_dict = get_search(page, 'r-')
    # 二级筛选
    for k in search_dict:
        print(r'************************一级抓取：正在抓取【%s】************************' % k)
        url = search_dict[k]
        second_page = get_page(url)
        second_search_dict = get_search(second_page, 'b-')
        search_dict[k] = second_search_dict
    # 三级筛选
    for k in search_dict:
        second_dict = search_dict[k]
        for s_k in second_dict:
            print(r'************************二级抓取：正在抓取【%s】************************' % s_k)
            url = second_dict[s_k]
            third_page = get_page(url)
            third_search_dict = get_search(third_page, 'w-')
            print('%s>%s' % (k, s_k))
            second_dict[s_k] = third_search_dict
    fin_info_list = get_info_list(search_dict, layer, tmp_list, search_list)
    fin_info_pn_list = get_info_pn_list(fin_info_list)
    p = Pool(4)  # 设置进程池
    assignment_list = assignment_search_list(fin_info_pn_list, 2)  # 分配任务，用于多进程
    result = []  # 多进程结果列表
    for i in range(len(assignment_list)):
        result.append(p.apply_async(get_info, args=(assignment_list[i], i)))
    p.close()
    p.join()
    for result_i in range(len(result)):
        fin_info_result_list = result[result_i].get()
        fin_save_list.extend(fin_info_result_list)  # 将各个进程获得的列表合并
    save_excel(fin_save_list, file_name)
    endtime = datetime.datetime.now()
    time = (endtime - starttime).seconds
    print('总共用时：%s s' % time)