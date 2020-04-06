package cn.mcb.pojo;
//公告
public class Notice {
    private int nid;
    private String ntitle;
    private String ncontent;
    private String nsender;
    private String ntime;

    public int getNid() {
        return nid;
    }

    public void setNid(int nid) {
        this.nid = nid;
    }

    public String getNtitle() {
        return ntitle;
    }

    public void setNtitle(String ntitle) {
        this.ntitle = ntitle;
    }

    public String getNcontent() {
        return ncontent;
    }

    public void setNcontent(String ncontent) {
        this.ncontent = ncontent;
    }

    public String getNsender() {
        return nsender;
    }

    public void setNsender(String nsender) {
        this.nsender = nsender;
    }

    public String getNtime() {
        return ntime;
    }

    public void setNtime(String ntime) {
        this.ntime = ntime;
    }

    @Override
    public String toString() {
        return "Notice{" +
                "nid=" + nid +
                ", ntitle='" + ntitle + '\'' +
                ", ncontent='" + ncontent + '\'' +
                ", nsender='" + nsender + '\'' +
                ", ntime='" + ntime + '\'' +
                '}';
    }
}
