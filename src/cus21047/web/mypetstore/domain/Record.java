package cus21047.web.mypetstore.domain;

import java.io.Serializable;

public class Record implements Serializable {
    private String userid;
    private String records;


    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getRecords() {
        return records;
    }

    public void setRecords(String records) {
        this.records = records;
    }
}
