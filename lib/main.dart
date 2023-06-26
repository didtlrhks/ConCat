import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '칭찬합시다.',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '칭찬합시다..!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void navigateToLoginPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('회사를 인증해주세요!'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: navigateToLoginPage,
        tooltip: 'Go to Login page',
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _companyName;
  String? _employeeNumber;

  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();
      _login(_companyName!, _employeeNumber!);
    }
  }

  void _login(String companyName, String employeeNumber) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NamesListPage()),
    );
  }
  //dfdfdff

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('회사를 인증해주세요!'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              key: const ValueKey('companyName'),
              validator: (value) {
                if (value!.isEmpty) {
                  return '회사 이름을 입력해주세요.';
                }
                return null;
              },
              onSaved: (value) {
                _companyName = value;
              },
            ),
            TextFormField(
              key: const ValueKey('employeeNumber'),
              validator: (value) {
                if (value!.isEmpty) {
                  return '사원 번호를 입력해주세요.';
                }
                return null;
              },
              onSaved: (value) {
                _employeeNumber = value;
              },
            ),
            ElevatedButton(
              onPressed: _trySubmit,
              child: const Text('로그인'),
            ),
          ],
        ),
      ),
    );
  }
}

// ... (NamesListPage and VotePage classes)

class NamesListPage extends StatelessWidget {
  const NamesListPage({Key? key}) : super(key: key);

  static const List<String> names = ["양시관", "양시관1", "양시관2", "양시관3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('직원 목록'),
      ),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VotePage(name: names[index])),
                );
              },
              child: Text(names[index]),
            ),
          );
        },
      ),
    );
  }
}

class VotePage extends StatelessWidget {
  final String name;

  const VotePage({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$name에게 투표하기'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '투표를 원하시면 아래 버튼을 눌러주세요.',
            ),
            ElevatedButton(
              onPressed: () {
                // Here you can implement your voting logic.
              },
              child: const Text('투표하기'),
            ),
          ],
        ),
      ),
    );
  }
}
