import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localdbcrud/helper/constants/api_const.dart';
import 'package:localdbcrud/helper/constants/asset_const.dart';
import 'package:localdbcrud/modal/MoviesModelResults.dart';
import 'package:localdbcrud/view/shared_widget/custom_label.dart';
import 'package:localdbcrud/view_model/product_bloc.dart';
import 'package:localdbcrud/view_model/product_event.dart';
import 'package:localdbcrud/view_model/product_state.dart';
import 'package:provider/src/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesDetailsPage extends StatefulWidget {
  final MoviesModelResults? index;

  const MoviesDetailsPage({Key? key, this.index}) : super(key: key);

  @override
  State<MoviesDetailsPage> createState() => _MoviesDetailsPageState();
}

class _MoviesDetailsPageState extends State<MoviesDetailsPage> {
  triggerUserEvent(ProductEvent event) {
    context.read<ProductBloc>().add(event);
  }

  @override
  void initState() {
    super.initState();
    triggerUserEvent(GetMoviesEvent(context: context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          actions: [],
        ),
        body: BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: CustomLabel(
                text: "${widget.index?.title ?? ""}",
                size: 20,
                fontWeight: FontWeight.bold,
              )),
              Center(
                  child: Image.network(
                "${widget.index?.title ?? ""}",
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(ImageConst.jhon, fit: BoxFit.fitWidth);
                },
              ))
            ],
          );
        }));
  }
}
