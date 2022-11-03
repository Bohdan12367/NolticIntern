trigger AccountTrigger on Account (before insert) {
    if (Trigger.isBefore && Trigger.isInsert) {
        //руддщщ
		AccountTriggerHandler.CreateAccounts(Trigger.New);
    }
}