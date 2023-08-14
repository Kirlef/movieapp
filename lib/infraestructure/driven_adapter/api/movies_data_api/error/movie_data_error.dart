class MovieDataApiError implements Exception{

  @override
  String toString(){
    return 'Error al obtener el dato de la película';
  }
}