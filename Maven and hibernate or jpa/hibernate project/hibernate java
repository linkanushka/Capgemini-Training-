package com.example.hibernate.main;

import org.hibernate.*;
import org.hibernate.cfg.Configuration;

import com.example.hibernate.entity.Student;

public class HibernateApp {

public static void main(String[] args){

SessionFactory factory =
new Configuration().configure().buildSessionFactory();

Session session = factory.openSession();

Transaction tx = session.beginTransaction();

Student s = new Student(1,"Anushka");

session.save(s);

tx.commit();

session.close();

}

}
