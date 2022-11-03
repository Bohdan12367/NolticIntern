/**
 * Created by lukas on 15.07.2022.
 */

public with sharing class Structure {


//    public static List<Integer> get_Unique(List<Integer> unique){
//       // List<Integer> unique = new List<Integer>{2,4,6,78,6,5,6};
//        List<Integer> new_unique = new List<Integer>{};
//        for(Integer uniq: unique){
//            if(!new_unique.contains(uniq)){
//                new_unique.add(uniq);
//            }
//        }
//        return new_unique;
//    }

//    public static List<Integer> list_Numbers(Integer num){
//
//        String s_num = String.valueOf(num);
//        List<Integer> myList = new List<Integer>{};
//        List<String>  s_num1= s_num.split('');
//        for(String s : s_num1) {
//            if(s.isNumeric()){
//                myList.add(Integer.valueOf(s));
//            }
//        }
//
//
//        return myList;
//    }
//    public static Contact get_Contact(List<Contact> Contacts, String myName){
//        Contact contact = new Contact();
//        for(Contact cont: Contacts){
//            if(cont.FirstName == myName){
//                contact = cont;
//            }
//        }
//        return contact;
//    }

    public static Opportunity get_Opp(List<Opportunity> opportunities){
        //Opportunity opportunity_max = new Opportunity();
        Opportunity max = opportunities[0];
        for(Opportunity opp: opportunities){
                if (opp.Amount>max.Amount){
                    max = opp;
                }
                }

        return max;
    }

}