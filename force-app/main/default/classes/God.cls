public abstract class God {
    public static Human createMan(String name) {
      return new Man(name);
    }
    public static Human createWoman(String name) {
      return new Woman(name);
    }
    public virtual class Human {
        string name;
        public Human(String name) {
            this.name = name;
        }
    }
    public class Man extends Human {
        public Man(String name) {
            super(name);
        }
    }
    public class Woman extends Human {
        public Woman(String name) {
            super(name);
        }
    }
}