package persistance.dao;


import persistance.dao.impl.GenericDaoImpl;
import persistance.model.User;

public interface UserDao extends GenericDao<User> {

    User findByUserName(String username);

}