/**
 * Created by lukas on 03.09.2022.
 */

public class DrivingStrategy implements PathStrategy{

    public List<String> getPath(String addressFrom, String addressTo) {
        List<String> coordinates = new List<String>();

        coordinates.add('0;0');
        coordinates.add('0;5');
        coordinates.add('5;5');


        return coordinates;
    }
}