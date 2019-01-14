########################################################################
# Name Enable/Disable Windows Web Proxy
# Version v0.0.1
# Date 20170808
# Created By Erwin Bierens
# Web Site https://erwinbierens.com
########################################################################

function Show-Menu
{
     param (
           [string]$Title = 'Enable/Disable Windows Web Proxy'
     )
     cls
     Write-Host "================ $Title ================"
     Write-Host -foregroundcolor "yellow"
     Write-Host ""
     Write-Host "Please select one of the options:"
     Write-Host ""
     Write-Host "1: Enable Windows Web Proxy."
     Write-Host "2: Disable Windows Web Proxy"
     Write-Host "3: Set Web Proxy Server"
	 Write-Host "4: Show current settings"
     Write-Host ""

     Write-Host "Q: Press 'Q' to quit."
}

do
{
     Show-Menu
     $input = Read-Host "Please make a choice"

     switch ($input)
     {
           '1' {
                cls
                'The Web Proxy is now enabled!'
                set-itemproperty 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings' -Name ProxyEnable -value 1
           } '2' {
                cls
                'The Web Proxy is now disabled!'
                set-itemproperty 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings' -Name ProxyEnable -value 0
           } '3' {
                cls
                'Please fill in the proxy server!'
				$ProxyServer = Read-Host -Prompt 'airinlxprxyn01.nmumarl.lntinfotech.com:8080'
				'Proxy Server is set!'
                set-itemproperty 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings' -Name ProxyServer -Value "$ProxyServer"
           } '4' {
                cls
                'Current Settings'
				'ProxyEnable: 1 = Enabled, 0 = Disabled'
				get-itemproperty 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings' -Name ProxyServer,ProxyEnable
		   } 'r' {
                cls
                'The Computer will be rebooted right now.. I will be back, like terminator'
                Restart-computer -Force
           } 'q' {
                return
           }
     }
     pause
}
until ($input -eq 'q')
