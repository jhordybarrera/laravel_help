# laravel
## PHP
```
sudo apt install php7.4
```

## Reglas de validación de contraseña
> app/Actions/Fortify/PasswordValidationRules.php
```
    protected function passwordRules()
    {
        return ['required', 'string', (new Password)->length(6)->requireUppercase()->requireNumeric()->requireSpecialCharacter(), 'confirmed'];
    }
```

## Cambiar version de php cli
```
sudo update-alternatives --config php
```


# Composer
```
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && php composer-setup.php && php -r "unlink('composer-setup.php');" && sudo mv composer.phar /usr/local/bin/composer
```
