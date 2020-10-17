# AppDynamics User Monitor Extension

A simple AppDynamics extension that can return whether or not a user is logged in on a given machine with a machine agent.

## Installation

1. Unzip this directory into your `<machine agent>/monitors` directory.
2. You may need to run `Unblock-File -Path ./AppdUserMon.ps1` due to Powershell and signatures.
3. Update `monitor.xml` with the appropriate variables, and restart the Machine Agent!

## Configuration Note

One value you will need to set in the `monitor.xml` is the TierId.  To find this, open the dashboard for the tier and review the URL. The TierId appears as the component value in the URL.

![](https://docs.appdynamics.com/download/attachments/45488252/componentid.jpg?version=1&modificationDate=1589926629000&api=v2)
