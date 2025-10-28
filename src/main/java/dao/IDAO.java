/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dao;

import java.util.List;

/**
 *
 * @author Admin
 */
public interface IDAO<T,K> {
    public boolean create(T entity);
    public List<T> readAll();
    public T readById(K id);
    public boolean update(T entity);
    public boolean delete(K id);
    public List<T> search(String searchTerm);
    
}
