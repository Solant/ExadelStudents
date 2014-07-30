package persistance.dao.impl;

import org.springframework.stereotype.Repository;
import persistance.dao.NotificationDao;
import persistance.model.Notification;

@Repository
public class NotificationDaoImpl extends GenericDaoImpl<Notification> implements NotificationDao {
}
