import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/auth_repository.dart';
final authControllerProvider=Provider((ref) => AuthController(authRepository: ref.read(authRepositoryProvider), ref: ref),);
class AuthController{
  final AuthRepository _authRepository;
  final Ref _ref;
  AuthController({required AuthRepository authRepository,required  Ref ref}):
      _authRepository=authRepository,
  _ref=ref;



}