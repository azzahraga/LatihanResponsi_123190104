import 'package:flutter/material.dart';
import 'github_data_source.dart';
import 'model.dart';
import 'base_network.dart';

class SearchUser extends SearchDelegate {
  BaseNetwork _userList = BaseNetwork();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: GithubDataSource.instance.loadUser(username),
        builder: (
            BuildContext context,
            AsyncSnapshot<dynamic> snapshot,
            ) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            CountriesModel countriesModel =
            CountriesModel.fromJson(snapshot.data);
            return _buildSuccessSection(countriesModel);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text('Search User'),
    );
  }
  Widget _buildErrorSection() {
    return Text("Error");
  }

  Widget _buildEmptySection() {
    return Text("Empty");
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(CountriesModel data) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Card(
            child:Column(
              children: [
                ListTile(
                    title: Text("${data.countries?[index].name}"),
                    subtitle:Text("${data.countries?[index].iso3}")
                )
              ],
            )

        );
      },
      itemCount: data.countries?.length,
    );
  }

  Widget _buildItemCountries(String value) {
    return Text(value);
  }
}
