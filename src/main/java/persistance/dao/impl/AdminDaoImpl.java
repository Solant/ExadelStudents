package persistance.dao.impl;

import org.springframework.stereotype.Repository;
import persistance.dao.AdminDao;
import persistance.model.Admin;


@Repository
public class AdminDaoImpl extends GenericDaoImpl<Admin> implements AdminDao {
}
