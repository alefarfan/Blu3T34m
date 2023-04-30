
$users = @(
    @{ 
        "Usuario" = "usuario1"; 
        "CambiarAtributo" = @{
            "Description" = "Soporte" 
           
        } 
    },
    @{ 
        "Usuario" = "usuario2"; 
        "CambiarAtributo" = @{
            "Description" = "Departamento:Proteccion" 
            "Title" = "Nuevo cargo de usuario2"
        } 
    }

)

foreach ($user in $users) {
    $usuario = $user["Usuario"]
    $cambiarAtributo = $user["CambiarAtributo"]
    $ou = "OU=User,DC=organizacion,DC=com"
    $userObj = Get-ADUser -Identity $usuario -Properties *

    foreach ($key in $cambiarAtributo.Keys) {
        $userObj.$key = $cambiarAtributo[$key]
    }

    Set-ADUser -Instance $userObj
}
