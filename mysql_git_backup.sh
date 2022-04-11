#!/bin/bash
directory=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd -P )
filename='.env'
backupdir='backup'
cd $directory
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
            mysqldump -h localhost --user=$un --password=$pw --databases $db  > $directory/$backupdir/$db.sql;
            echo "Backup mysql realizado correctamente"
        else
            echo "Error: Directorio '$backupdir' no existe."
        fi
        git add .;
        git commit -m "Backup automatico: $(date +%c)";
        git pull origin main;
        git push origin main;
        echo "Git pull y push realizado correctamente"
    fi
else
    echo "El archivo '$filename' no existe en '$directory', no se realizó ninguna acción";
fi

echo "Gracias por usar, https://github.com/jbarreraballestas"
