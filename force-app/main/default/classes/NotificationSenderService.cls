public class NotificationSenderService {
    private NotificationSender sender;
    private String message;

    public void initNotificationSender(NotificationSender sender, String message){
        this.sender = sender;
        this.message = message;
    }

    public void executeSend(){
        sender.sendNotification(message);
    }
}