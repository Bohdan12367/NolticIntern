/**
 * Created by lukas on 12.07.2022.
 */

public with sharing class Palindrom {

    public Boolean isPalindrom(String toCheck){
        String reversed = toCheck.reverse();
        return toCheck.equals(reversed);

    }
}