# laravel
## PHP
<a href="https://github.com/jhordybarrera/ubuntu_server_configuration?tab=readme-ov-file#instalar-php" target="_blank">Instalar php en ubuntu</a>

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


## Composer
```
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && php composer-setup.php && php -r "unlink('composer-setup.php');" && sudo mv composer.phar /usr/local/bin/composer
```
## Composer global binaries
```
nano ~/.profile
```

```
# set PATH so it includes composer bin if it exists
if [ -d "$HOME/.config/composer/vendor/bin" ] ; then
    PATH="$HOME/.config/composer/vendor/bin:$PATH"
fi
```

# Laravel instalador global
```
composer global require laravel/installer
```

## Crear proyecto laravel usando composer
```
composer create-project laravel/laravel proyectogenial
```

## Permisos de directorio
```
sudo chown -R $USER:www-data storage bootstrap/cache/ && sudo chmod -R 775 storage bootstrap/cache/
```
## Permisos sqlite
```
sudo chown -R $USER:www-data database && sudo chmod -R 775 database
```
## Laravel jetstream
```
composer require laravel/jetstream
```

```
php artisan jetstream:install livewire
```

```
npm install && npm run dev && php artisan migrate
```

```
php artisan vendor:publish --tag=jetstream-views
```

```
php artisan storage:link
```

**Fotos de perfil**
> Descomentar la linea Features::profilePhotos() en config/jetstream.php

## Jetstrap (requiere jetstream)

```
composer require nascent-africa/jetstrap --dev
```

```
php artisan jetstrap:swap livewire
```

```
npm install && npm run dev
```

```
npm install && npm run dev
```

```
php artisan migrate
```


## Fechas en español colombia
**AppServiceProvider boot() method**
```
setLocale(LC_TIME,'es_CO.utf8');
Carbon::setLocale(LC_TIME,'es_CO.utf8');
Carbon::setUTF8(true);
```
**Mes de creación en español**
```
$this->created_at->formatLocalized('%B');
```

## Laravel Google Captcha V2

[biscolab-laravel-recaptcha](https://laravel-recaptcha-docs.biscolab.com/ "Biscolab Laravel Recaptcha")

```
composer require buzz/laravel-google-captcha
```
```
php artisan vendor:publish --provider="Buzz\LaravelGoogleCaptcha\CaptchaServiceProvider"
```

**Configuración .env**
```
CAPTCHA_SITEKEY=[site-key]
CAPTCHA_SECRET=[secret-key]
```

**Mostrar captcha en formulario blade**
```
{!! app('captcha')->display() !!}
```

**Añadir la regla de validación**
```
'g-recaptcha-response' => 'required|captcha'
```
