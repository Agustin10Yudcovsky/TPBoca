using Microsoft.AspNetCore.Mvc;

namespace TP11.Controllers;

public class HomeController : Controller
{
    public IActionResult Inicio()
    {
        return View();
    }

    public IActionResult Index()
    {
        return View();
    }


    public IActionResult Partidos()
    {
        ViewBag.partidos = BD.ObtenerPartidos();
        return View("Partidos");
    }
    public IActionResult IniciarSesion()
    {
       
        return View("iniciarses");
    }
    public IActionResult Entradassoc()
    {
        ViewBag.ListaEntradas = BD.ObtenerEntradas();
        ViewBag.partidos = BD.ObtenerPartidos();
        return View("Entradassoc");
    }

    public IActionResult Entradas(){
    ViewBag.ListaEntradas = BD.ObtenerEntradas();
    return View("Entradas");
    }

    public IActionResult Noticias(){
        ViewBag.noticias = BD.ObtenerNoticias();
        return View("Noticias");
    }

    public IActionResult MisEntradas(){
        return View();
    }

    public  IActionResult ComprarEntradas(int entradaid){
        BD.ActualizarEntrada(entradaid);
        return RedirectToAction("Entradas");
    }
    public  IActionResult ComprarEntradassoc(int entradaid){
        BD.ActualizarEntrada(entradaid);
        return RedirectToAction("Entradassoc");
    }

    public IActionResult EntradasPartido(int idpartido){
        ViewBag.ListaEntradas = BD.ObtenerEntradasId(idpartido);
        ViewBag.idpartido = idpartido;
        return View("Entradas");
    }
    public  IActionResult AgregarEntrada(int idpartido){
        ViewBag.idpartido=idpartido;
        return View("AgregarEntrada");
    }
    public  IActionResult NuevaEntrada(int precio, string asiento, int partidoid, int cantidad, bool disponible = true){
        Entradas nueva = new Entradas(0,precio,asiento,partidoid,cantidad,disponible);
        BD.AgregarEntrada(nueva);
        return RedirectToAction("Entradas");
    }
    public  IActionResult NuevoUsuario(string mail , string contraseña){
        Usuario nuevo = new Usuario(mail, contraseña);
        BD.AgregarUsuario(nuevo);
        return RedirectToAction("Inicio");
    }
    
    public  IActionResult NuevoUsuarioAdm(string mail , string contraseña){
        Admin Nuevo = new Admin(mail, contraseña);
        BD.AgregarUsuarioN(Nuevo);
        return View("InicioAdm");
    }

     public string EstadioPorPartido(int Idpartido){
       return  BD.ObetenerEstXPar(Idpartido);
    }

    public IActionResult Logueado(string mail, string contraseña)
    {
        Usuario User = BD.ObtenerUsuario(mail);
        ViewBag.Usuario = User;
        if(BD.ObtenerUsuario(mail) == null || User.GetContraseña() != contraseña){
            ViewBag.Error = "Usuario o contraseña incorrectos";
            return RedirectToAction("IniciarSesion");
            
        }
        else
        {
            return View("InicioAdm");
        }
        return View();
    }
}