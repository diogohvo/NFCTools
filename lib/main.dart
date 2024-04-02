import 'package:flutter/material.dart';
import 'package:tester_app/others_page.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'after_read.dart';
import 'before_read.dart';
import 'write_page.dart';
import 'tasks_page.dart';
import 'dart:developer';

void main() => runApp(const HwApp());

class HwApp extends StatelessWidget {
  const HwApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: const HomepageNav(),
    );
  }
}

class HomepageNav extends StatefulWidget {
  const HomepageNav({super.key});

  @override
  State<HomepageNav> createState() => _HomepageNav();
}

class _HomepageNav extends State<HomepageNav> {
  int currentPageIndex = 0;
  final _pageViewController = PageController();
  Widget readPage = BeforeRead(theme: ThemeData.dark(useMaterial3: true));
  Widget writePage = WritePage(theme: ThemeData.dark(useMaterial3: true));
  Widget othersPage = OthersPage(theme: ThemeData.dark(useMaterial3: true));
  Widget tasksPage = TasksPage(theme: ThemeData.dark(useMaterial3: true));
  Map<String, dynamic> tagData = {};
  @override
  void initState() {
    super.initState();
    initializeNFC();
  }

  Future<void> initializeNFC() async {
    try {
      await NfcManager.instance.startSession(
        onDiscovered: (NfcTag tag) async {
          //Tag detetada
          tagData = tag.data;
          setState(() {
            readPage = AfterRead(
              theme: ThemeData.dark(useMaterial3: true),
              tagData: tagData,
            );
          });
          log('Tag discovered: ${tag.data}');
        },
      );
    } catch (e) {
      //tratamento de erros
      log('Error initializing NFC: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NFC Tools"),
      ),
      body: PageView(
        //pageview reconhece gestos e troca de paginas
        controller: _pageViewController, //controlador
        children: <Widget>[
          //--------- Read page
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: readPage, //a página de leitura pode mudar
          ),

          //--------- Write page
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: writePage,
          ),

          //----------- Other's page
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: othersPage,
          ),
          //---------------- Tasks page
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: tasksPage,
          ),
          //----------- fim das páginas
        ],
        onPageChanged: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _pageViewController.animateToPage(index,
              duration: const Duration(milliseconds: 200),
              curve: Curves.bounceOut);
        },
        currentIndex: currentPageIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.remove_red_eye),
            icon: Icon(Icons.remove_red_eye_outlined),
            label: 'Ler',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.keyboard_hide),
            icon: Icon(Icons.keyboard_hide_outlined),
            label: 'Escrever',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.lock),
            icon: Icon(Icons.lock_outlined),
            label: 'Outros',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.access_time_filled),
            icon: Icon(Icons.access_time_outlined),
            label: 'Tarefas',
          ),
        ],
      ),
    );
  }
}
