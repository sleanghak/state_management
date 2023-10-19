import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/bloc/counter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          // leading: IconButton(
          //   icon: const Icon(Icons.home),
          //   onPressed: () {},
          // ),
          title: const Text("State Management"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {},
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Image.network(
                    "https://avatars.githubusercontent.com/u/88415887?v=4"),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Home"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.insert_emoticon),
                title: const Text("About Us"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Center(
              child: Text(
                "${state.counter}",
                style: const TextStyle(
                  fontSize: 48,
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          focusColor: Colors.pink,
          backgroundColor: Colors.pink,
          hoverColor: Colors.purple,
          child: const Icon(Icons.add),
          onPressed: () {
            BlocProvider.of<CounterBloc>(context).add(CounterIncrementEvent());
          },
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.pink,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.history,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ));
  }
}
