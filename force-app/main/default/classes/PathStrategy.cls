/**
 * Created by lukas on 03.09.2022.
 */

public interface PathStrategy {

    List<String> getPath(String addressFrom, String addressTo);
}