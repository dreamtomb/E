import requests
res=requests.get("http://www.itcast.cn")
savefile=open("E://vim_project/itcast.html","w")
savefile.write(res.content)
savefile.close()

