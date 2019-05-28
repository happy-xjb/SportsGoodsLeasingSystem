package com.fullmark.pojo;

import java.util.Date;

public class Order {
    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", leasingby=" + leasingby +
                ", goods=" + goods +
                ", number=" + number +
                ", createtime=" + createtime +
                ", backtime=" + backtime +
                ", state=" + state +
                '}';
    }

    private Integer id;

    private Integer leasingby;

    private Integer goods;

    private Integer number;

    private Date createtime;

    private Date backtime;

    private Integer state;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getLeasingby() {
        return leasingby;
    }

    public void setLeasingby(Integer leasingby) {
        this.leasingby = leasingby;
    }

    public Integer getGoods() {
        return goods;
    }

    public void setGoods(Integer goods) {
        this.goods = goods;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Date getBacktime() {
        return backtime;
    }

    public void setBacktime(Date backtime) {
        this.backtime = backtime;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }
}