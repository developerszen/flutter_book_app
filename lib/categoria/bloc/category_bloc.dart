import 'dart:convert';

import 'package:book_app/auth/bloc/auth_bloc.dart';
import 'package:book_app/auth/bloc/session_bloc.dart';
import 'package:book_app/categoria/model/category_model.dart';
import 'package:book_app/repository/api_repository.dart';
import 'package:http/http.dart' as http;

class CategoryBloc {
    final _authBloc = AuthBloc();
    final _urlHost = '${ApiRepository.apiHost}';

    Future<List<CategoryModel>> listCategories() async {
        final token = await _authBloc.getAccessToken();
        final url = '$_urlHost/categories';

        final res = await http.get(
            url,
            headers: {
                "Accept"        : "application/json",
                "Content-Type"   : "application/json",
                "Authorization" : "Bearer $token"
            }
        );

        final decodedData = json.decode(res.body);

        if (res.statusCode == 200){
            final List<CategoryModel> categories = new List();

            if( decodedData == null ) return [];

            decodedData.forEach((category){
                final temp = CategoryModel.fromJson(category);
                categories.add(temp);
            });
            return categories;
        } else if (res.statusCode == 401){
            await Session().clear();
        }
        return null;
    }

    Future<bool> createCategory (CategoryModel data) async {
        final token = await _authBloc.getAccessToken();
        final url = '$_urlHost/categories/';

        final res = await http.post(
            url,
            headers: {
                "Accept"        : "application/json",
                "Content-Type"  : "application/json",
                "Authorization" : "Bearer $token"
            },
            body: categoryModelToJson(data),
        );
        return true;
    }

    Future<bool> editCategory (CategoryModel data) async {
        final token = await _authBloc.getAccessToken();
        final url = '$_urlHost/categories/${data.id}';

        final res = await http.put(
            url,
            headers: {
                "Accept"        : "application/json",
                "Content-Type"   : "application/json",
                "Authorization" : "Bearer $token"
            },
            body: categoryModelToJson(data)
        );
        return true;
    }

    Future<bool> deleteCategory (int id) async {
        final token = await _authBloc.getAccessToken();
        final url = '$_urlHost/categories/$id';

        final res = await http.delete(
            url,
            headers: {
                "Accept"        : "application/json",
                "Content-Type"   : "application/json",
                "Authorization" : "Bearer $token"
            },
        );
        return true;
    }
}