package cn.mcb.pojo;

public class Customer {
    private int cid;
    private String cname;
    private int cage;
    private String cphone;
    private String cbirthday;
    private String ccreattime;
    private String caddress;
    private String cgender;
    private String cemail;
    private String clevel;

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public int getCage() {
        return cage;
    }

    public void setCage(int cage) {
        this.cage = cage;
    }

    public String getCphone() {
        return cphone;
    }

    public void setCphone(String cphone) {
        this.cphone = cphone;
    }

    public String getCbirthday() {
        return cbirthday;
    }

    public void setCbirthday(String cbirthday) {
        this.cbirthday = cbirthday;
    }

    public String getCcreattime() {
        return ccreattime;
    }

    public void setCcreattime(String ccreattime) {
        this.ccreattime = ccreattime;
    }

    public String getCaddress() {
        return caddress;
    }

    public void setCaddress(String caddress) {
        this.caddress = caddress;
    }

    public String getCgender() {
        return cgender;
    }

    public void setCgender(String cgender) {
        this.cgender = cgender;
    }

    public String getCemail() {
        return cemail;
    }

    public void setCemail(String cemail) {
        this.cemail = cemail;
    }

    public String getClevel() {
        return clevel;
    }

    public void setClevel(String clevel) {
        this.clevel = clevel;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "cid=" + cid +
                ", cname='" + cname + '\'' +
                ", cage=" + cage +
                ", cphone='" + cphone + '\'' +
                ", cbirthday='" + cbirthday + '\'' +
                ", ccreattime='" + ccreattime + '\'' +
                ", caddress='" + caddress + '\'' +
                ", cgender='" + cgender + '\'' +
                ", cemail='" + cemail + '\'' +
                ", clevel='" + clevel + '\'' +
                '}';
    }
}
