package main;

import daoimpl.CustomerDAOImpl;
import daoimpl.OrderDAOImpl;
import entity.Customer;
import entity.Order;

import java.time.LocalDate;

public class MainApp {

    public static void main(String[] args) {

        CustomerDAOImpl customerDAO = new CustomerDAOImpl();
        OrderDAOImpl orderDAO = new OrderDAOImpl();

        Order order = new Order();
        order.setOrderNumber("ORD101");
        order.setProductName("Laptop");
        order.setQuantity(1);
        order.setPrice(75000);
        order.setOrderDate(LocalDate.now());

        Customer customer = new Customer();
        customer.setCustomerName("Anushka");
        customer.setEmail("anushka@gmail.com");
        customer.setGender("Female");
        customer.setPhone(9876543210L);
        customer.setRegistrationDate(LocalDate.now());

        customer.setOrder(order);
        order.setCustomer(customer);

        System.out.println(customerDAO.saveCustomer(customer));

        Customer c = customerDAO.getCustomerById(1);
        System.out.println(c.getCustomerName());

        c.setCustomerName("Anushka Singh");
        System.out.println(customerDAO.updateCustomer(c));

        System.out.println(customerDAO.getAllCustomers());

        System.out.println(customerDAO.getCustomerByEmail("anushka@gmail.com"));

        Order o = orderDAO.getOrderById(1);
        o.setPrice(80000);
        System.out.println(orderDAO.updateOrder(o));
    }
}
