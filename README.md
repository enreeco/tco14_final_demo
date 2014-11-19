TCO14 Demo
==========

Intro
-----

This is the demo app for TCO14.

See the /docs folder for a brief slide show.

Go to the **Resources** section for a live demo (no need to install or configure anything).

Install & Configure
-------------------

1. Create Gmail Account (it will be the admin user)

2. Create new API project (using GDrive APIs)
    a. Go to https://console.developers.google.com/
    b. Click on **APIs & auth** and then **Credentials** and create a new project
    c. Click on OAuth section the button **Create new Cliend ID**
    d. In the **Javascript origins** add the addresses of your installing ORG
        E.G.:
        https://eu5.salesforce.com
        https://tco14.eu5.visual.force.com (where tco14 is my org's namespace, use yours)
        https://c.eu5.visual.force.com
    e. In the **Redirect URI** add entries following what is already provided
    e. Take the generated **Client ID** (we'll use ti soon)

3. Go on GDrive at https://drive.google.com/drive/ and create a new root folder: this will be the root folder of all the SObjects of the ORG.

4. Save its name (e.g. TCO14Folder) and its ID (just double click on the folder, you'll see the browser address like "https://drive.google.com/drive/#folders/0BzfhwWMQtqJATTI4UmRreUNoOG8", take the last part): we'll be using them when configuring the destination Salesforce ORG

5. Create a new Salesforce Developer ORG @ https://developer.salesforce.com/en/signup

6. Go to **Setup** > **Build** > **Create** > **Packages** select **Edit** in the **Developer Settings** section: set a valid namespace prefix for your org (remember, this is permanent) and leave the **Manage Package** part blank (you don't need it).

7. Go to **Build** > **Develop** > **Lightning Components** and click on **Enable Lightning Components** flag and **Save**.

8. Install the provided unamanged package (https://login.salesforce.com/packaging/installPackage.apexp?p0=04t24000000PdUO)

9. On the upper right part of the page click on your name and then **Developer Console** (or alternatively go to https://[your_org_instance].salesforce.com/_ui/common/apex/debug/ApexCSIPage); click **File** > **Open Lightning Resources** and select **GDriveLightiningConnectorApp**
    9a. Open the APPLICATION page:
        - Line 1: "tco14.GDriveLightningConnectorAppController" replace "tco14" with your own namespace prefix

10. Open **Setup** > **Build** > **Develop** > **Custom Settings** > **Google Drive Connector Settings**, **Manage**, on the upper **New** button and set the previously said configurations:
    - Google Drive App Client ID    
    - Google Drive App Root Folder Name
    - Google Drive App Root Folder ID 

11. Set the Provided Contact layout to your profiles:
    **Setup** > **Build** > **Customize** > **Contacts** > **Page Layouts** > **Page Layout Assignment** button, then **Edit Assignment** button and give all the profiles the **Contact Layout (TCO14)** page layout.

12. Give access permission to the VisualForce pages to the profiles that can access the new GDrive component (considering also the "proxy page" used to make the Lightning component work, GDRiveGenericConnector.page)

You can access the Lightning app (live demo):

    - https://na16.lightning.force.com/tco14_demo/GDriveLigthningConnectorApp.app?id=003j00000042l0BAAQ
        Note: remember to put a 18 characters Salesforce ID

    - https://na16.salesforce.com/003j00000042l0BAAQ (standard layout)
    
    - https://na16.lightning.force.com/one/one.app#/sObject/003j00000042l0BAAQ/view?t=1416299632331
        This is salesforce1 visualization of the CRM, click on "Related" to see the Mobile Card section for the GDrive connector


Resources
---------

**Live Demo** (all IP whitelisted): 

    - username: tco14@topcoder.com 
    - password: Cloud12345 
    - secret question: city born? san francisco 
    - password never expires

**Salesforce Package**: https://login.salesforce.com/packaging/installPackage.apexp?p0=04t24000000PdUO

**Demo video**: http://www.screencast.com/t/T5XOBHmNoj

**GitHub repo**: https://github.com/enreeco/tco14_final_demo

**Gmail User Admin** (if you don't want to create your own app): 

    - username: topcoderopen14@gmail.com 
    - password: Cloud12345
