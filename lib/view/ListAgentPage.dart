import 'package:flutter/material.dart';
import 'package:rev_responsi/services/apiDataSource.dart';
import 'package:rev_responsi/model/modelAgent.dart';
import 'package:rev_responsi/view/DetailAgentPage.dart';
import 'package:rev_responsi/view/mainPage.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Agent',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            back(context); // Pass context to back function
          },
        ),
      ),
      body: _buildListAgent(),
    );
  }

  Widget _buildListAgent() {
    return Container(
      padding: EdgeInsets.all(10),
      child: FutureBuilder(
        future: ApiDataSource.instance.loadAgent(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _buildLoading();
          } else if (snapshot.hasError) {
            return _buildError();
          } else if (snapshot.hasData) {
            ModelAgent agent = ModelAgent.fromJson(snapshot.data);
            return _buildListView(agent);
          }
          return _buildError(); // Handle other cases as error
        },
      ),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildError() {
    return Center(
      child: Text("Error loading data."),
    );
  }

  Widget _buildListView(ModelAgent agent) {
    return ListView.builder(
      itemCount: agent.data!.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildItem(agent.data![index]);
      },
    );
  }

  Widget _buildItem(Data agentData) {
    return ListTile(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailAgent(
            uuid: agentData.uuid!,
            name: agentData.displayName!,
          ),
        ),
      ),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(agentData.displayIcon!),
      ),
      title: Text(agentData.displayName!),
    );
  }

  void back(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MainPage()),
    );
  }
}
