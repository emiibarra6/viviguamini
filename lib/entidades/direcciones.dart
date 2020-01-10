class direcciones {

  const direcciones();

  static const String ip = ("http://emiibarra6.com/DBremota/wsJSONConsultarNegocio.php?cat=");

  static const String ipEmergencia = ("https://vivicarhue.000webhostapp.com/DBRemota/wsJSONConsultarEmergencia.php?categoria=");

  static const String ipFarmacia = ("https://vivicarhue.000webhostapp.com/DBRemota/wsJSONConsultarFarmacia.php");

  static const String ipCategoria = ("http://emiibarra6.com/DBremota/wsJSONConsultarCategoria.php");


}


 class Categoria {

  String categoria;

  String getCategoria()  {
    return categoria;
  }

   setCategoria(String categoria) {
    this.categoria = categoria;
  }




}
