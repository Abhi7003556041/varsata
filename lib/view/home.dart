import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:varsata/widget/common_widget.dart';
import 'package:http/http.dart' as http;

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  final scrollController = ScrollController();
  List posts = [];
  bool isLoadMore = false;
  bool isHasMore = true;
  int page = 1;
  Future<void> fetchPost() async {
    final url =
        "https://techcrunch.com/wp-json/wp/v2/posts?context=embed&per_page=11&page=$page";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    // print(response.body);
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      if (data.isNotEmpty) {
        setState(() {
          posts = posts + data;
          isHasMore = true;
        });
      } else {
        setState(() {
          isHasMore = false;
          posts = posts;
        });
      }
    } else {
      Get.snackbar('Error', 'Failed');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPost();
    scrollController.addListener(_scrollControl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Varsata'),
        // ),
        backgroundColor: Colors.grey.shade200,
        body:RefreshIndicator(
        onRefresh: _pullRefresh,
        child: ListView.builder(
          controller: scrollController,
          itemCount: isLoadMore ? posts.length + 1 : posts.length,
          padding: const EdgeInsets.only(right: 10,left: 10,bottom: 10,top:10),
          itemBuilder: (context, index) {
            if (index < posts.length-1) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                    child: ListTile(
                  title: Text(
                    posts[index]['title']['rendered'],
                    maxLines: 1,
                  ),
                  subtitle: Text(
                    posts[index]['excerpt']['rendered'],
                    maxLines: 1,
                  ),
                  leading: CircleAvatar(
                    // backgroundImage: NetworkImage(posts[index]['yoast_head_json']['og_image'][0]['url']),
                    child: Text('${index + 1}'),
                  ),
                  onTap: () {
                    // Get.toNamed('/post',arguments: posts[index]);
                  },
                )),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(color: Colors.black,),
              );
            }
          },
        )));
  }

  void _scrollControl() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (isHasMore) {
        if (!isLoadMore) {
          print('loaddingngn');
          setState(() {
            isLoadMore = true;
          });
          page++;
          fetchPost();
          setState(() {
            isLoadMore = false;
          });
        }
      }
    }
  }

  Future<void> _pullRefresh() async {
    final url =
        "https://techcrunch.com/wp-json/wp/v2/posts?context=embed&per_page=11&page=1";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    // print(response.body);
    posts.clear();

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      if (data.isNotEmpty) {
        setState(() {
          page = 1;
          posts = data;
          isHasMore = true;
        });
      } else {
        setState(() {
          isHasMore = false;
          posts = posts;
        });
      }
    } else {
      Get.snackbar('Error', 'Failed');
    }
  }
}
