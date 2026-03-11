package DependencyInjection;
import DependencyInjection.library;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.io.ClassPathResource;

public class Main {

    public static void main(String[] args) {

        // BeanFactory example
        BeanFactory factory =
                new XmlBeanFactory(new ClassPathResource("library_book_dependency.xml"));

        library lib = (library) factory.getBean("L1");
        System.out.println(lib);

        // ApplicationContext example
        ApplicationContext context =
                new ClassPathXmlApplicationContext("List_Dependency.xml");

        library lib1 = (library) context.getBean("Lib1");
        System.out.println(lib1);
    }
}
