package vn.com.webproject.beans;

import java.io.Serializable;

public class DetailsInfo implements Serializable {
    private String info;

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public DetailsInfo(String info) {
        this.info = info;
    }
    public DetailsInfo(){

    }

}
