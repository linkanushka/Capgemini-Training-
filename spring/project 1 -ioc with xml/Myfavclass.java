package IOC_with_XML;

public class Myfavclass {

    int id;
    String name;


    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }



    @Override
    public String toString() {
        return "MyFavourite { id=" + id + ", name=" + name + "}";
    }
}
