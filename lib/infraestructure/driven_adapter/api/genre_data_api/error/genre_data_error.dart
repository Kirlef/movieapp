class GenreDataApiError implements Exception{

  @override
  String toString(){
    return 'Error al obtener los géneros de las películas';
  }
}