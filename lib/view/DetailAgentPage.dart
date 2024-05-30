import 'package:flutter/material.dart';
import 'package:rev_responsi/services/apiDataSource.dart';
import 'package:rev_responsi/model/ModelDetailAgent.dart';

class DetailAgent extends StatelessWidget {
  final String uuid, name;
  const DetailAgent({super.key, required this.uuid, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: _buildDetailUser(uuid),
    );
  }

  Widget _buildDetailUser(String uuidDiterima) {
    return Container(
      child: FutureBuilder(
        future: ApiDataSource.instance.loadDetailAgent(uuidDiterima),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return _buildError(snapshot.error);
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _buildLoading();
          }
          if (snapshot.hasData) {
            ModelDetailAgent detailAgent =
                ModelDetailAgent.fromJson(snapshot.data);
            if (detailAgent.data != null) {
              return _buildSuccess(detailAgent.data!);
            } else {
              return _buildError('Data is null');
            }
          }
          return _buildError('No data found');
        },
      ),
    );
  }

  Widget _buildError(Object? error) {
    return Center(
      child: Text("Error: $error"),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccess(Data data) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double itemWidth = (constraints.maxWidth / 2) - 32;
        return ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            if (data.fullPortrait != null && data.fullPortrait!.isNotEmpty)
              Image.network(data.fullPortrait!),
            SizedBox(height: 16.0),
            Text(
              data.displayName ?? 'No Name',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.0),
            Text(
              data.description ?? 'No Description',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16.0),
            if (data.role != null) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ROLE:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Text(
                      data.role!.displayName ?? 'No Role Name',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
            ],
            if (data.abilities != null && data.abilities!.isNotEmpty) ...[
              Text(
                'Abilities:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Wrap(
                spacing: 16.0,
                runSpacing: 16.0,
                children: data.abilities!
                    .map((ability) => Container(
                          color: Colors.blue,
                          width: itemWidth,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (ability.displayIcon != null)
                                Image.network(ability.displayIcon!),
                              SizedBox(height: 8.0),
                              Text(
                                ability.displayName ?? 'No Display Name',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ))
                    .toList(),
              ),
              SizedBox(height: 16.0),
            ],
          ],
        );
      },
    );
  }
}
