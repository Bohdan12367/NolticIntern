@RestResource(UrlMapping='/contact/*')
global class RestContact {
    final static String lastEndpointSection = 'contact';

    @HttpPost
    global static void createContact(String lastname,String phone, String email){
        RestResponse res = RestContext.response;

        Contact contact = new Contact();
        contact.LastName = lastname;
        contact.Phone = phone;
        contact.Email = email;
        insert contact;

        res.headers.put('Content-Type', 'application/json');
        res.statusCode = 200;
        res.responseBody = Blob.valueOf(JSON.serialize(contact));

    }

    @HttpGet
    global static void getContacts(){
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;

        String contactId = req.requestUri.substringAfterLast(lastEndpointSection).removeStart('/');

        if (String.isBlank(contactId)) {
            res.statusCode = 200;
            res.responseBody = Blob.valueOf(JSON.serializePretty([
                    SELECT Id, LastName
                    FROM Contact]));

            return;
        }

        res.headers.put('Content-Type', 'application/json');
        res.statusCode = 200;
        res.responseBody = Blob.valueOf(JSON.serializePretty([
                SELECT Id, LastName
                FROM Contact
                WHERE Id = :contactId
        ]));
    }

    @HttpPatch
    global static void updateContact(String lastname,String phone, String email){
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;

        String contactId = req.requestUri.substringAfterLast(lastEndpointSection).removeStart('/');
        if(String.isBlank(contactId)){
            res.statusCode = 400;
            res.responseBody  = Blob.valueOf('Contact Id not entered. ');
            return;
        }
        List<Contact> contacts = [SELECT Id FROM Contact WHERE Id =: contactId];
        if(contacts.isEmpty()){
            res.statusCode =404;
            res.responseBody = Blob.valueOf('Contact not found');
            return;
        }

        Contact contact = contacts.get(0);

        contact.LastName = lastname;
        contact.Phone = phone;
        contact.Email = email;
        update contact;

        res.headers.put('Content-Type', 'application/json');
        res.responseBody = Blob.valueOf(JSON.serialize(contact));


    }

    @HttpDelete
    global static void deleteContact() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;

        String contactId = req.requestUri.substringAfterLast(lastEndpointSection).removeStart('/');
        if (String.isBlank(contactId)) {
            res.statusCode = 400;
            res.responseBody = Blob.valueOf('Contact Id not entered.');

            return;
        }
        List<Contact> contacts = [SELECT Id FROM Contact WHERE Id = :contactId];
        if (contacts.isEmpty()){
            res.statusCode = 404;
            res.responseBody = Blob.valueOf('Contact not found.');

            return;
        }

        delete contacts;
        res.statusCode = 200;
        res.responseBody = Blob.valueOf('Contact delete successful.');

    }
}