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
