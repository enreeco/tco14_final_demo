public class GDriveLightningConnectorAppController {
	@AuraEnabled
    public static String loadContact(ID objId){
        return JSON.serialize([Select Id, Name, Account.Name From Contact WHere Id = :objId]);
    }
}