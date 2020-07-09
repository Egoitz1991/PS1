$dir_inf = Test-Path "\\10.0.7.26\DOCUMENTACION EUSKAL\INFORMATICA\INVENTARIO\"
$dir_ini = Test-Path "\\10.0.7.26\DOCUMENTACION EUSKAL\INVENTARIO PCS\"

if (!$dir_inf){
    mkdir "\\10.0.7.26\DOCUMENTACION EUSKAL\INFORMATICA\INVENTARIO\"
    }
else{
    Write-Host "Ya existe la carpeta en Informatica."
    }

if (!$dir_ini){
    mkdir "\\10.0.7.26\DOCUMENTACION EUSKAL\INVENTARIO PCS\"
    }
else{
    Write-Host "Ya existe la carpeta de paso."
    }

$dir_inf = "\\10.0.7.26\DOCUMENTACION EUSKAL\INFORMATICA\INVENTARIO\"
$dir_ini = "\\10.0.7.26\DOCUMENTACION EUSKAL\INVENTARIO PCS\"

Copy-Item $dir_ini\* $dir_inf -Recurse -Force

Remove-Item $dir_ini\* -Recurse -Force