# PC3

Primero clonamos el repositorio y le damos la configuracion inicial
![](images/Image1.png)

Ahora creamos nuestra rama en la que trabajaremos
![](images/Image2.png)

Usamos bundle install --without production  para descargar las dependencias y especificar que no estamos en un entorno de produccion.

Ahora inicializamos la primera migracion corriendo rake db:migrate
![](images/Image3.png)

Pregunta: ¿Cómo decide Rails dónde y cómo crear la base de datos de desarrollo?    
La configuración para la base de datos de desarrollo se define en el archivo config/database.yml, dentro de la sección development. Por defecto, Rails usa SQLite y crea la base de datos development.sqlite3 en el directorio db.  
Los archivos de migración en db/migrate gestionan cambios en la estructura de la base de datos, mientras que db/schema.rb describen la estructura actual.  
Pregunta: ¿Qué tablas se crearon mediante las migraciones?  
En la migracion que hicimos se creo la tabla Movies.  
Ahora insertaremos las semillas, que son datos iniciales para la tabla usando rake db:seed  
Pregunta: ¿Qué datos de semilla se insertaron y dónde se especificaron?  
Los datos que se generaron se encuentran en db/seeds.rb, ademas al correr el comando rake -T db:seed este nos dice que se cargan desde ese archivo
![](images/Image4.png)

Como vemos, si corremos rails server, nuestra aplicacion ya se ejecuta localmente
![](images/Image5.png)