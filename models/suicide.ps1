Param(
[Parameter(Mandatory=$true)]
[string]$modella
)

Clear-Host
Write-Output "----------Script per la creazione di pagine Web con immagini Full-Screen----------"
#Crea il file html
New-Item -Path E:\suicide_girl\Suicide\ -Name "$modella.html"

#Aggiunge la struttura della pagina html
@('<!DOCTYPE html>', '<html lang="it">', '<head>', '<meta charset="UTF-8">', '<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">', "<title>$modella</title>", '<link rel="stylesheet" href="css/bootstrap.css">', '<link rel="stylesheet" type="text/css" href="main.css">', '</head>', '<body>', '<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">', '<div class="container">', '<img src="img/favicon-32x32.png" height="32" width="32" alt="favicon"/>', '<a class="navbar-brand js-scroll-trigger" href="http://bertucco.ddns.net/">&nbsp &nbsp bertuccodiego.it</a>', '<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">', '<span class="navbar-toggler-icon"></span>', '</button>', '<div class="collapse navbar-collapse" id="navbarResponsive">', '<ul class="navbar-nav ml-auto">', '<li class="nav-item">', '<a class="nav-link js-scroll-trigger" href="http://bertucco.ddns.net/">Home</a>', '</li>', '<li class="nav-item">', '<a class="nav-link js-scroll-trigger" href="#evidence"></a>', '</li>', '<li class="nav-item">', '<a class="nav-link js-scroll-trigger" href="#models"></a>', '</li>',  '</ul>', '</div>', '</div>', '</nav>' ) +  (Get-Content "E:\suicide_girl\Suicide\$modella.html") | Set-Content "E:\suicide_girl\Suicide\$modella.html"

#Scarica la lista dei file e seleziona i link
$file = (Invoke-WebRequest -Uri "http://bertucco.ddns.net/image/$modella/").Links | Select-Object "outerHTML"

#Modifica il tag dell'immagine
$link = $file -replace "A href=`"", "a href=`"http://bertucco.ddns.net" -replace">$modella", "><img src=`"http://bertucco.ddns.net/image/$modella/$modella" -replace".jpg</A>}", ".jpg`"></a>" -replace "@{outerHTML=", ""

#Aggiunge il link al file html
$link | Add-Content "E:\suicide_girl\Suicide\$modella.html"

#Chiude i tag html
Add-Content -Path "E:\suicide_girl\Suicide\$modella.html" -Value '</body>', '</html>'

#Aggiunge il tag "alt" al file html
Set-Location "E:\suicide_girl\"
.\alt $modella
Sleep 3
.\suicide