package wt.entity;

public class Student {

    private String sid;//学生编号
    private String sname;//学生姓名
    private String smajor;//专业
    private String sclass;//班级
    private double tcredit;//学分
    private double tcreditjd;//学年学分
    private double ocredit;//
    private double acredit;//
    private double egrade;//最终成绩
    private int majorpm;//专业排名
    private int classpm;//班级排名
    private String scode;//学生密码

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

    public String getSmajor() {
        return smajor;
    }

    public void setSmajor(String smajor) {
        this.smajor = smajor;
    }

    public String getSclass() {
        return sclass;
    }

    public void setSclass(String sclass) {
        this.sclass = sclass;
    }

    public double getTcredit() {
        return tcredit;
    }

    public void setTcredit(double tcredit) {
        this.tcredit = tcredit;
    }

    public double getAcredit() {
        return acredit;
    }

    public double getTcreditjd() {
        return tcreditjd;
    }

    public void setTcreditjd(double tcreditjd) {
        this.tcreditjd = tcreditjd;
    }

    public double getOcredit() {
        return ocredit;
    }

    public void setOcredit(double ocredit) {
        this.ocredit = ocredit;
    }

    public void setAcredit(double acredit) {
        this.acredit = acredit;
    }

    public double getEgrade() {
        return egrade;
    }

    public void setEgrade(double egrade) {
        this.egrade = egrade;
    }

    public int getMajorpm() {
        return majorpm;
    }

    public void setMajorpm(int majorpm) {
        this.majorpm = majorpm;
    }

    public int getClasspm() {
        return classpm;
    }

    public void setClasspm(int classpm) {
        this.classpm = classpm;
    }

    public String getScode() {
        return scode;
    }

    public void setScode(String scode) {
        this.scode = scode;
    }
}
