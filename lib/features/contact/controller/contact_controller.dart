import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/contact_repository.dart';

final contactsControllerProvider = FutureProvider((ref) {
   final contactRepository = ref.watch(contactsRepositoryProvider);
   return contactRepository.getAllContacts();
});