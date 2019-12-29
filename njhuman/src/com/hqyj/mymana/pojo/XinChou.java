package com.hqyj.mymana.pojo;

import java.util.Date;

public class XinChou {
    private Integer id;

    private Double basicIncome;

    private Double xjIncome;

    private Double award;

    private Double fine;

    private Double realIncome;

    private String date;
    
    private String userName;

    public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Double getBasicIncome() {
        return basicIncome;
    }

    public void setBasicIncome(Double basicIncome) {
        this.basicIncome = basicIncome;
    }

    public Double getXjIncome() {
        return xjIncome;
    }

    public void setXjIncome(Double xjIncome) {
        this.xjIncome = xjIncome;
    }

    public Double getAward() {
        return award;
    }

    public void setAward(Double award) {
        this.award = award;
    }

    public Double getFine() {
        return fine;
    }

    public void setFine(Double fine) {
        this.fine = fine;
    }

    public Double getRealIncome() {
        return realIncome;
    }

    public void setRealIncome(Double realIncome) {
        this.realIncome = realIncome;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}