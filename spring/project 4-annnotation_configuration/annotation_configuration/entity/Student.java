package annotation_configuration.entity;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Component;

@Component
public class Student {

    @Value("101")
    private int id;

    @Value(value="Anushka")
    private String name;



    public void setId(int id) {
        this.id = id;
    }


    public String getName() {
        return name;
    }


    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Student{id=" + id + ", name='" + name + "'}";
    }

    public static void main(String[] args) {

        ApplicationContext context =
                new AnnotationConfigApplicationContext("annotation_configuration.entity");

        Student s = context.getBean(Student.class);

        System.out.println(s);
    }
}
