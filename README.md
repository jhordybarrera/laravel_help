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


## Composer
```
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && php composer-setup.php && php -r "unlink('composer-setup.php');" && sudo mv composer.phar /usr/local/bin/composer
```
## Composer global binaries
```
nano ~/.profile
```

```
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
sudo chown -R $USER:www-data storage/ && sudo chown -R $USER:www-data bootstrap/cache/ && sudo chmod -R 775 storage/ && sudo chmod -R 775 bootstrap/cache/
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


## Laravel Español


```
composer require laravel-lang/lang --dev
```

```
cp -r vendor/laravel-lang/lang/locales/es/ resources/lang/
```

```
cp resources/lang/es/es.json resources/lang/
```


## Laravel Google Captcha V2
```
composer require buzz/laravel-google-captcha
```
```
php artisan vendor:publish --provider="Buzz\LaravelGoogleCaptcha\CaptchaServiceProvider"
```

**Configuración .env**
```
CAPTCHA_SECRET=[secret-key]
CAPTCHA_SITEKEY=[site-key]
```

**Mostrar captcha en formulario blade**
```
{!! app('captcha')->display() !!}
```

**Añadir la regla de validación**
```
'g-recaptcha-response' => 'required|captcha'
```
