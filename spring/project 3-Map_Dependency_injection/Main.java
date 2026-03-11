package Map_dependency_injection;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;

public class Main {
    public static void main(String[] args) {


    BeanFactory beanfactory = new XmlBeanFactory(new ClassPathResource("map_kit.xml"));
    kit k = (kit) beanfactory.getBean("kit_id");
     System.out.println(k);
}
}
