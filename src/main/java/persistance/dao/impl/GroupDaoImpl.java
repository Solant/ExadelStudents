package persistance.dao.impl;

import org.springframework.stereotype.Repository;
import persistance.dao.GroupDao;
import persistance.model.Group;

@Repository
public class GroupDaoImpl extends GenericDaoImpl<Group> implements GroupDao {
}
