cd /Desktop 
echo FECHA / HORA >> tiageSISG.txt
date /t>>tiageSISG.txt & time /t >>tiageSISG.txt
echo CONFIGURACION HORARIA >> tiageSISG.txt
tzutil /g>> tiageSISG.txt &
echo INFORMACION DEL SISTEMA >> tiageSISG.txt
systeminfo>> tiageSISG.txt
echo VERSION DEL SISTEMA >> tiageSISG.txt
VER >> tiageSISG.txt
echo CONEXIONES ESTABLECIDAS >>tiageSISG.txt &
netstat -an | findstr /i "established">> tiageSISG.txt
echo CONEXIONES DE RED >>tiageSISG.txt
ipconfig /all >> tiageSISG.txt
echo Net Bios >>tiageSISG.txt
nbtstat -S >> tiageSISG.txt
echo TABLA ARP >>tiageSISG.txt
arp -a >> tiageSISG.txt
echo MAC POR INTERFAZ >> tiageSISG.txt
getmac /V >> tiageSISG.txt
echo PROCESOS EN EJECUCION >> tiageSISG.txt
tasklist >> tiageSISG.txt
query process  >> tiageSISG.txt
echo SERVICIOS EN EJECUCION >> tiageSISG.txt
sc query >> tiageSISG.txt
echo TAREAS PROGRAMADAS  >> tiageSISG.txt
schtasks >> tiageSISG.txt
echo USUARIOS DEL EQUIPO >> tiageSISG.txt
net user >> tiageSISG.txt
ipconfig /displaydns | find /i "name" >> tiageSISG.txt
echo Sessiones de Equipo >> tiageSISG.txt
query session >> tiageSISG.txt
