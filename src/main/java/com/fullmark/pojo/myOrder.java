package com.fullmark.pojo;

public class myOrder {
    int id;
    int leasingBy;
    int goods;
    int number;
    String createTime;
    String backTime;
    int state;
    String name;

    @Override
    public String toString() {
        return "myOrder{" +
                "id=" + id +
                ", leasingBy=" + leasingBy +
                ", goods=" + goods +
                ", number=" + number +
                ", createTime='" + createTime + '\'' +
                ", backTime='" + backTime + '\'' +
                ", state=" + state +
                ", name='" + name + '\'' +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getLeasingBy() {
        return leasingBy;
    }

    public void setLeasingBy(int leasingBy) {
        this.leasingBy = leasingBy;
    }

    public int getGoods() {
        return goods;
    }

    public void setGoods(int goods) {
        this.goods = goods;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getBackTime() {
        return backTime;
    }

    public void setBackTime(String backTime) {
        this.backTime = backTime;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
