// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test_dtac/view_model/data_view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Data Information"),),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    ListDataViewModel listDataViewModel = ListDataViewModel();
    return FutureBuilder(
      future: listDataViewModel.fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: listDataViewModel.data?.length,
            itemBuilder: (context, index) {
              var info = listDataViewModel.data?[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:ClipRRect(borderRadius: BorderRadius.circular(20), child:  Image.network("${info?.result?.picture.large}"),
                          )),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "${info?.result?.name.first} ${info?.result?.name.last}"),
                              Text("Gender : ${info?.result?.gender}"),
                              Text("Age : ${info?.result?.dob.age}"),
                              Text("Email : ${info?.result?.email}"),
                              Text("Phone : ${info?.result?.phone}"),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }
}
