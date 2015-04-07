## Catalog V 1.0.0

Un sistema de manejo y control de catalogos integrado al CMS de inyxtech. Este modulo puedo almacenar y ordenar imagenes asi como tambien servicos multimedia en la nube como Youtube, Vimeo y Soundcloud.

## Caracteristicas

- Catalogo de Imagenes, Audio y Video.
- Configuración para personalización

## Requerimientos

* Ruby >= 1.9.3
* Rails >= 3.0.0

## Instalación

Añadir la siguiente linea a su Gemfile

```ruby
gem 'inyx_catalog_rails', git: 'https://github.com/inyxtech/inyx_catalog_rails.git'

```

Ubicarse en la ruta del proyecto desde la terminal y ejecutar

```ruby
Bundle install
```

```ruby
rake inyx_catalog_rails:install:migrations
rake db:migrate
```

añadir la siguiente linea a su manifesto javascript `admin/application.js`

```ruby
//= require inyx_catalog_rails/application
```

añadir la siguiente linea a su manifesto javascript `admin/application.css`

```ruby
*= require inyx_catalog_rails/application
```

añadir la siguiente ruta a su archivo routes.rb

```ruby
mount InyxCatalogRails::Engine, :at => '', as: 'catalog'
```

Por ultimo ir al directorio `app/assets/javascript/` y abrir el archivo main.js y agregar 'catalog' a la suigiente linea de codigo codigo, ejemplo:

```ruby
angular.module('inyxmater', ['admin']) #antes

angular.module('inyxmater', ['admin', 'catalog']) #despues
```

## Configuración

Para agregar `config/initializers/inyx_catalog.rb` y asi estabelecer los datos de configuración, debe ejecutar

```ruby
rake catalog:copy_initializer
```
## Vistas

Para copiar las vistas en `app/views/inyx_catalog_rails` y asi personalizarlas para adaptarlas a sus necesidades, debe ejecutar

```ruby
rake catalog:copy_views
```