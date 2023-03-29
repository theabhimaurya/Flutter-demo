import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localdbcrud/view/pages/movies_details_page.dart';
import 'package:localdbcrud/view/shared_widget/custom_label.dart';
import 'package:localdbcrud/view_model/product_bloc.dart';
import 'package:localdbcrud/view_model/product_event.dart';
import 'package:localdbcrud/view_model/product_state.dart';
import 'package:provider/src/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesListPage extends StatefulWidget {
  const MoviesListPage({Key? key}) : super(key: key);

  @override
  State<MoviesListPage> createState() => _MoviesListPageState();
}

class _MoviesListPageState extends State<MoviesListPage> {
  triggerUserEvent(ProductEvent event) {
    context.read<ProductBloc>().add(event);
  }

  @override
  void initState() {
    super.initState();
    triggerUserEvent(GetMoviesEvent(context: context));
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
      isLoading = state.isloading ?? false;
      print("the loading is =======>>>> $isLoading");
      return (isLoading != null && isLoading)
          ? ListView.builder(
              shrinkWrap: true,
              itemCount: state.moviesModel?.results?.length,
              itemBuilder: (BuildContext context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MoviesDetailsPage(
                                  index: state.moviesModel?.results?[index],
                                )));
                  },
                  child: Card(
                    child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.green,
                              Color.fromARGB(255, 29, 221, 163)
                            ],
                          ),
                        ),
                        // height: height * 0.13,
                        child: CustomLabel(
                          text: '${state.moviesModel?.results?[index]?.title}',
                          size: 20,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                );
              })
          : Center(child: CircularProgressIndicator());
    }));
  }
}
