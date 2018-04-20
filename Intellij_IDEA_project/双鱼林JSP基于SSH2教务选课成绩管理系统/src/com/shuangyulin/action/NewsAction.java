package com.shuangyulin.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;
import org.apache.struts2.ServletActionContext;
import java.util.List;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.shuangyulin.dao.NewsDAO;
import com.shuangyulin.domain.News;
import com.shuangyulin.test.TestUtil;

public class NewsAction extends ActionSupport {

/*图片字段newsPhoto参数接收*/
	 private File newsPhotoFile;
	 private String newsPhotoFileFileName;
	 private String newsPhotoFileContentType;
	 public File getNewsPhotoFile() {
		return newsPhotoFile;
	}
	public void setNewsPhotoFile(File newsPhotoFile) {
		this.newsPhotoFile = newsPhotoFile;
	}
	public String getNewsPhotoFileFileName() {
		return newsPhotoFileFileName;
	}
	public void setNewsPhotoFileFileName(String newsPhotoFileFileName) {
		this.newsPhotoFileFileName = newsPhotoFileFileName;
	}
	public String getNewsPhotoFileContentType() {
		return newsPhotoFileContentType;
	}
	public void setNewsPhotoFileContentType(String newsPhotoFileContentType) {
		this.newsPhotoFileContentType = newsPhotoFileContentType;
	}
    /*界面层需要查询的属性: 新闻标题*/
    private String newsTitle;
    public void setNewsTitle(String newsTitle) {
        this.newsTitle = newsTitle;
    }
    public String getNewsTitle() {
        return this.newsTitle;
    }

    /*界面层需要查询的属性: 发布日期*/
    private String newsDate;
    public void setNewsDate(String newsDate) {
        this.newsDate = newsDate;
    }
    public String getNewsDate() {
        return this.newsDate;
    }

