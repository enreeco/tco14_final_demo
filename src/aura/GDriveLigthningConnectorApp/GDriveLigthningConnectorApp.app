<aura:application controller="tco14.GDriveLightningConnectorAppController">
    <aura:handler name="init" value="{!this}" action="{!c.doInit}" />
    <aura:attribute name="id" type="String" default="" description="id of the SObject" />
    <aura:attribute name="cnt" type="Contact" default="{'sobjectType': 'Contact', 'Id':null, 'Name':null, 'Account':null}" description="contact loaded" />
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1" />
    <link rel="stylesheet" type="text/css" href="/resource/ScriptsAndStyles/css/bootstrap.min.css"/>
    
    <div class="page-header">
        <h1>Contact <small>GDrive integration example</small></h1>
    </div>
    
    <div class="form-horizontal">
        <div class="form-group">
            <label class="col-xs-3 control-label">Contact Name:</label>
            <p class="col-xs-6 form-control-static">{!v.cnt.Name}</p>
        </div>
        <div class="form-group">
            <label class="col-xs-3 control-label">Account Name:</label>
            <p class="col-xs-6 form-control-static">{!v.cnt.Account.Name}</p>
        </div>
        
    </div>
    
    <div class="page-header">
        <h1><small>Contact's GDrive attachments</small></h1>
    </div>
    <aura:renderIf isTrue="{!v.cnt.Id !=null}">
        <iframe src="{!'/apex/GDriveGenericConnector?id='+v.cnt.Id}"  style="width: 100%; height:30%"></iframe>
    </aura:renderIf>
    <div class="page-header">
        <h1><small>Account's GDrive attachments</small></h1>
    </div>
    <aura:renderIf isTrue="{!v.cnt.Account.Id !=null}">
        <iframe src="{!'/apex/GDriveGenericConnector?id='+v.cnt.Account.Id}"  style="width: 100%; height:30%"></iframe>
    </aura:renderIf>
</aura:application>