param(
    [Parameter(Mandatory = $true)]$ResourceGroup
)


# Deploy all of these playbooks without downloading or cloning this repository
$today = Get-Date -Format "MM-dd-yyyy"
$suffix = Get-Random -Maximum 100
$deploySuffix = $today + "_$suffix"

# remote deploys
$deploymentName = "AnalyticalRules_Informational_" + $deploySuffix
$remoteUrl = "https://raw.githubusercontent.com/JakeD-5Q/Sentinel-Onboarding/main/Analytical%20Rules/Azure_Sentinel_analytics_rules%20(Informational).json"
$ParameterFile = "Azure_Sentinel_analytics_rules.parameters.json"
New-AzResourceGroupDeployment -Name $deploymentName `
    -ResourceGroupName $ResourceGroup `
    -TemplateUri $remoteUrl `
    -TemplateParameterFile $ParameterFile `
    -Verbose

$deploymentName = "AnalyticalRules_High_" + $deploySuffix
$remoteUrl = "https://raw.githubusercontent.com/JakeD-5Q/Sentinel-Onboarding/main/Analytical%20Rules/Azure_Sentinel_analytics_rules%20(High).json"
New-AzResourceGroupDeployment -Name $deploymentName `
    -ResourceGroupName $ResourceGroup `
    -TemplateUri $remoteUrl `
    -TemplateParameterFile $ParameterFile `
    -Verbose


$deploymentName = "AnalyticalRules_Medium_" + $deploySuffix
$remoteUrl = "https://raw.githubusercontent.com/JakeD-5Q/Sentinel-Onboarding/main/Analytical%20Rules/Azure_Sentinel_analytics_rules%20(Medium).json"
New-AzResourceGroupDeployment -Name $deploymentName `
    -ResourceGroupName $ResourceGroup `
    -TemplateUri $remoteUrl `
    -TemplateParameterFile $ParameterFile `
    -Verbose

$deploymentName = "AnalyticalRules_Low_" + $deploySuffix
$remoteUrl = "https://raw.githubusercontent.com/JakeD-5Q/Sentinel-Onboarding/main/Analytical%20Rules/Azure_Sentinel_analytics_rules%20(Low).json"
New-AzResourceGroupDeployment -Name $deploymentName `
    -ResourceGroupName $ResourceGroup `
    -TemplateUri $remoteUrl `
    -TemplateParameterFile $ParameterFile `
    -Verbose
