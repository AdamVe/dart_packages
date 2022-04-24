import 'package:git_based/git_based.dart' as git_based;
import 'package:local/local.dart' as local;

void main() {
  print('Result from local: ${local.calculate()}!');
  print('Result from git_based: ${git_based.calculate()}!');
}
