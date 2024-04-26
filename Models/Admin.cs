public class Admin{
   
    public string Email {get;set;}
    public string Contraseña {get;set;}
   

    public Admin(){

    }

    public Admin(string email, string contrasena){
        Email = email;
        Contraseña = contrasena;
      
    }
}