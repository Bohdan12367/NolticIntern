/**
 * Created by lukas on 03.09.2022.
 */

public class PathService {
    public static List<String> calculatePath(String fromAddress, String toAddress, Boolean isWalkingDead){
        PathStrategy strategy;

        if(isWalkingDead){
            strategy = new WalkingStrategy();
        }else {
            strategy = new DrivingStrategy();
        }
        return strategy.getPath(fromAddress,toAddress);
    }
}