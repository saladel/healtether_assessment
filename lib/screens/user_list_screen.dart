import 'package:flutter/material.dart';
import 'package:healtether_assessment/components/search_bar.dart';
import 'package:provider/provider.dart';
import '../provider/user_provider.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Consumer<UserProvider>(
          builder: (context, provider, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Json Users', style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 6),
                Text(
                  provider.users.length > 1
                      ? 'Total Users: ${provider.users.length}'
                      : 'Total User: ${provider.users.length}',
                  style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 6), // Adds bottom padding
                ),
              ],
            );
          },
        ),
      ),
      body: Column(
        children: [
          buildSearchBar(),
          Expanded(
            child: buildBody(),
          ),
        ],
      ),
    );
  }

  Widget buildBody() {
    return Consumer<UserProvider>(
      builder: (context, provider, child) {
        switch (provider.state) {
          // for when it is loading
          case UserState.loading:
            return const Center(
              child: Column(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 10,),
                  Text('Fetching users'),
                ],
              ),
            );

          // When there is an error
          case UserState.error:
            return _buildErrorWidget(context, provider);

          // When the data has loaded
          case UserState.loaded:
            return _buildUserList(provider);
        }
      },
    );
  }

  Widget _buildErrorWidget(BuildContext context, UserProvider provider) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 48, color: Colors.red),
          const SizedBox(height: 16),
          Text(provider.error, textAlign: TextAlign.center),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: provider.fetchUsers,
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _buildUserList(UserProvider provider) {
    if (provider.users.isEmpty) {
      return const Center(
        child: Text('No users found'),
      );
    }

    return RefreshIndicator(
      onRefresh: provider.fetchUsers,
      child: ListView.builder(
        itemCount: provider.users.length,
        itemBuilder: (context, index) {
          final user = provider.users[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: ListTile(
                leading: ClipOval(
                  child: Image.network(
                    'https://placebear.com/g/400/400',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              //leading: Icon(Icons.person),
              title: Text(user.name),
              subtitle: Text(user.email),
            ),
          );
        },
      ),
    );
  }
}
