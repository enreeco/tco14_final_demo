@isTest
private class GDriveTestClass {
    private static testmethod void test_method_1(){
        Contact cnt = new Contact(LastName = 'test');
        insert cnt;
        Test.startTest();
        GDriveConnectorController controller = new GDriveConnectorController();
        String tmp = controller.GDriveClientId;
        tmp = controller.GDriveRoolFolderId;
        tmp = controller.GDriveRoolFolderName;
        controller.sobjectId = cnt.Id;
        tmp = controller.SObjectAPIName;
        GDriveConnectorController.getSobjectNames(new List<ID>{controller.sobjectId});
		Test.stopTest();
    }
    private static testmethod void test_method_2(){
        Test.startTest();
        GDriveLightningConnectorAppController.loadContact(null);
		Test.stopTest();
    }
}