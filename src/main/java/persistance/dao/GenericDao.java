package persistance.dao;

import java.util.List;

public interface GenericDao <T> {
    public void save(T entity);
    public void removeById(long id);
    public void update (T entity);
    public T findById(long id);
    public List<T> findAll();
    //...
}
