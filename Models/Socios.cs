public class Socios{
    public int DNI {get;set;}
    public string Email {get;set;}
    public string Contraseña {get;set;}
    public int EntradaID {get;set;}

    public Socios(){

    }

    public Socios(int dni, string email, string contraseña, int entradaid){
        DNI = dni;
        Email = email;
        Contraseña = contraseña;
        EntradaID = entradaid;
    }
    public string GetContrasena(){
        return Contraseña;
    }
}