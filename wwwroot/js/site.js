function ObtenerEstadioPorPartido(idpartido) {
    console.log("a");
    $.ajax({
        type: 'POST',
        dataType: 'JSON',
        url: '/Home/EstadioPorPartido',
        data:{Idpartido:idpartido},
        success: function (response) {
            console.log("a");
            $("#Estadio").html("Nombre del Estadio: " + response.estadio);
        },
        error: function (error) {
            console.error("Error", error);
        }
    });
}
