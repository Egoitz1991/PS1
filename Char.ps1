$name = [System.Net.Dns]::GetHostByName($name).Hostname

$dir_info = Test-Path "\\10.0.7.26\DOCUMENTACION EUSKAL\INVENTARIO PCS\Char\$name"

if (!$dir_info){
    mkdir "\\10.0.7.26\DOCUMENTACION EUSKAL\INVENTARIO PCS\Char\$name"
    }
else{
    Write-Host "Ya existe la carpeta de informacion."
    }

$dir_info = "\\10.0.7.26\DOCUMENTACION EUSKAL\INVENTARIO PCS\Char\$name"

Get-WmiObject -Class Win32_ComputerSystem | Select-Object > "$dir_info\System.txt"

Get-WmiObject -Class Win32_LogicalDisk | Select-Object -Property DeviceID, FreeSpace > "$dir_info\LDisk.txt"

Get-WmiObject -Class Win32_processor | Select-Object -Property DeviceID, Name, Caption > "$dir_info\Processor.txt"

Get-WmiObject -Class Win32_physicalmemory | Select-Object -Property Caption, CreationClassName, Manufacturer, Capacity > "$dir_info\PHMemory.txt"

Get-WmiObject -Class win32_networkadapter | Select-Object -Property ServiceName, MACAddress, DeviceID, Name > "$dir_info\Net.txt"

Get-WmiObject -Class win32_volume | Select-Object __Server, __PATH, BlockSize, Capacity, Caption, FileSystem, FreeSpace, IndexingEnabled, Label   > "$dir_info\HDisk.txt"