package persistance.dao.impl;

import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import persistance.dao.GroupDao;
import persistance.model.Group;

import java.util.ArrayList;
import java.util.List;

@Repository
public class GroupDaoImpl extends GenericDaoImpl<Group> implements GroupDao {

    /**
     * Returns list of groups for this status
     * *
     * @status status in String, can have 3 values: FOR_EVERYBODY, FOR_WORKING, FOR_STUDYING
     */
    public List<Group> getByStatus(String status){
        List<Group> groups = new ArrayList<Group>();

        groups = sessionFactory.getCurrentSession().createCriteria(Group.class)
                .add(Restrictions.eq("status", status)).list();

        return groups;

    }
}
