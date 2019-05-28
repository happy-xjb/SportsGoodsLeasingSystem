package com.fullmark.pojo;

public class User {
    private Integer id;

    private String username;

    private String password;

    private String nickname;

    private String leasingpassword;

    private Integer isadmin;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname == null ? null : nickname.trim();
    }

    public String getLeasingpassword() {
        return leasingpassword;
    }

    public void setLeasingpassword(String leasingpassword) {
        this.leasingpassword = leasingpassword == null ? null : leasingpassword.trim();
    }

    public Integer getIsadmin() {
        return isadmin;
    }

    public void setIsadmin(Integer isadmin) {
        this.isadmin = isadmin;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", nickname='" + nickname + '\'' +
                ", leasingpassword='" + leasingpassword + '\'' +
                ", isadmin=" + isadmin +
                '}';
    }
}