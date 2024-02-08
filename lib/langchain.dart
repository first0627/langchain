import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

import 'comma_separated.dart';

class LangAI {
  final llm = OpenAI(apiKey: dotenv.env["API_KEY"]);
  final chatModel = ChatOpenAI(apiKey: dotenv.env["API_KEY"]);

  static const text =
      'What would be a good company name for a company that makes colorful socks?';
  final messages = [ChatMessage.humanText(text)];

  LangAI() {}

  Future<void> power() async {
    const systemTemplate = '''
You are a helpful assistant who generates comma separated lists.
A user will pass in a category, and you should generate 5 objects in that category in a comma separated list.
ONLY return a comma separated list, and nothing more.
''';
    const humanTemplate = '{text}';

    final chatPrompt = ChatPromptTemplate.fromTemplates(const [
      (ChatMessageType.system, systemTemplate),
      (ChatMessageType.human, humanTemplate),
    ]);
/*
    final res = chatPrompt.formatMessages({
      'input_language': 'English',
      'output_language': 'French',
      'text': 'I love programming.',
    });
    print(res.toString());

    final res2 = await chatModel.invoke(PromptValue.chat(res));
    */
    final chain =
        chatPrompt.pipe(chatModel).pipe(CommaSeparatedListOutputParser());

    final res2 = await chain.invoke({'text': 'colors'});

    print("=================");
    print(res2.toString());
// [
//   SystemChatMessage(content='You are a helpful assistant that translates English to French.'),
//   HumanChatMessage(content='I love programming.')
// ]
  }

  Future<void> power2() async {
    final res2 = await chatModel.invoke(PromptValue.chat(messages));
    print(res2.firstOutput);
    print("=================");
    print(res2.toString());
  }

/*
  Future<void> power() async {
    final res1 = await llm.invoke(PromptValue.string(text));
    print(res1.firstOutput);
    print("---------------------------");
    print(res1.toString());
  }

 */
}
