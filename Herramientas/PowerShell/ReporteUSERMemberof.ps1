$GroupName = "vpn_Organiz" # Reemplazar con el nombre del grupo de AD
$ReportPath = "C:\reporteGDD_batlas.csv" # Ruta donde se guardará el archivo CSV

# Obtener los miembros del grupo especificado
$GroupMembers = Get-ADGroupMember -Identity $GroupName -Recursive | Where-Object {$_.objectClass -eq "user"}

# Recorrer cada miembro del grupo
$UserReport = @()
foreach ($Member in $GroupMembers) {
    # Obtener información del usuario y sus grupos de pertenencia
    $User = Get-ADUser -Identity $Member.SamAccountName -Properties MemberOf
    $UserGroups = $User.MemberOf | ForEach-Object { (Get-ADGroup $_).Name }

    # Agregar el usuario y sus grupos de pertenencia al reporte, una fila por cada grupo de pertenencia
    foreach ($UserGroup in $UserGroups) {
        $UserReport += [PSCustomObject]@{
            NombreUsuario = $User.Name
            NombreGrupo = $GroupName
            GrupoPertenencia = $UserGroup
        }
    }
}

# Exportar el reporte a un archivo CSV
$UserReport | Export-Csv -Path $ReportPath -NoTypeInformation
