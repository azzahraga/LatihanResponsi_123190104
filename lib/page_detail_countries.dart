import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model.dart';
import 'github_data_source.dart';
import 'search.dart';

class PageDetailCountries extends StatefulWidget {
  const PageDetailCountries({Key? key}) : super(key: key);

  @override
  _PageDetailCountriesState createState() => _PageDetailCountriesState();
}

class _PageDetailCountriesState extends State<PageDetailCountries> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Countries Detail"),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: SearchUser());
            },
            icon: Icon(Icons.search_sharp),
          )
        ],
      ),
      // body: _buildDetailCountriesBody(),
    );
  }

  // Widget _buildDetailCountriesBody() {
  //   return Container(
  //     child: FutureBuilder(
  //       future: GithubDataSource.instance.loadUser(username),
  //       builder: (
  //           BuildContext context,
  //           AsyncSnapshot<dynamic> snapshot,
  //           ) {
  //         if (snapshot.hasError) {
  //           return _buildErrorSection();
  //         }
  //         if (snapshot.hasData) {
  //           CountriesModel countriesModel =
  //           CountriesModel.fromJson(snapshot.data);
  //           return _buildSuccessSection(countriesModel);
  //         }
  //         return _buildLoadingSection();
  //       },
  //     ),
  //   );
  // }
  //
  // Widget _buildErrorSection() {
  //   return Text("Error");
  // }
  //
  // Widget _buildEmptySection() {
  //   return Text("Empty");
  // }
  //
  // Widget _buildLoadingSection() {
  //   return Center(
  //     child: CircularProgressIndicator(),
  //   );
  // }
  //
  // Widget _buildSuccessSection(CountriesModel data) {
  //   return ListView.builder(
  //     itemBuilder: (BuildContext context, int index) {
  //       return Card(
  //           child:Column(
  //             children: [
  //               ListTile(
  //                   title: Text("${data.countries?[index].name}"),
  //                   subtitle:Text("${data.countries?[index].iso3}")
  //               )
  //             ],
  //           )
  //
  //       );
  //     },
  //     itemCount: data.countries?.length,
  //   );
  // }
  //
  // Widget _buildItemCountries(String value) {
  //   return Text(value);
  // }
}