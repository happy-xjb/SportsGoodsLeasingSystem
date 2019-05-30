package com.fullmark.service;

import com.fullmark.pojo.User;

public interface UserService {
    public User login(String username,String password);
    public boolean checkUserExists(String username);
    public User getLoginUser(String username);

    void register(String username, String password, String nickname, String leasingPassword, int isAdmin);

    User verifyLeasingPassword(int uid, String leasingPassword);
}
