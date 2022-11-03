/**
 * Created by lukas on 12.07.2022.
 */

public with sharing class Fighter {
    public String name;
    public Integer health;
    public Integer damagePerAttack;

    public Fighter(String name, Integer health, Integer damagePerAttack) {
        this.name = name;
        this.health = health;
        this.damagePerAttack = damagePerAttack;
    }
    public static String Fight(Fighter fighter1,Fighter fighter2){
        while (fighter1.health > 0 && fighter2.health > 0) {
            fighter1.health = fighter1.health - fighter2.damagePerAttack;
            if (fighter1.health <= 0) {
                return fighter2.name;
            }
            fighter2.health = fighter2.health - fighter1.damagePerAttack;
            if (fighter2.health <= 0){
                return fighter1.name;
            }
        }

        
        return '';
    }
}