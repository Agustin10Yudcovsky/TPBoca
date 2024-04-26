public class Noticias
{
    public int NoticiaID { get; set; }
    public string Titulo { get; set; }
    public DateTime FechaPublicación { get; set; }
    public string Contenido { get; set; }
    

    public Noticias(){}

    public Noticias(int noticiaid, string titulo, DateTime fechapublicación, string contenido){

        NoticiaID=noticiaid;
        Titulo=titulo;
        FechaPublicación=fechapublicación;
        Contenido=contenido;
    }
}
