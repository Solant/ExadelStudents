package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import persistance.dao.StudentDao;
import persistance.dao.UserDao;
import persistance.model.Student;
import persistance.model.User;
import persistance.model.UserRole;

import java.util.HashSet;
import java.util.Set;

/**
 * Created by user on 18.07.2014.
 */

@Service
public class TestService {

    private UserDao ud;

    @Transactional
    public void testMethod(){

        System.out.println("TEST STARTED!");

        User user = new User();
        user.setLogin("wasya");
        user.setPassword("123456");
        UserRole ur = new UserRole();
        ur.setRole("ROLE_STUDENT");
        Set<UserRole> ser = new HashSet<UserRole>();
        user.setUserRole(ser);
        ur.setUser(user);

        ud.save(user);
        for(User s : ud.findAll()){
            System.out.println(s.getLogin());
        }
        System.out.println("TEST ENDED!");
    }
}
