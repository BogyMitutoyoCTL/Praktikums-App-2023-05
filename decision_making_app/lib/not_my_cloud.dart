import "dart:async";
import "dart:convert";
import 'app_secrets.dart';
/*
      Content of the app_secrets.dart should look like:
      final test_user = 'xyz';
      final test_user_pass = 'secret';
*/
import "package:pocketbase/pocketbase.dart";

class NotMyCloud {
  bool user_is_valid = false;
  String user_token = "";
  dynamic user_model_id = 0;
  Future<List<RecordModel>> get_some_cloud_data() async {
    final pb = PocketBase("https://pocketbase.not-my.cloud");

    final authData = await pb.collection('users').authWithPassword(test_user, test_user_pass);

    // after the above you can also access the auth data from the authStore
    user_is_valid = pb.authStore.isValid;
    user_token = pb.authStore.token;
    user_model_id = pb.authStore.model.id;

    final records = await pb.collection('entscheidungen').getFullList(
          expand: 'optionen',
        );

    // "logout" the last authenticated model
    pb.authStore.clear();
    return records;
  }

  Future<String> create_option(String option) async
  {
    final pb = PocketBase('https://pocketbase.not-my.cloud');
    final authData = await pb.collection('users').authWithPassword(test_user, test_user_pass);

    final body = <String, dynamic>{ "option": option};

    final record = await pb.collection('optionen').create(body: body);
    return record.id;
  }
}
