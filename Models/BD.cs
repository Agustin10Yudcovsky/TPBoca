using System.Data.SqlClient;
using Dapper;

public static class BD{
    private static string ConnectionString {get; set;} = @"Server=localhost;DataBase=BDBoca;Trusted_Connection=True;";

    public static List<Partido> ObtenerPartidos(){
        List<Partido> user = new List<Partido>();
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "SELECT * FROM Partidos";
            user = db.Query<Partido>(sql).ToList();
        }
        return user;
    }

    public static List<Entradas> ObtenerEntradas(){
        List<Entradas> user = new List<Entradas>();
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "SELECT * FROM Entradas WHERE Disponible ='True'";
            user = db.Query<Entradas>(sql).ToList();
        }
        return user;
    }

    public static List<Noticias> ObtenerNoticias(){
        List<Noticias> user = new List<Noticias>();
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "SELECT * FROM Noticia";
            user = db.Query<Noticias>(sql).ToList();
        }
        return user;
    }

    public static void ActualizarEntrada(int entradaid) {
    using (SqlConnection db = new SqlConnection(ConnectionString)) {
        string sql = @"
            UPDATE Entradas 
            SET 
                Cantidad = Cantidad - 1,
                Disponible = CASE 
                                WHEN Cantidad - 1 <= 0 THEN 0
                                ELSE Disponible
                            END
            WHERE EntradaID = @pentradaid;";
        db.Execute(sql, new { pentradaid = entradaid });
    }
}

    public static List<Entradas> ObtenerEntradasPorPartido(int PartidoID){
        List<Entradas> user = new List<Entradas>();
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "SELECT * FROM Entradas WHERE Disponible ='True' and PartidoID=@PartidoIDp";
            user = db.Query<Entradas>(sql, new{PartidoIDp = PartidoID } ).ToList();
        }
        return user;
    }
    public static List<Entradas> ObtenerEntradasId(int idpartido){
        List<Entradas> user = new List<Entradas>();
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "SELECT * FROM Entradas WHERE Disponible ='True' AND PartidoID = @pidpartido";
            user = db.Query<Entradas>(sql, new{pidpartido = idpartido}).ToList();
        }
        return user;
    }

    public static string ObetenerEstXPar(int IDpartido){
        string user;
        using(SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "SELECT Estadio FROM Partidos WHERE PartidoID = @idpartido";
            user = db.QueryFirstOrDefault<string>(sql, new{idpartido = IDpartido});
        }
        return user;
    }
    public static void AgregarEntrada(Entradas entrada){
        using(SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "INSERT INTO Entradas (Precio, Asiento, PartidoId, Disponible, Cantidad) VALUES (@precio, @asiento, @partidoid, @disponible, @cantidad)";
        db.Execute(sql, new{precio = entrada.Precio, asiento = entrada.Asiento, partidoid = entrada.PartidoId, disponible = entrada.PartidoId, cantidad = entrada.Cantidad});
        }
    }

    public static void AgregarUsuario(Usuario entrada){
        using(SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "INSERT INTO Socios (Mail, Contraseña) VALUES (@mail, @contraseña)";
            db.Execute(sql, new{mail = entrada.Email, contraseña = entrada.Contraseña});
        }
    }
    public static void AgregarUsuarioN(Admin entradas){
        using(SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "INSERT INTO Administrador (Mail, Contraseña) VALUES (@mail, @contraseña)";
            db.Execute(sql, new{mail = entradas.Email, contraseña = entradas.Contraseña});
        }
      
   
   
    }

    public static Usuario ObtenerUsuario(string Mail){
        Usuario user = null;
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "SELECT * FROM Socios WHERE Mail = @usuario";
            user = db.QueryFirstOrDefault<Usuario>(sql, new {usuario = Mail});                                                              
        }
        return user;
    }
}