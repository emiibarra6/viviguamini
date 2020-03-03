class direcciones {

  const direcciones();

  static const String ip = ("http://emiibarra6.com/DBremota/wsJSONConsultarNegocio.php?cat=");

  static const String ipEmergencia = ("https://vivicarhue.000webhostapp.com/DBRemota/wsJSONConsultarEmergencia.php?categoria=");

  static const String ipFarmacia = ("http://emiibarra6.com/DBremota/wsJSONConsultarFarmacia.php");

  static const String ipCategoria = ("http://emiibarra6.com/DBremota/wsJSONConsultarCategoria.php");

  static const String ipSalamone = ("http://emiibarra6.com/DBremota/wsJSONConsultarSalamone.php");


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
