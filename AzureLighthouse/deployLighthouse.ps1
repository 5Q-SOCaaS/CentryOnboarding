param(
    [Parameter(Mandatory = $true)]$Location
)


$Resource = 'LightHouse'
$TemplateFile = 'lighthouse.template.json'
$ParameterFile = 'lighthouse.parameters.json'


$today = Get-Date -Format "MM-dd-yyyy"
$suffix = Get-Random -Maximum 100
$deploySuffix = $today + "_$suffix"
$DeploymentName = $deploySuffix + "_$Resource"


New-AzDeployment -Name $DeploymentName `
    -Location $Location `
    -TemplateFile $TemplateFile `
    -TemplateParameterFile $ParameterFile `
    -Verbose