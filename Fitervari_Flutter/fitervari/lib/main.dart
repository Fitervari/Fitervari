import 'package:flutter/material.dart';
import 'package:wearable_communicator/wearable_communicator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController _controller;
  String value = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();

    WearableListener.listenForMessage((msg) {
      print(msg);
    });
    WearableListener.listenForDataLayer((msg) {
      print(msg);
    });
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                    border: InputBorder.none, labelText: 'Enter some text'),
                onChanged: (String val) async {
                  setState(() {
                    value = val;
                  });
                },
              ),
              RaisedButton(
                child: Text('Send message to wearable'),
                onPressed: () {
                  primaryFocus.unfocus(disposition: UnfocusDisposition.scope);
                  WearableCommunicator.sendMessage({"text": value});
                },
              ),
              RaisedButton(
                child: Text('set data on wearable'),
                onPressed: () {
                  primaryFocus.unfocus(disposition: UnfocusDisposition.scope);
                  WearableCommunicator.setData("message", {
                    "text": value != ""
                        ? value
                        : "test", // ensure we have at least empty string
                    "integerValue": 1,
                    "intList": [1, 2, 3],
                    "stringList": ["one", "two", "three"],
                    "floatList": [1.0, 2.4, 3.6],
                    "longList": []
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:client_server_lan/client_server_lan.dart';
import 'package:device_info/device_info.dart';

import 'city.dart';
import 'client_page.dart';
import 'server_page.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UDPLANtransfer',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool kIsAndroid = false;
  String dropdownValue = 'Server';
  bool isLoading = false;
  String dataReceived = '';
  bool isRunning = false;
  String status = '';

  // Server
  ServerNode server;
  List<ConnectedClientNode> connectedClientNodes = [];

  // Client
  ClientNode client;

  @override
  Widget build(BuildContext context) {
    kIsAndroid =
        !kIsWeb && Theme.of(context).platform == TargetPlatform.android;
    return Scaffold(
      appBar: AppBar(
        title: Text('UDPLANtransfer'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildDropdown(),
            Expanded(
              child: dropdownValue == 'Server'
                  ? ServerPage(
                      onStartPressed: startServer,
                      onDisposePressed: disposeServer,
                      connectedClientNodes: connectedClientNodes,
                      onFindClientsPressed: findClients,
                      onSendToClient: serverToClient,
                      dataReceived: dataReceived,
                      isLoading: isLoading,
                      isRunning: isRunning,
                      status: status,
                    )
                  : ClientPage(
                      onStartPressed: startClient,
                      onDisposePressed: disposeClient,
                      onSendToServer: clientToServer,
                      dataReceived: dataReceived,
                      onCheckServerPressed: checkServerExistance,
                      isLoading: isLoading,
                      isRunning: isRunning,
                      status: status,
                    ),
            ),
          ],
        ),
      ),
    );
  }

  DropdownButton<String> _buildDropdown() {
    return DropdownButton<String>(
      value: dropdownValue,
      disabledHint: Text(dropdownValue),
      onChanged: !isRunning
          ? (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            }
          : null,
      items: <String>['Server', 'Client']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  void startServer() async {
    var name = 'Server';
    if (kIsAndroid) {
      var deviceInfo = await DeviceInfoPlugin().androidInfo;
      name = 'Server-${deviceInfo.brand}-${deviceInfo.model}';
    }
    setState(() {
      isLoading = true;
      server = ServerNode(
        name: name,
        verbose: true,
        onDispose: onDisposeServer,
        clientDispose: clientDispose,
        onError: onError,
      );
    });

    await server.init();
    await server.onReady;

    setState(() {
      status = 'Server ready on ${server.host}:${server.port} (${server.name})';
      isRunning = true;
      isLoading = false;
    });
    server.dataResponse.listen((DataPacket data) {
      setState(() {
        dataReceived = data.payload.toString();
      });
    });
  }

  void disposeServer() {
    setState(() {
      isLoading = true;
    });
    server.dispose();
  }

  void onDisposeServer() {
    setState(() {
      isRunning = false;
      status = 'Server is not running';
      isLoading = false;
      connectedClientNodes = [];
    });
  }

  void clientDispose(ConnectedClientNode c) async {
    setState(() {
      connectedClientNodes = [];
    });
    for (final s in server.clientsConnected) {
      setState(() {
        connectedClientNodes.add(s);
      });
    }
  }

  void findClients() async {
    await server.discoverNodes();
    await Future<Object>.delayed(const Duration(seconds: 2));
    setState(() {
      connectedClientNodes = [];
    });
    for (final s in server.clientsConnected) {
      setState(() {
        connectedClientNodes.add(s);
      });
    }
  }

  void serverToClient(String clientName, dynamic message) async {
    final client = server.clientUri(clientName);
    await server.sendData(message, 'userInfo', client);
  }

  // Client
  void startClient() async {
    var name = 'Client';
    if (kIsAndroid) {
      var deviceInfo = await DeviceInfoPlugin().androidInfo;
      name = 'Client-${deviceInfo.brand}-${deviceInfo.model}';
    }
    setState(() {
      isLoading = true;
      client = ClientNode(
        name: name,
        verbose: true,
        onDispose: onDisposeClient,
        onServerAlreadyExist: onServerAlreadyExist,
        onError: onError,
      );
    });

    await client.init();
    await client.onReady;

    setState(() {
      status = 'Client ready on ${client.host}:${client.port} (${client.name})';
      isRunning = true;
      isLoading = false;
    });

    client.dataResponse.listen((DataPacket data) {
      setState(() {
        if (data.payload.runtimeType == String) {
          dataReceived = data.payload;
        } else {
          dataReceived = City.fromMap(data.payload).toString();
        }
      });
    });
  }

  void disposeClient() {
    client.dispose();
  }

  void onDisposeClient() {
    setState(() {
      isRunning = false;
      status = 'Client is not running';
      isLoading = false;
    });
  }

  Future<void> onServerAlreadyExist(DataPacket dataPacket) async {
    print('Server already exist on ${dataPacket.host} (${dataPacket.name})');
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Server Already Exist'),
          content:
              Text('Server ready on ${dataPacket.host} (${dataPacket.name})'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('CLOSE'),
            ),
          ],
        );
      },
    );
  }

  Future<void> checkServerExistance() async {
    await client.discoverServerNode();
  }

  void clientToServer(dynamic message) async {
    await client.sendData(message, 'userInfo');
  }

  Future<void> onError(String error) async {
    print('ERROR $error');
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(error),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('CLOSE'),
            ),
          ],
        );
      },
    );
  }
}

import 'package:fitervari/screens/plan.dart';
import 'package:flutter/material.dart';
import 'screens/screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // Named Routes
      routes: {
        '/': (context) => LoginScreen(),
        '/training': (context) => PlanScreen(),
        '/profile': (context) => PlanScreen(),
        '/about': (context) => PlanScreen(),
        '/plan': (context) => PlanScreen(),
        '/statistic': (context) => PlanScreen(),
      },

      // Theme
      theme: ThemeData(
        fontFamily: 'Nunito',
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Colors.black87,
        ),
        brightness: Brightness.dark,
        textTheme: const TextTheme(
          bodyText1: TextStyle(fontSize: 18),
          bodyText2: TextStyle(fontSize: 16),
          button: TextStyle(letterSpacing: 1.5, fontWeight: FontWeight.bold),
          headline1: TextStyle(fontWeight: FontWeight.bold),
          subtitle1: TextStyle(color: Colors.grey),
        ),
        buttonTheme: const ButtonThemeData(),
      ),
    );
  }
}
*/