global class GDriveConnectorController {
    public String GDriveClientId{
        get{ 
            return GDriveConnector__c.getOrgDefaults().Google_Drive_App_Client_ID__c;
        }
    }
    public String GDriveRoolFolderId{
        get{
            return GDriveConnector__c.getOrgDefaults().Google_Drive_App_Root_Folder_ID__c;
        }
    }
    public String GDriveRoolFolderName{
        get{
            return GDriveConnector__c.getOrgDefaults().Google_Drive_App_Root_Folder_Name__c;
        }
    }
    public String sobjectId{get;Set;}
    
    public String SObjectAPIName{
        get{
            if(String.isBlank(this.sobjectId)) return '';
            return String.valueOf(ID.valueOF(this.sobjectId).getSobjectType());
        }
    }
    
    /*
     * Returns the name field of a given SObject Type
	*/
    private static String getSobjectNameField(SobjectType sobjType){
        String output = 'Name';
        for(schema.SObjectField sotype : sobjType.getDescribe().fields.getMap().values()){
            Schema.DescribeFieldResult fieldDescObj = sotype.getDescribe();
            if(fieldDescObj.isNameField() ){
            	output = fieldDescObj.getName();
                break;
            }
        }
        return output;
    }
    
    /*
     * Get all the names of a given set of IDs
	 */
    @RemoteAction
    global static Map<ID,String> getSobjectNames(List<ID> ids){
        Map<SobjectType, Set<ID>> typeToIds = new Map<SobjectType, Set<ID>>();
        Map<ID, String> result = new Map<ID,String>();
        for(ID i : ids){
            Set<ID> idSet = typeToIds.get(i.getSobjectType());
            if(idSet == null){
                idSet = new Set<ID>();
                typeToIds.put(i.getSobjectType(), idSet);
            }
            idSet.add(i);
        }
        for(SobjectType stype : typeToIds.keySet()){
            Set<ID> idSet = typeToIds.get(stype);
            String nameField = getSobjectNameField(stype);
            List<Sobject> sList = Database.query('Select Id,'+nameField+' From '
                                                 +stype+' Where Id IN (\''+String.join(new List<ID>(idSet),'\',\'')+'\')');
            for(SObject obj : sList){
                result.put((ID)obj.get('Id'), String.valueOf(obj.get(nameField)));
            }
        }
        return result;
    }
    
    public GDriveConnectorController(){
        
    }
}