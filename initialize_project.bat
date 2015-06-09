REM muevo INPUTs a un directorio común
echo D | xcopy INPUTs C:\BI\INPUTs /S /E
copy Datos_Usuarios.xsd C:\BI\Ascii

REM cargo scripts SQL
sqlcmd -S localhost -i crear_base_de_datos.sql
sqlcmd -S localhost -i crear_tablas.sql
sqlcmd -S localhost -i cargar_dimension_tiempo.sql