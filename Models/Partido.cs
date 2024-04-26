public class Partido{
    public int PartidoId {get;set;}
    public DateTime Fechapartido {get;set;}
    public string Rival {get;set;}
    public string Fotorival {get;set;}
    public string Estadio {get;set;}

    public Partido(){

    }

    public Partido(int partidoid, DateTime fechapartido, string rival, string fotorival, string estadio){
        PartidoId = partidoid;
        Fechapartido = fechapartido;
        Rival = rival;
        Fotorival = fotorival;
        Estadio = estadio;
    }
}