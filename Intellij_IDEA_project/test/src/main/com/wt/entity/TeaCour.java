package wt.entity;

public class TeaCour {
    private String tid;//教师编号
    private String tname;//教师姓名
    private String cno;//课程编号
    private String cname;//课程名称
    private double credit;//学分
    private double avscore;//平均分
    private double maxscore;//最高分
    private double minscore;//最低分
    private int cteachno;//教学班号
    private String clocation;//上课教室
    private String ctime;//上课时间
    private int cmax;//课程容量
    private int csel;//已选人数

    public String getTid() {
        return tid;
    }

    public void setTid(String tid) {
        this.tid = tid;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
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

    public double getCredit() {
        return credit;
    }

    public void setCredit(double credit) {
        this.credit = credit;
    }

    public double getAvscore() {
        return avscore;
    }

    public void setAvscore(double avscore) {
        this.avscore = avscore;
    }

    public double getMaxscore() {
        return maxscore;
    }

    public void setMaxscore(double maxscore) {
        this.maxscore = maxscore;
    }

    public double getMinscore() {
        return minscore;
    }

    public void setMinscore(double minscore) {
        this.minscore = minscore;
    }

    public int getCteachno() {
        return cteachno;
    }

    public void setCteachno(int cteachno) {
        this.cteachno = cteachno;
    }

    public String getClocation() {
        return clocation;
    }

    public void setClocation(String clocation) {
        this.clocation = clocation;
    }

    public String getCtime() {
        return ctime;
    }

    public void setCtime(String ctime) {
        this.ctime = ctime;
    }

    public int getCmax() {
        return cmax;
    }

    public void setCmax(int cmax) {
        this.cmax = cmax;
    }

    public int getCsel() {
        return csel;
    }

    public void setCsel(int csel) {
        this.csel = csel;
    }

}
