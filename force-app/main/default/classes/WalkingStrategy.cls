/**
 * Created by lukas on 03.09.2022.
 */

public class WalkingStrategy implements PathStrategy{

    public List<String> getPath(String addressFrom, String addressTo) {

        List<String> coordinates = new List<String>();

        coordinates.add('0;0');
        coordinates.add('0;1');
        coordinates.add('0;2');
        coordinates.add('0;3');
        coordinates.add('0;4');
        coordinates.add('1;5');
        coordinates.add('2;5');
        coordinates.add('3;5');
        coordinates.add('4;5');
        coordinates.add('5;5');

        return coordinates;
    }
}