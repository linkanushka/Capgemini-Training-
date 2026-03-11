package IOC_with_XML;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.io.ClassPathResource;

public class Main {
    public static void main(String[] args) {
  BeanFactory beanFactory=new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
   Myfavclass myfav=(Myfavclass) beanFactory.getBean("bean_id");
        System.out.println(myfav);

        BeanFactory beanFactory2=new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
        Myfavclass myfav2=(Myfavclass) beanFactory2.getBean(Myfavclass.class);
        System.out.println(myfav2);
         Myfavclass myfav3=(Myfavclass) beanFactory2.getBean("bean_id");
        System.out.println(myfav3);
//        BeanFactory beanFactory3=new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
//        Myfavclass myfav5=(Myfavclass) beanFactory3.getBean("bean_id");
//        System.out.println("My favourite movie" +myfav5);
//        BeanFactory beanFactory4=new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
//        Myfavclass myfav6=(Myfavclass) beanFactory4.getBean("bean_id");
//        System.out.println("My favourite number" +myfav6);


        //bean ceation using application context
        //bean creation using classpath
        ApplicationContext context=new ClassPathXmlApplicationContext("applicationContext.xml");
        Myfavclass myfav4=(Myfavclass) context.getBean("bean_id");
        System.out.println(myfav4);


    }
}
