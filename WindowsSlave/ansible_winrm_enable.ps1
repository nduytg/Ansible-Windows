# Author: nduytg
# Script cai dat Client Windows Server dung WinRM, ket noi bang Certificate (giong SSH key pair)

# Call script Import Cert
powershell C:\ansible_winrm\createAdminAccount.ps1
Remove-Item C:\ansible_winrm\createAdminAccount.ps1

powershell C:\ansible_winrm\import_cert.ps1
Remove-Item C:\ansible_winrm\import_cert.ps1

# Cai dat winrm - quiet mode + HTTPS + listen on private IP
#winrm quickconfig -quiet -transport:https

# Allow chung thuc bang Certificate (tuong tu nhu RSA Key Pair)
winrm set winrm/config/service/auth '@{Certificate="true"}'

# Allow Hosts, sau nay can thi them vo
winrm set winrm/config/client '@{TrustedHosts = "10.10.84.0/24"}'

