$EventId = 16,20,23,150,219,220

$A = Get-WinEvent -MaxEvents 1  -FilterHashTable @{Logname = "System" ; ID = $EventId}
$Message = $A.Message
$EventID = $A.Id
$MachineName = $A.MachineName
$Source = $A.ProviderName


$EmailFrom = "info@euskalexclusivas.com"
$EmailTo = "informatica@euskalexclusivas.com"
$Subject ="Alert From $MachineName"
$Body = "EventID: $EventID`nSource: $Source`nMachineName: $MachineName `nMessage: $Message"
$SMTPServer = "euskalexclusivas-com.correoseguro.dinaserver.com"
$SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 587)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("informatica@euskalexclusivas.com", "In_form_atica01");
$SMTPClient.Send($EmailFrom, $EmailTo, $Subject, $Body)