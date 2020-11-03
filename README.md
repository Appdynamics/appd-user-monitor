# AppDynamics User Monitor Extension

A simple AppDynamics extension that can return whether or not a user is logged in on a given machine with a machine agent.

![](https://raw.githubusercontent.com/dustinmoorman/appd-user-monitor/main/img/appd-metrics-browser-for-readme.png)

## Installation

1. Unzip this directory into your `<machine agent>/monitors` directory.
2. You may need to run `Unblock-File -Path ./AppdUserMon.ps1` due to Powershell and signatures.
3. Update `monitor.xml` with the appropriate variables, and restart the Machine Agent!
