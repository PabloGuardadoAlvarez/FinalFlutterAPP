import 'package:examen_final_flutter/Model/Question.dart';
import 'package:examen_final_flutter/Settings/SettingsScreen.dart';
import 'package:examen_final_flutter/homescreen/HomePresenter.dart';
import 'package:examen_final_flutter/homescreen/HomeView.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> implements HomeView {
  HomePresenter _homePresenter;
  List<Question> question = [];
  bool _isLoading = true;
  bool _isError = false;

  _HomeScreenState() {
    _homePresenter = HomePresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _homePresenter.fetchData();
  }

  @override
  openSettingsScreen(Question question) {
    Navigator.push(context, MaterialPageRoute(builder: (c) {
      return SettingsScreen(question);
    }));
  }





  @override
  showLoading() {
    setState(() {
      _isLoading = true;
    });
  }

  @override
  hideLoading() {
    setState(() {
      _isLoading = false;
    });
  }

  @override
  showError() {
    setState(() {
      _isError = true;
    });
  }

  @override
  showQuestions(List<Question> question) {
    setState(() {
      this.question = question;
    });
  }

  buildBody() {
    if (_isLoading) {
      return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 90.0),
            child: CircularProgressIndicator(),
          ));
    }
    else if (_isError) {
      return Center(child: Text("Ha habido un error"));
    } else {
      return RefreshIndicator(
        onRefresh: () {
          _homePresenter.fetchData();
        },
        child: ListView.builder(
          itemBuilder: (context, position) {
            return ListTile(
              leading: Icon(Icons.account_circle),
              title:
              Text(question[position].difficulty),
              subtitle: Text(question[position].question),
              onTap: () {
                _homePresenter.elementClicked(question[position]);
              },
            );
          },
          itemCount: question.length,
          reverse: false,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
    );
  }
}