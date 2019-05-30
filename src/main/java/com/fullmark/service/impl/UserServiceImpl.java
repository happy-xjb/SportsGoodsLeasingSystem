package com.fullmark.service.impl;

import com.fullmark.dao.OrderMapper;
import com.fullmark.dao.UserMapper;
import com.fullmark.pojo.User;
import com.fullmark.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Transactional
@Service("userService")
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public User login(String username, String password) {
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        User login = userMapper.selectByUsernameAndPassword(user);
        return login;
    }

    @Override
    public boolean checkUserExists(String username) {
       User user = userMapper.selectByUsername(username);
       return user==null?false:true;
    }

    @Override
    public User getLoginUser(String username) {
        return userMapper.selectByUsername(username);
    }

    @Override
    public void register(String username, String password, String nickname, String leasingPassword, int isAdmin) {
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setNickname(nickname);
        user.setLeasingpassword(leasingPassword);
        user.setIsadmin(isAdmin);
        userMapper.insertSelective(user);
    }

    @Override
    public User verifyLeasingPassword(int uid, String leasingPassword) {
        User user = new User();
        user.setId(uid);
        user.setLeasingpassword(leasingPassword);
        return userMapper.selectByIdAndLeasingPassword(user);
    }
}
