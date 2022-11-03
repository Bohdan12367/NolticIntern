public class EmailNotificationSender implements NotificationSender{

    public void sendNotification(String notificationMessage) {
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        message.toAddresses = new String[]{'lukasevicboda@gmail.com'};
        message.subject = 'Hello everyone';
        message.plainTextBody = notificationMessage;
        Messaging.SingleEmailMessage[] messages =   new List<Messaging.SingleEmailMessage> {message};
        Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
        if (results[0].success) {
            System.debug('The email was sent successfully.');
        } else {
            System.debug('The email failed to send: ');
        }
    }
}