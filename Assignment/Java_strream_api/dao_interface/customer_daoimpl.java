import jakarta.persistence.*;
import java.util.*;

public class CustomerDAOImpl implements CustomerDAO {

    EntityManagerFactory emf = Persistence.createEntityManagerFactory("hibernate");
    EntityManager em = emf.createEntityManager();

    public String saveCustomer(Customer customer){
        em.getTransaction().begin();
        em.persist(customer);
        em.getTransaction().commit();
        return "Customer Saved";
    }

    public String updateCustomer(Customer customer){
        em.getTransaction().begin();
        em.merge(customer);
        em.getTransaction().commit();
        return "Customer Updated";
    }

    public String deleteCustomerById(int id){
        Customer c = em.find(Customer.class,id);
        em.getTransaction().begin();
        em.remove(c);
        em.getTransaction().commit();
        return "Customer Deleted";
    }

    public Customer getCustomerById(int id){
        return em.find(Customer.class,id);
    }

    public List<Customer> getAllCustomers(){
        return em.createQuery("from Customer",Customer.class).getResultList();
    }

    public Customer getCustomerByEmail(String email){
        return em.createQuery("select c from Customer c where c.email=:e",Customer.class)
                .setParameter("e",email)
                .getSingleResult();
    }
}
