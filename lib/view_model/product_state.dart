import 'package:localdbcrud/modal/MoviesModelResults.dart';
import 'package:localdbcrud/modal/ResponseModelData.dart';

class ProductState {
  final ProductModel? responseModel;
  final MoviesModel? moviesModel;
  final bool ? isloading;

  ProductState({this.responseModel,this.moviesModel,this.isloading});

  ProductState copyWith({
    final ProductModel? responseModel,
    final MoviesModel? moviesModel,
    final bool ? isloading



  }) {
    return ProductState(
      responseModel: responseModel ?? this.responseModel,
      moviesModel: moviesModel?? this.moviesModel,
        isloading: isloading?? this.isloading
    );
  }

  @override
  String toString() {
    return "ProductState{responseModel:$responseModel, moviesmodel:$moviesModel,isloading:$isloading}";
  }
}
