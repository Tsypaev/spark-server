import static spark.Spark.get;

/**
 * @author Vladimir Tsypaev
 */
public class Server {
    public static void main(String[] args) {
        get("/hello", (req, res) -> "Hello World");
    }
}
