package Map_dependency_injection;

import java.util.Map;

public class kit {

    private String name;
    private Map<String, Integer> items;

    // Constructor
    public kit(String name, Map<String, Integer> items) {
        this.name = name;
        this.items = items;
    }

    public Map<String, Integer> getItems() {
        return items;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setItems(Map<String, Integer> items) {
        this.items = items;
    }

    @Override
    public String toString() {
        return "{ " + name + " " + items + " }";
    }
}
