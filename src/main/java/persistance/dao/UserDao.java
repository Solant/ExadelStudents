package persistance.dao;


import persistance.model.User;

public interface UserDao {

    User findByUserName(String username);

}