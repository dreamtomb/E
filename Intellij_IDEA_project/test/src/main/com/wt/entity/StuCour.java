package wt.entity;

public class StuCour {
    private String sid;//学生编号
    private String sname;//学生姓名
    private String cno;//课程编号
    private String cname;//课程名称
    private String tid;//教师编号
    private double credit;//学分
    private double pscore;//平时成绩
    private double lscore;//期末成绩
    private double escore;//最终成绩
    private double scorejd;//学年成绩
    private int mc;

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getCno() {
        return cno;
    }

    public void setCno(String cno) {
        this.cno = cno;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getTid() {
        return tid;
    }

    public void setTid(String tid) {
        this.tid = tid;
    }

    public double getCredit() {
        return credit;
    }

    public void setCredit(double credit) {
        this.credit = credit;
    }

    public double getPscore() {
        return pscore;
    }

    public void setPscore(double pscore) {
        this.pscore = pscore;
    }

    public double getLscore() {
        return lscore;
    }

    public void setLscore(double lscore) {
        this.lscore = lscore;
    }

    public double getEscore() {
        return escore;
    }

    public void setEscore(double escore) {
        this.escore = escore;
    }

    public double getScorejd() {
        return scorejd;
    }

    public void setScorejd(double scorejd) {
        this.scorejd = scorejd;
    }

    public int getMc() {
        return mc;
    }

    public void setMc(int mc) {
        this.mc = mc;
    }

}
