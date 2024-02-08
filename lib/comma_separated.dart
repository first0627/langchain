import 'package:langchain/langchain.dart';

class CommaSeparatedListOutputParser extends BaseOutputParser<AIChatMessage,
    BaseLangChainOptions, List<String>> {
  @override
  Future<List<String>> parse(final String text) async {
    return text.trim().split(',');
  }
}
