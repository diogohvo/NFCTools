import 'package:flutter/material.dart';

/// Flutter code sample for [NavigationBar].

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

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    Widget readPage = BeforeRead(theme: theme);

    return Scaffold(
      appBar: AppBar(
        title: const Text("NFC Tools"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //usado para mudar a página de leitura
          setState(() {
            readPage = AfterRead(theme: theme);
          });
        },
        child: const Icon(Icons.nfc),
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
            child: GestureDetector(
              onTap: () => _dialogBuilder(context),
              child: const Column(
                children: <Widget>[
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.text_snippet),
                      title: Text('Texto'),
                      subtitle: Text('Adicionar Texto'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.add_link),
                      title: Text('URL'),
                      subtitle: Text('Adicionar URL'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.wifi),
                      title: Text('Rede WiFi'),
                      subtitle: Text('Adicionar Rede WiFi'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.share_location),
                      title: Text('Localização'),
                      subtitle: Text('Adicionar Localização'),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //-------------- Other's page
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => _dialogBuilder(context),
              child: const Column(
                children: <Widget>[
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.file_copy),
                      title: Text('Copiar tag'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.delete),
                      title: Text('Apagar tag'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.data_usage),
                      title: Text('Formatar memória'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.lock),
                      title: Text('Bloquear tag'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.vpn_key),
                      title: Text('Definir senha'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //---------------- Tasks page
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => _dialogBuilder(context),
              child: const Column(
                children: <Widget>[
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.settings_suggest),
                      title: Text('Nova tarefa'),
                      subtitle: Text('Adicionar nova tarefa'),
                    ),
                  ),
                ],
              ),
            ),
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

  //---------------caixa de dialogo
  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Escrever na tag NFC'),
          content: const Icon(Icons.nfc, size: 40),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class BeforeRead extends StatelessWidget {
  const BeforeRead({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.nfc, size: 40),
          const SizedBox(height: 22.0),
          Text(
            'Aproxime-se de um disp. NFC',
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(height: 90),
        ],
      ),
    );
  }
}

class AfterRead extends StatelessWidget {
  const AfterRead({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.nfc, size: 40),
          const SizedBox(height: 22.0),
          const Icon(Icons.nfc, size: 40),
          const SizedBox(height: 22.0),
          Text(
            'Dispositivo lido',
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(height: 90),
        ],
      ),
    );
  }
}
