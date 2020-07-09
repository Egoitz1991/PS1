$name = [System.Net.Dns]::GetHostByName($name).Hostname


$dir_app = Test-Path "\\10.0.7.26\DOCUMENTACION EUSKAL\INVENTARIO PCS\Apps\"

if (!$dir_info){
    mkdir "\\10.0.7.26\DOCUMENTACION EUSKAL\INVENTARIO PCS\Apps\"
    }
else{
    Write-Host "Ya existe la carpeta de aplicaciones."
    }

$dir_info = "\\10.0.7.26\DOCUMENTACION EUSKAL\INVENTARIO PCS\Apps\"

Get-WmiObject -Class Win32_Product | Select-Object -Property Name > "\\10.0.7.26\DOCUMENTACION EUSKAL\INVENTARIO PCS\Apps\$name.txt"