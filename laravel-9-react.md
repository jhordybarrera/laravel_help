# Create new laravel 9 project with react and vite (Not tested on Mix)
```
 composer create-project laravel/laravel LaraReact
```
# Open project with vscode
```
code LaraReact/
```
# Install react
```
npm install react react-dom
```

# Create new react component: resources/js/components/Welcome.jsx
```
import React from "react";
import ReactDOM from "react-dom/client";

export default function Welcome() {
  return (
    <div>Welcome from React</div>
  )
}

ReactDOM.createRoot(document.getElementById("welcome")).render(
    <React.StrictMode>
        <Welcome />
    </React.StrictMode>
);
```

# Add new line for component to file: resources/app.js
```
import './components/Welcome'
```

# Content for default welcome view: resources/views/app.blade.php
```
<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Laravel 9 with React</title>
        @vite(['resources/css/app.css'])
    </head>
    <body>
        <div id="welcome"></div>
        @vite(['resources/js/app.js'])
    </body>
</html>
```

# Ok, you are ready for production (Or maybe not, npm run dev)
```
npm run build
```
# Run
```
php artisan serve
```

# Thanks!
