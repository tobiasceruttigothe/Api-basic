Instalación
----------

En el servidor destino ejecutar

    cd /usr/local
    git config --global user.name "${HOSTNAME}"
    git config --global user.email "${HOSTNAME}@localhost"
    git config --global push.default matching
    cd /usr/local/psi-ws-api
    git checkout -b ${HOSTNAME} origin/main
    git push origin HEAD
    install/deploy.sh
    journalctl -u psi-ws-api

Verificar que el servicio esté funcionando 

    ps aux | grep psi-ws-api
    netstat -ntpl | grep 9090

Apertura de firewall
--------------------

Debe habilitar el puerto del servicio en el firewall para cada dirección IP que vaya a utilizarlo

    ufw allow from <ip_addr> to any port 9090 proto tcp
    ufw status numbered

Verifique que el puerto este abierto para la dirección necesaria

Configuración del servicio
--------------------------

Para cada entrypoint a definir debe existir un correspondiente script en /usr/local/psi-ws-api/bin/ con permisos de ejecución (775|755)

Editar /usr/local/psi-ws-api/conf/psi-ws-api.conf y agregar el bloque correspondiente al script, por ejemplo

    {
        "URL":"/args",
        "Run":"./args.sh",
        "Desc":"Runs script with argunments like 'key=val' in URL"
    }

Vea los ejemplos y respete la sintaxis e identación

    jq < psi-ws-api.conf

Realice un commit de los cambios

    git add bin/*
    git commit -a -m "Nota de cambios"
    git push

Al finalizar reinicie el servicio

    systemctl restart psi-ws-api


....
