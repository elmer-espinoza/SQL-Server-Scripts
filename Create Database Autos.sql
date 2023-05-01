SELECT * FROM Autos;


/*

--USE FACTURACION; 

DROP TABLE Autos; 

CREATE TABLE Autos (
   Placa VARCHAR(10) PRIMARY KEY,
   Marca VARCHAR(15),
   Fabricacion INTEGER,
   Propietario VARCHAR(50),
   Email VARCHAR(50),
   Valor DECIMAL (10,2),
   Inspeccion DATE,
   Disponible BIT); 
   
INSERT INTO Autos (PLACA, MARCA, FABRICACION, PROPIETARIO, EMAIL, VALOR, INSPECCION, DISPONIBLE) VALUES 
('D9G-665', 'TOYOTA', 1995, 'ELMER ESPINOZA', 'elmer.espinoza@gmail.com', 4800, '2022-07-11', 1),
('AKG-635', 'NISSAN', 2005, 'MARICARMEN GOMEZ', 'maricarmen.gomez@gmail.com', 4800, '2022-07-11', 1),
('WRK-234', 'VOLSKWAGEN', 2011, 'MURIEL ELGUERA', 'mueriel.elguera@gmail.com', 4800, '2022-07-11', 1),
('RTF-345', 'HUNDAY', 2012, 'MADOTA SARAVIA', 'madota.saravia@gmail.com', 4800, '2022-07-11', 1),
('IOP-345', 'OPEL', 1974, 'MYCHELLE TOVAR', 'mychelle.tovar@gmail.com', 4800, '2022-07-11', 1),
('WER-345', 'MAZDA', 2004, 'YADIRA JIMENEZ', 'yadira.jimenez@gmail.com', 4800, '2022-07-11', 1),
('NOP-234', 'FIAT', 1985, 'VALENTINA RODRIGUEZ', 'valentina.rodriguez@gmail.com', 4800, '2022-07-11', 1),
('HTR-899', 'BMW', 2017, 'DIANA CRUZ', 'diana.cruz@gmail.com', 4800, '2022-07-11', 1),
('DWP-344', 'AUDI', 2021, 'LADY CERVANTES', 'lady.cervantes@gmail.com', 4800, '2022-07-11', 1); 

SELECT * FROM Autos;

*/

/*


declare @TableName varchar(20) = 'Autos'
declare @ClassName varchar(20) = 'Autos'

select cast(tag as varchar(250)) as class from (
select '[Table (name: "' + @TableName + '")] '  tag, -2 sec union 
select 'public class ' + @ClassName tag, -1 sec union 
select ' {', 0 union 
select ' }', 9999 union 
select case when is_identity = 1 then  '    [Key]' else '' end + char(13) +
         '    public ' + ColumnType + NullableSign + ' ' + ColumnName + ' { get; set; } ', ColumnId 
from
(
    select 
        replace(col.name, ' ', '_') ColumnName,
        column_id ColumnId,
        case typ.name 
            when 'bigint' then 'long'
            when 'binary' then 'byte[]'
            when 'bit' then 'bool'
            when 'char' then 'string'
            when 'date' then 'DateTime'
            when 'datetime' then 'DateTime'
            when 'datetime2' then 'DateTime'
            when 'datetimeoffset' then 'DateTimeOffset'
            when 'decimal' then 'decimal'
            when 'float' then 'double'
            when 'image' then 'byte[]'
            when 'int' then 'int'
            when 'money' then 'decimal'
            when 'nchar' then 'string'
            when 'ntext' then 'string'
            when 'numeric' then 'decimal'
            when 'nvarchar' then 'string'
            when 'real' then 'float'
            when 'smalldatetime' then 'DateTime'
            when 'smallint' then 'short'
            when 'smallmoney' then 'decimal'
            when 'text' then 'string'
            when 'time' then 'TimeSpan'
            when 'timestamp' then 'long'
            when 'tinyint' then 'byte'
            when 'uniqueidentifier' then 'Guid'
            when 'varbinary' then 'byte[]'
            when 'varchar' then 'string'
            else 'UNKNOWN_' + typ.name
        end ColumnType,
        case 
            when col.is_nullable = 1 and typ.name in ('bigint', 'bit', 'date', 'datetime', 'datetime2', 'datetimeoffset', 'decimal', 'float', 'int', 'money', 'numeric', 'real', 'smalldatetime', 'smallint', 'smallmoney', 'time', 'tinyint', 'uniqueidentifier') 
            then '?' 
            else '' 
        end NullableSign, 
        is_identity 
    from sys.columns col
        join sys.types typ on
            col.system_type_id = typ.system_type_id AND col.user_type_id = typ.user_type_id
    where object_id = object_id(@TableName)
) t  union 

select '
        public class '+@ClassName+'Context : DbContext
        {
            public '+@ClassName+'Context(DbContextOptions options) : base(options) { }
            public DbSet<'+@ClassName+'> '+@ClassName+' { get; set; }
        }
        ' ,  10000 

) todo order by sec 



*/

/*

Microsoft.EntityFrameworkCore
Microsoft.EntityFrameworkCore.Design
Microsoft.EntityFrameworkCore.SqlServer

"ConnectionStrings": { "DBServer": "Server=elmer,1433;Database=Facturacion;Trusted_Connection=False;User Id=sa;Password=poison;TrustServerCertificate=True" },

builder.Services.AddDbContext<AutosContext>(opt => opt.UseSqlServer(builder.Configuration.GetConnectionString("DBServer")));

private readonly AutosContext _dbContext;
public HomeController(AutosContext dbcontext) { _dbContext = dbcontext; }


class="btn btn-success"
class="btn btn-primary"
class="btn btn-warning"
class="btn btn-danger"
class="btn btn-info"
class="btn btn-secondary"

return RedirectToAction("Listar");

*/



