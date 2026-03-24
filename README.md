# laravel
## PHP
<a href="https://github.com/jhordybarrera/ubuntu_server_configuration?tab=readme-ov-file#instalar-php" target="_blank">Instalar php en ubuntu</a>

## Reglas de validación de contraseña
```php
// app/Actions/Fortify/PasswordValidationRules.php
protected function passwordRules()
{
    return ['required', 'string', (new Password)->length(6)->requireUppercase()->requireNumeric()->requireSpecialCharacter(), 'confirmed'];
}
```

## Cambiar version de php cli
```bash
sudo update-alternatives --config php
```


## Composer
```bash
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && php composer-setup.php && php -r "unlink('composer-setup.php');" && sudo mv composer.phar /usr/local/bin/composer
```
## Composer global binaries
```bash
nano ~/.profile
```

```bash
# set PATH so it includes composer bin if it exists
if [ -d "$HOME/.config/composer/vendor/bin" ] ; then
    PATH="$HOME/.config/composer/vendor/bin:$PATH"
fi
```

# Laravel instalador global
```bash
composer global require laravel/installer
```

## Crear proyecto laravel usando el instalador global
```bash
laravel new proyectogenial
```

## Crear proyecto laravel usando composer
```bash
composer create-project laravel/laravel proyectogenial
```

## Permisos de directorio

Nunca se debe asignar permisos de escritura al usuario del servidor web sobre archivos de código, unicos directorios donde el usuario web debe tener permisos de escritura storage y bootstrap/cache

**Reempla www-data con tu usuario de servidor web**

```bash
# 1. Tu usuario dueño del proyecto
sudo chown -R $USER:$USER /var/www/mi_proyecto

# 2. storage y bootstrap/cache con grupo www-data
sudo chown -R $USER:www-data /var/www/mi_proyecto/storage
sudo chown -R $USER:www-data /var/www/mi_proyecto/bootstrap/cache

# 3. Permisos adecuados
sudo chmod -R 755 /var/www/mi_proyecto
sudo chmod -R 775 /var/www/mi_proyecto/storage
sudo chmod -R 775 /var/www/mi_proyecto/bootstrap/cache
```
## Permisos si utilizas base de datos sqlite
```bash
sudo chown -R $USER:www-data database
sudo chmod 775 database
sudo chmod 664 database/database.sqlite
```
## Laravel jetstream
```bash
composer require laravel/jetstream
```

```bash
php artisan jetstream:install livewire
```

```bash
npm install && npm run dev && php artisan migrate
```

```bash
php artisan vendor:publish --tag=jetstream-views
```

```bash
php artisan storage:link
```

**Fotos de perfil**
> Descomentar la linea Features::profilePhotos() en config/jetstream.php

## Jetstrap (requiere jetstream)

```bash
composer require nascent-africa/jetstrap --dev
```

```bash
php artisan jetstrap:swap livewire
```

```bash
npm install && npm run dev
```

```bash
npm install && npm run dev
```

```bash
php artisan migrate
```


## Fechas en español colombia
**AppServiceProvider boot() method**
```php
setLocale(LC_TIME,'es_CO.utf8');
Carbon::setLocale(LC_TIME,'es_CO.utf8');
Carbon::setUTF8(true);
```
**Mes de creación en español**
```php
$this->created_at->formatLocalized('%B');
```

## Laravel Google Captcha V2

[biscolab-laravel-recaptcha](https://laravel-recaptcha-docs.biscolab.com/ "Biscolab Laravel Recaptcha")

```bash
composer require buzz/laravel-google-captcha
```
```bash
php artisan vendor:publish --provider="Buzz\LaravelGoogleCaptcha\CaptchaServiceProvider"
```

**Configuración .env**
```
CAPTCHA_SITEKEY=[site-key]
CAPTCHA_SECRET=[secret-key]
```

**Mostrar captcha en formulario blade**
```php
{!! app('captcha')->display() !!}
```

**Añadir la regla de validación**
```php
'g-recaptcha-response' => 'required|captcha'
```

**laravel detras de proxy reverso o en github codespaces**
```php
// app/Providers/AppServiceProvider.php
public function register(): void
{
    // Forzar url y esquema si se detecta un proxy
    if(request()->header('x-forwarded-host') != null){
        // Forzar esquema HTTPS
        URL::forceScheme('https');
    
        // Forzar host y esquema
        URL::forceRootUrl('https://'.request()->header('x-forwarded-host'));
    }
    
}
```
