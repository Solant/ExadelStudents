package persistance.dao.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import persistance.dao.GenericDao;

import java.lang.reflect.ParameterizedType;
import java.util.List;

public class GenericDaoImpl<T> implements GenericDao<T>{

    @Autowired
    private SessionFactory sessionFactory;

    private Class<T> type;

    @SuppressWarnings("unchecked")
    public GenericDaoImpl() {
        this.type = (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
    }


    public void save(T entity){
        sessionFactory.getCurrentSession().save(entity);
    }

    @SuppressWarnings("unchecked")
    public void removeById (int id){

        T contact = (T) sessionFactory.getCurrentSession().load(
                type, id);
        if (null != contact) {
            sessionFactory.getCurrentSession().delete(contact);
        }
    }

    public void update (T entity){
        sessionFactory.getCurrentSession().update(entity);
    }

    @SuppressWarnings("unchecked")
    public T findById(long id){
        return (T) sessionFactory.getCurrentSession().get(type, id);
    }

    @SuppressWarnings("unchecked")
    public List<T> findAll(){
        return (List<T>) sessionFactory.getCurrentSession().createQuery("from "+type.getName()).list();
    }



}
