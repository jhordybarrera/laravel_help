#!/bin/bash
ENDCOLOR="\e[0m"
YELLOW="\e[33m"
RED="\e[31m"
GREEN="\e[32m"
directory=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd -P )
filename='.env'
backupdir='backup'
cd $directory
if [ -d "$backupdir" ]; then
else
    echo -e "${RED}Directorio '$backupdir' no existe, será creado.${ENDCOLOR}"
    mkdir $backupdir
fi

if [[ -f "$filename" ]]; then
    while read line; do
        if [[ "$line" == *"DB_DATABASE"* ]]; then
        db=${line#*=}
        fi
        if [[ "$line" == *"DB_USERNAME"* ]]; then
        un=${line#*=}
        fi
        if [[ "$line" == *"DB_PASSWORD"* ]]; then
        pw=${line#*=}
        fi
    done < $filename

    if test -z "$db" & test -z "$un" & test -z "$pw"; then
        echo "Error leyendo los datos"
    else
        if [ -d "$backupdir" ]; then
            pw=${pw//\"/}
            mysqldump -h localhost --user=$un --password=$pw --databases $db  > $directory/$backupdir/$db.sql;
            # echo "mysqldump -h localhost --user=$un --password=$pw --databases $db  > $directory/$backupdir/$db.sql"
            echo -e "${YELLOW}Backup mysql realizado correctamente${ENDCOLOR}"
        else
            echo -e "${RED}Directorio '$backupdir' no existe, será creado.${ENDCOLOR}"
            mkdir $backupdir
        fi
        git add .;
        git commit -m "Backup automatico: $(date +%c)";
        git pull origin main;
        git push origin main;
        echo -e "${YELLOW}Git pull y push realizado correctamente${ENDCOLOR}"
    fi
else
    echo -e "${RED}El archivo '$filename' no existe en '$directory', no se realizó ninguna acción${ENDCOLOR}";
fi

echo -e "${GREEN}Gracias por usar, https://github.com/jbarreraballestas${ENDCOLOR}"
