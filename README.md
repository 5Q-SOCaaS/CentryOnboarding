# CentryOnboarding
Files and documentation related to client onboarding

---

## Microsoft Sentinel workspace setup

1. Deploy lighthouse using zip file and follow [instructions](https://github.com/5Q-SOCaaS/CentryOnboarding/blob/main/AzureLighthouse/README.md)

2. Use the button below to accomplish the following tasks:
     - [ ] Create a Sentinel resource group (**Naming convention:** RG-*ABR*-Sentinel)
     - [ ] Create log analytics workspace (**Naming convention:** *ABR*-LogAnalytics-Sentinel)
     - [ ] Add Sentinel to the Log analytics workspace
    
3. Now to Connect data sources, configure workspace, import analytics rules (Instructions below).


[![Deploy To Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2FAzure-Sentinel%2Fmaster%2FTools%2FSentinel-All-In-One%2FARMTemplates%2Fazuredeploy.json/createUIDefinitionUri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2FAzure-Sentinel%2Fmaster%2FTools%2FSentinel-All-In-One%2FARMTemplates%2FcreateUiDefinition.json)

*Must be signed into this Github account because this repository is currently set to private*

---

## Sentinel Configuration and Setup

Upon completing the initial deployment, we must add all content and connect data sources.

- [ ] Connect Azure Activity logs from the Log Analytics Workspace blade
- [ ] Turn on UEBA from the Sentinel Settings (must be global or security admin)
- [ ] Give permissions to the resource groups that hold Sentinel Playbooks

### Data connectors

I find it useful to add the data connectors that you can using the Solutions (content hub) because it does more than just connect, often it will automatically perform the steps found in the 'Next steps' tab.

Install the solution/Enable the Data connector for the following sources

- [ ] Azure Active Directory
  - [ ] *Check all available logs to be ingested*

- [ ] Azure Active Directory Identity Protection

- [ ] Azure Activity
  - [ ] *Create a remediation task*, follow the wizard's steps

- [ ] Azure Information Protection

- [ ] Microsoft Defender 365
  - [ ] Enable the log collection and table creation for all items listed  
  - [ ] *In the [Defender console](https://security.microsoft.com/homepage), enable the 'Advanced Features'*

- [ ] Microsoft Defender for Endpoint

- [ ] Microsoft Defender for Identity

- [ ] Microsoft Defender for Office 365

- [ ] Microsoft Defender for Cloud Apps
  - [ ] **Data connector page:** *Check Cloud discovery logs*  

  Then go to the [**CloudAppSecurity portal**](https://portal.cloudappsecurity.com/#/dashboard) and complete the following tasks:
  - [ ] Connect O365 and Azure  using the side bar as shown below  
      ![](images\cloud_apps_task1.png)
  

| Step 1 | Step 2|
--- | --- |
 ![](images/cloud_apps_task2.png) | ![](images/cloud_apps_task2b2.png) |
Settings (Top right of page) > Security Extentions | On the page, SIEM Agents > Add SIEM agent 
- [ ] Office 365
  - [ ] *Check Exchange, SharePoint, and Teams*

<p align="right">(<a href="#top">back to top</a>)</p>

---
  
## Report Playbook

Once we have connected all of the data sources that we need, we will go to the Microsoft Sentinel's community Github repository and deploy the [M365-Security-Posture](https://github.com/Azure/Azure-Sentinel/tree/master/Playbooks/M365-Security-Posture) logic app. This playbook grabs Microsoft Defender data and ingests it into tables in the same Log Analytics workspace as Sentinel. This is a required step in our Onboarding process.

Detailed directions can be found [here](https://github.com/Azure/Azure-Sentinel/tree/master/Playbooks/M365-Security-Posture)

#### Deployment Preparation

- Create AAD app registration
- Grant it API permissions for Microsoft Graph:
  - [ ] SecurityEvents.Read.All
  - [ ] SecurityEvents.ReadWrite.All
- Grant permissions for WindowsDefenderATP (APIs my organization use)
  - [ ] Score.Read.All
  - [ ] SecurityRecommendation.Read.All
  - [ ] Vulnerability.Read.All
- Crate an app secret, record it immediately
- record the object Id and tenant Id (Overview blade)
- Grab workspace Id and the primary key from the Log Analytics workspace blade

Then deploy, using the information gathered above for the parameters.

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2FAzure-Sentinel%2Fmaster%2FPlaybooks%2FM365-Security-Posture%2Fazuredeploy.json)

<p align="right">(<a href="#top">back to top</a>)</p>
