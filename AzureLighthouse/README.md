# Azure Lighthouse

## Instructions


1. Get Contents of "5Q templates.zip" onto the customer's tenant
   - Download/clone the entire repository, then manually drag and drop this zip
   - use command line
   ```powershell 
   iwr https://github.com/5Q-SOCaaS/CentryOnboarding/raw/main/AzureLighthouse/5QTemplates.zip
   ```
   or
   ```bash
   wget https://github.com/5Q-SOCaaS/CentryOnboarding/raw/main/AzureLighthouse/5QTemplates.zip
   ```
2. Unzip and inspect the file
   - Does the template file have the correct TenantId? Lighthouse groupId? (The answer should be yes)
3. Now to execute the following commands to initiate the lighthouse deployment (via cloud shell)
   ```powershell
   Connect-AzureAD
   .\deployLighthouse.ps1 -V   
   ```
4. Upon successful completion, log out of your 5Q account and back in
5. Go to the azure portal settings and enable the new directory in the 'Directories + Subscriptions' tab
6. Return to main instructions to be begin deploying Sentinel

---

## Links

[Documentation](https://docs.microsoft.com/en-us/azure/lighthouse/)

# Deploy


[![Deploy to Azure](https://aka.ms/deploytoazurebutton)]()
