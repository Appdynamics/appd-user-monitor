Clear-Host

$tierId = "testTier"
$machineName = "testMachine01"
$userName = "TestUser"
$metricPrefix = "name=Server|Component:$tierId|Custom Metrics|User Monitor|$machineName|$userName,"

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