    /*当前第几页*/
    private int currentPage;
    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }
    public int getCurrentPage() {
        return currentPage;
    }

    /*一共多少页*/
    private int totalPage;
    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }
    public int getTotalPage() {
        return totalPage;
    }

    private int newsId;
    public void setNewsId(int newsId) {
        this.newsId = newsId;
    }
    public int getNewsId() {
        return newsId;
    }

    /*当前查询的总记录数目*/
    private int recordNumber;
    public void setRecordNumber(int recordNumber) {
        this.recordNumber = recordNumber;
    }
    public int getRecordNumber() {
        return recordNumber;
    }

    /*业务层对象*/
    NewsDAO newsDAO = new NewsDAO();

    /*待操作的News对象*/
    private News news;
    public void setNews(News news) {
        this.news = news;
    }
    public News getNews() {
        return this.news;
    }

    /*跳转到添加News视图*/
    public String AddView() {
        ActionContext ctx = ActionContext.getContext();
        return "add_view";
    }

    /*添加News信息*/
    @SuppressWarnings("deprecation")
    public String AddNews() {
        ActionContext ctx = ActionContext.getContext();
        try {
            String path = ServletActionContext.getServletContext().getRealPath("/upload"); 
            /*处理图片上传*/
            String newsPhotoFileName = ""; 
       	 	if(newsPhotoFile != null) {
       	 		InputStream is = new FileInputStream(newsPhotoFile);
       			String fileContentType = this.getNewsPhotoFileContentType();
       			if(fileContentType.equals("image/jpeg")  || fileContentType.equals("image/pjpeg"))
       				newsPhotoFileName = UUID.randomUUID().toString() +  ".jpg";
       			else if(fileContentType.equals("image/gif"))
       				newsPhotoFileName = UUID.randomUUID().toString() +  ".gif";
       			else {
       				ctx.put("error",  java.net.URLEncoder.encode("上传图片格式不正确!"));
       				return "error";
       			}
       			File file = new File(path, newsPhotoFileName);
       			OutputStream os = new FileOutputStream(file);
       			byte[] b = new byte[1024];
       			int bs = 0;
       			while ((bs = is.read(b)) > 0) {
       				os.write(b, 0, bs);
       			}
       			is.close();
       			os.close();
       	 	}
            if(newsPhotoFile != null)
            	news.setNewsPhoto("upload/" + newsPhotoFileName);
            else
            	news.setNewsPhoto("upload/NoImage.jpg");
            newsDAO.AddNews(news);
            ctx.put("message",  java.net.URLEncoder.encode("News添加成功!"));
            return "add_success";
        } catch (Exception e) {
            e.printStackTrace();
            ctx.put("error",  java.net.URLEncoder.encode("News添加失败!"));
            return "error";
        }
    }

    /*查询News信息*/
    public String QueryNews() {
        if(currentPage == 0) currentPage = 1;
        if(newsTitle == null) newsTitle = "";
        if(newsDate == null) newsDate = "";
        List<News> newsList = newsDAO.QueryNewsInfo(newsTitle, newsDate, currentPage);
        /*计算总的页数和总的记录数*/
        newsDAO.CalculateTotalPageAndRecordNumber(newsTitle, newsDate);
        /*获取到总的页码数目*/
        totalPage = newsDAO.getTotalPage();
        /*当前查询条件下总记录数*/
        recordNumber = newsDAO.getRecordNumber();
        ActionContext ctx = ActionContext.getContext();
        ctx.put("newsList",  newsList);
        ctx.put("totalPage", totalPage);
        ctx.put("recordNumber", recordNumber);
        ctx.put("currentPage", currentPage);
        ctx.put("newsTitle", newsTitle);
        ctx.put("newsDate", newsDate);
        return "query_view";
    }

    /*前台查询News信息*/
    public String FrontQueryNews() {
        if(currentPage == 0) currentPage = 1;
        if(newsTitle == null) newsTitle = "";
        if(newsDate == null) newsDate = "";
        List<News> newsList = newsDAO.QueryNewsInfo(newsTitle, newsDate, currentPage);
        /*计算总的页数和总的记录数*/
        newsDAO.CalculateTotalPageAndRecordNumber(newsTitle, newsDate);
        /*获取到总的页码数目*/
        totalPage = newsDAO.getTotalPage();
        /*当前查询条件下总记录数*/
        recordNumber = newsDAO.getRecordNumber();
        ActionContext ctx = ActionContext.getContext();
        ctx.put("newsList",  newsList);
        ctx.put("totalPage", totalPage);
        ctx.put("recordNumber", recordNumber);
        ctx.put("currentPage", currentPage);
        ctx.put("newsTitle", newsTitle);
        ctx.put("newsDate", newsDate);
        return "front_query_view";
    }

    /*查询要修改的News信息*/
    public String ModifyNewsQuery() {
        ActionContext ctx = ActionContext.getContext();
        /*根据主键newsId获取News对象*/
        News news = newsDAO.GetNewsByNewsId(newsId);

        ctx.put("news",  news);
        return "modify_view";
    }

    /*查询要修改的News信息*/
    public String FrontShowNewsQuery() {
        ActionContext ctx = ActionContext.getContext();
        /*根据主键newsId获取News对象*/
        News news = newsDAO.GetNewsByNewsId(newsId);

        ctx.put("news",  news);
        return "front_show_view";
    }

    /*更新修改News信息*/
    public String ModifyNews() {
        ActionContext ctx = ActionContext.getContext();
        try {
            String path = ServletActionContext.getServletContext().getRealPath("/upload"); 
            /*处理图片上传*/
            String newsPhotoFileName = ""; 
       	 	if(newsPhotoFile != null) {
       	 		InputStream is = new FileInputStream(newsPhotoFile);
       			String fileContentType = this.getNewsPhotoFileContentType();
       			if(fileContentType.equals("image/jpeg") || fileContentType.equals("image/pjpeg"))
       				newsPhotoFileName = UUID.randomUUID().toString() +  ".jpg";
       			else if(fileContentType.equals("image/gif"))
       				newsPhotoFileName = UUID.randomUUID().toString() +  ".gif";
       			else {
       				ctx.put("error",  java.net.URLEncoder.encode("上传图片格式不正确!"));
       				return "error";
       			}
       			File file = new File(path, newsPhotoFileName);
       			OutputStream os = new FileOutputStream(file);
       			byte[] b = new byte[1024];
       			int bs = 0;
       			while ((bs = is.read(b)) > 0) {
       				os.write(b, 0, bs);
       			}
       			is.close();
       			os.close();
            news.setNewsPhoto("upload/" + newsPhotoFileName);
       	 	}
            newsDAO.UpdateNews(news);
            ctx.put("message",  java.net.URLEncoder.encode("News信息更新成功!"));
            return "modify_success";
        } catch (Exception e) {
            e.printStackTrace();
            ctx.put("error",  java.net.URLEncoder.encode("News信息更新失败!"));
            return "error";
       }
   }

    /*删除News信息*/
    public String DeleteNews() {
        ActionContext ctx = ActionContext.getContext();
        try { 
            newsDAO.DeleteNews(newsId);
            ctx.put("message",  java.net.URLEncoder.encode("News删除成功!"));
            return "delete_success";
        } catch (Exception e) { 
            e.printStackTrace();
            ctx.put("error",  java.net.URLEncoder.encode("News删除失败!"));
            return "error";
        }
    }

}
