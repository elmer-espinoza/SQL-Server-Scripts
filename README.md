# SQL-Server-Scripts



/*

Microsoft.EntityFrameworkCore
Microsoft.EntityFrameworkCore.Design
Microsoft.EntityFrameworkCore.SqlServer
 
*/

/*

declare @TableName varchar(20) = 'Autos'
declare @ClassName varchar(20) = 'Auto'

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
            when col.is_nullable = 1 and typ.name in ('varchar', 'bigint', 'bit', 'date', 'datetime', 'datetime2', 'datetimeoffset', 'decimal', 'float', 'int', 'money', 'numeric', 'real', 'smalldatetime', 'smallint', 'smallmoney', 'time', 'tinyint', 'uniqueidentifier') 
            then '' 
            else '?' 
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
            public DbSet<'+@ClassName+'> '+@ClassName+'s { get; set; }
        }
        ' ,  10000 

) todo order by sec 



*/

/*

"ConnectionStrings": { "DBServer": "Server=azureelmersqlserver.database.windows.net;Database=Azure_Elmer_SQLServer;User Id=elmer.espinoza;Password=P@ssw0rd12345;TrustServerCertificate=True" },  

builder.Services.AddDbContext<AutoContext>(opt => opt.UseSqlServer(builder.Configuration.GetConnectionString("DBServer")));

private readonly AutoContext _dbContext;
public HomeController(AutoContext dbcontext) { _dbContext = dbcontext; }

class="btn btn-success"
class="btn btn-primary"
class="btn btn-warning"
class="btn btn-danger"
class="btn btn-info"
class="btn btn-secondary"

return RedirectToAction("Listar");

*/



