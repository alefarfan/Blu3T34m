
$profile = "PruebaAD"
$users = @(
    @{ 
        "Nombre" = "Usuario1"; 
        "Apellido" = "user1"; 
        "Correo" = "user1@petersen.corp" 
    },
    @{ 
        "Nombre" = "Usuario2"; 
        "Apellido" = "user2"; 
        "Correo" = "user2@petersen.corp" 
    }
)
# Esta línea crea una matriz llamada $users. Cada elemento contiene información sobre un usuario, como su nombre, apellido y correo electrónico.

foreach ($user in $users) {
    $nombre = $user["Nombre"]
    $apellido = $user["Apellido"]
    $correo = $user["Correo"]
    $usuario = $nombre.ToLower().Substring(0,1) + $apellido.ToLower()
    $password = ConvertTo-SecureString "contraseña" -AsPlainText -Force
    $ou = "OU=Consultores-PAI,OU=Usuarios,OU=Petersen,DC=petersen,DC=corp"
    New-ADUser -Name "$nombre $apellido" `
              -GivenName $nombre `
              -Surname $apellido `
              -UserPrincipalName "$usuario@dominio.com" `
              -SamAccountName $usuario `
              -EmailAddress $correo `
              -AccountPassword $password `
              -Path $ou `
}
