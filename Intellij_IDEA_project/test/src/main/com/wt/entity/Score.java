package wt.entity;

public class Score {
    private double avscore;//平均分
    private double tocredit;//
    private double toscorejd;//
    private double maxscore;//最高分
    private double minscore;//最低分

    public double getAvscore() {
        return avscore;
    }

    public void setAvscore(double avscore) {
        this.avscore = avscore;
    }

    public double getMaxscore() {
        return maxscore;
    }

    public double getTocredit() {
        return tocredit;
    }

    public void setTocredit(double tocredit) {
        this.tocredit = tocredit;
    }

    public double getToscorejd() {
        return toscorejd;
    }

    public void setToscorejd(double toscorejd) {
        this.toscorejd = toscorejd;
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

}
