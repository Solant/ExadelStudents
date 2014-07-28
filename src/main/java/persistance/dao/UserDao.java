package persistance.dao;


import persistance.model.User;

import java.util.List;

public interface UserDao extends GenericDao<User>{

    public User findByLogin(String login);

}