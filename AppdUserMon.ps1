Clear-Host

$xml = [xml](Get-Content monitor.xml)

$componentXmlNode = Select-Xml -Xml $xml -XPath "//monitor/monitor-run-task/variables/componentId" | Select-Object -ExpandProperty Node
$componentId = $componentXmlNode.'#text'

$machineXmlNode = Select-Xml -Xml $xml -XPath "//monitor/monitor-run-task/variables/machineName" | Select-Object -ExpandProperty Node
$machineName = $machineXmlNode.'#text'

$userXmlNode = Select-Xml -Xml $xml -XPath "//monitor/monitor-run-task/variables/userName" | Select-Object -ExpandProperty Node
$userName = $userXmlNode.'#text'

$metricPrefix = "name=Server|Component:$componentId|Custom Metrics|User Monitor|$machineName|$userName,"

$loggedIn = "value=1"
$notLoggedIn = "value=0"

$checkIsLoggedIn = query user /server:$SERVER | Select-String -Pattern $userName
$checkIsActive = $checkIsLoggedIn | Select-String -Pattern "Active"

if ($checkIsLoggedIn) {
  Write-Host "$userName is logged in, checking if active..."
  if ($checkIsActive) {
      Write-Host "$userName is active, writing 1 to AppDynamics"
  } else {
      Write-Host "$userName is not active, but is logged in, still writing 1 to AppDynamics"
  }
  Write-Host $metricPrefix$loggedIn
} else {
  Write-Host "$userName is not logged in, writing 0 to AppDynamics."
  Write-Host $metricPrefix$notLoggedIn
}