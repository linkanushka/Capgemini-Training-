import jakarta.persistence.*;

public class OrderDAOImpl implements OrderDAO {

    EntityManagerFactory emf = Persistence.createEntityManagerFactory("hibernate");
    EntityManager em = emf.createEntityManager();

    public String saveOrder(Order order){
        em.getTransaction().begin();
        em.persist(order);
        em.getTransaction().commit();
        return "Order Saved";
    }

    public String updateOrder(Order order){
        em.getTransaction().begin();
        em.merge(order);
        em.getTransaction().commit();
        return "Order Updated";
    }

    public String deleteOrderById(int id){
        Order o = em.find(Order.class,id);
        em.getTransaction().begin();
        em.remove(o);
        em.getTransaction().commit();
        return "Order Deleted";
    }

    public Order getOrderById(int id){
        return em.find(Order.class,id);
    }
}
