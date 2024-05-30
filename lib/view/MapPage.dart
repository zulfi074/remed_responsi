import 'package:flutter/material.dart';
import 'package:rev_responsi/model/ModelMap.dart';
import 'package:rev_responsi/services/apiDataSource.dart';
import 'package:rev_responsi/view/mainPage.dart';
import 'package:url_launcher/url_launcher.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Maps',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            back(context);
          },
        ),
      ),
      body: _buildListMap(),
    );
  }

  Widget _buildListMap() {
    return Container(
      padding: EdgeInsets.all(10),
      child: FutureBuilder(
        future: ApiDataSource.instance.loadMap(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return _buildError();
          }
          if (snapshot.hasData) {
            MapModel mapModel = MapModel.fromJson(snapshot.data);
            return _buildSuccess(mapModel);
          }
          return _buildLoading();
        },
      ),
    );
  }

  Widget _buildError() {
    return Center(
      child: Text("Error loading data."),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccess(MapModel data) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      itemCount: data.data!.length,
      itemBuilder: (BuildContext context, index) {
        return _buildItem(data.data![index]);
      },
    );
  }

  Widget _buildItem(Data mapData) {
    return InkWell(
      onTap: () => _launchURL(mapData.displayIcon!),
      child: Card(
        elevation: 3,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(mapData.listViewIcon!),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                mapData.displayName ?? 'No Name',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                mapData.coordinates ?? 'No Coordinates',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunch(uri.toString())) {
      await launch(uri.toString());
    } else {
      throw 'Could not launch $url';
    }
  }

  void back(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MainPage()),
    );
  }
}
