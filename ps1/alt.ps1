Param(
[Parameter(Mandatory=$true)]
[string]$nome
)



Clear-Host
(Get-Item H:\inetpub\Suicide\models\$nome.html).BaseName 
(Get-Content -Path H:\inetpub\Suicide\models\$nome.html) | ForEach-Object {$_ -Replace ".jpg`"></a>", ".jpg`" alt=`"$nome`"></a>"} | Set-Content -Path H:\inetpub\Suicide\models\$nome.html