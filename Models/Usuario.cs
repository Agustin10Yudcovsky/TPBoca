public class Usuario{
   
    public string Email {get;set;}
    public string Contraseña {get;set;}
   

    public Usuario(){

    }

    public Usuario(string email, string contrasena){
        Email = email;
        Contraseña = contrasena;
      
    }
    public string GetContraseña(){
        return Contraseña;
    }
}