public class Entradas
{
    public int EntradaID { get; set; }
    public int Precio { get; set; }
    public string Asiento { get; set; }
    public int PartidoId { get; set; }
    public bool Disponible {get;set;}
    public int Cantidad { get; set; }


    public Entradas(){}

    public Entradas(int entradaid, int precio, string asiento, int partidoid, int cantidad, bool disponible){
        EntradaID=entradaid;
        Precio=precio;
        Asiento=asiento;
        PartidoId=partidoid;
        Cantidad=cantidad;
        Disponible = disponible;
    }
}