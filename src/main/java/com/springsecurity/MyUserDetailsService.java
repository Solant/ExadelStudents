package com.springsecurity;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import persistance.dao.UserDao;
import persistance.model.User;
import persistance.model.UserRole;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service("myUserDetailsService")
public class MyUserDetailsService implements UserDetailsService{

    private UserDao userDao;

    @Override
    @Transactional//АБИЗАТИЛЬНА БЛЯТЬ
    public UserDetails loadUserByUsername(String username) {
        System.out.println("[CALL]MyUserDetailsService.loadUserByName()");
        System.out.println("[DEBUG]MyUserDetailsService.loadUserByName() username = " + username);

        User user = userDao.findByLogin(username);
        System.out.println("[DEBUG]MyUserDetailsService.loadUserByName() username = " + user.getLogin());

        List<GrantedAuthority> authorities = buildUserAuthority(user.getUserRole());

        System.out.println("[DEBUG]MyUserDetailsService.loadUserByName() username = " + user.getLogin());

        return buildUserForAuthentication(user, authorities);
    }

    // Converts user to org.springframework.security.core.userdetails.User
    private org.springframework.security.core.userdetails.User buildUserForAuthentication(User user, List<GrantedAuthority> authorities) {
        System.out.println("[DEBUG]MyUserDetailsService.buildUserForAuthentication() login:" + user.getLogin() + " password: " + user.getPassword());
        return new org.springframework.security.core.userdetails.User(user.getLogin().trim(), user.getPassword().trim(), true/**/, true, true, true, authorities);
    }

    private List<GrantedAuthority> buildUserAuthority(Set<UserRole> userRoles) {

        Set<GrantedAuthority> setAuths = new HashSet<GrantedAuthority>();

        // Build user's authorities
        for (UserRole userRole : userRoles) {
            setAuths.add(new SimpleGrantedAuthority(userRole.getRole()));
        }

        List<GrantedAuthority> Result = new ArrayList<GrantedAuthority>(setAuths);

        return Result;
    }

    public UserDao getUserDao() {
        return userDao;
    }

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }
}
