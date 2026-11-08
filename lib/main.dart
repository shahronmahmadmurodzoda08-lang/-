import 'package:flutter/material.dart';

void main() => runApp(const BooksApp());
const green = Color(0xFF244D3A), paper = Color(0xFFF5F0E5);
class BooksApp extends StatelessWidget {
 const BooksApp({super.key});
 @override Widget build(BuildContext context) => MaterialApp(debugShowCheckedModeBanner:false,title:'BOOKS',theme:ThemeData(useMaterial3:true,colorScheme:ColorScheme.fromSeed(seedColor:green),scaffoldBackgroundColor:paper),home:const LibraryScreen());
}
class Lesson {
 final String title,group,rule,example,task;
 const Lesson(this.title,this.group,this.rule,this.example,this.task);
}
const pythonLessons=<Lesson>[
 Lesson('Python чист?','Асосҳо','Python забони барномасозии сатҳи баланд аст. Код аз боло ба поён иҷро мешавад.','print("Салом, ҷаҳон!")','Барнома навис, ки номи худро чоп кунад.'),
 Lesson('Тағйирёбандаҳо','Асосҳо','Тағйирёбанда маълумотро нигоҳ медорад.','name = "Ali"\nage = 18\nprint(name, age)','Тағйирёбандаи city соз.'),
 Lesson('Навъҳои маълумот','Асосҳо','int — бутун; float — касрӣ; str — матн; bool — True ё False.','age = 20\nprice = 12.5\nname = "Python"\nactive = True','Барои ҳар чор навъ тағйирёбанда соз.'),
 Lesson('Амалиётҳои математикӣ','Асосҳо','+ ҷамъ, - тарҳ, * зарб, / тақсим, // тақсими бутун, % бақия, ** дараҷа.','a, b = 17, 5\nprint(a // b)\nprint(a % b)','Бақияи тақсими 29 ба 4-ро ҳисоб кун.'),
 Lesson('Шартҳои if / else','Идоракунӣ','Шарт иҷрои кодро вобаста ба True ё False интихоб мекунад.','score = 75\nif score >= 50:\n    print("Гузашт")\nelse:\n    print("Нагузашт")','Мусбат ё манфӣ будани ададро муайян кун.'),
 Lesson('Даври for','Даврҳо','for барои гузаштан аз рӯйи пайдарпайӣ истифода мешавад. range(5) 0 то 4 медиҳад.','for i in range(1, 6):\n    print(i)','Ададҳои аз 1 то 10-ро чоп кун.'),
 Lesson('Даври while','Даврҳо','while то вақте ки шарт True аст такрор мешавад.','n = 3\nwhile n > 0:\n    print(n)\n    n -= 1','Бо while ададҳои 1 то 5-ро чоп кун.'),
 Lesson('Функсияҳо','Функсияҳо','def функсия месозад, return натиҷаро бармегардонад.','def add(a, b):\n    return a + b\n\nprint(add(4, 6))','Функсияи square соз, ки квадрати ададро баргардонад.'),
 Lesson('Рӯйхатҳо (list)','Маҷмӯаҳо','Рӯйхат якчанд қиматро нигоҳ медорад. Индекс аз 0 сар мешавад. append() илова мекунад.','numbers = [2, 4, 6]\nnumbers.append(8)\nprint(numbers[0])','Рӯйхати 5 ном соз.'),
 Lesson('Tuple ва Set','Маҷмӯаҳо','tuple тағйирнопазир аст. set қиматҳои такрорнашавандаро нигоҳ медорад.','point = (3, 4)\nunique = {1, 2, 2, 3}','Аз [1,1,2,3,3] маҷмӯи бе такрор соз.'),
 Lesson('Луғатҳо (dict)','Маҷмӯаҳо','dict маълумотро бо ҷуфти калид ва қимат нигоҳ медорад.','student = {"name": "Ali", "age": 19}\nprint(student["name"])','Луғати мошин бо brand ва year соз.'),
 Lesson('Сатрҳо (str)','Маълумот','len() дарозӣ, lower() ҳарфҳои хурд ва upper() ҳарфҳои калон медиҳад.','word = "Python"\nprint(len(word))\nprint(word.upper())','Калимаи худро ба ҳарфҳои калон табдил деҳ.'),
 Lesson('Файлҳо','Амалӣ','open() файлро мекушояд. with онро баъди истифода мебандад.','with open("note.txt", "w", encoding="utf-8") as f:\n    f.write("Салом")','Матнро ба файли note.txt навис.'),
 Lesson('Хатогиҳо','Амалӣ','try/except хатогиҳои вақти иҷроишро коркард мекунад.','try:\n    n = int(input("Адад: "))\n    print(10 / n)\nexcept (ValueError, ZeroDivisionError):\n    print("Вуруди нодуруст")','Вуруди ададро бехатар санҷ.'),
 Lesson('Синфҳо ва объектҳо','ООП','class қолаби объект аст. __init__ ҳангоми сохтани объект иҷро мешавад.','class Car:\n    def __init__(self, brand):\n        self.brand = brand\n\ncar = Car("Toyota")','Синфи Book бо title соз.')
];
const cultureLessons=<Lesson>[
 Lesson('Мафҳуми фарҳанг','Асосҳо','Фарҳанг маҷмӯи арзишҳои моддӣ ва маънавӣ, дониш ва меъёрҳои ҷомеа мебошад.','Моддӣ: бино, асбоб. Маънавӣ: илм, санъат, забон.','Ду намунаи фарҳанги моддӣ ва маънавиро навис.'),
 Lesson('Фарҳанги моддӣ ва маънавӣ','Навъҳо','Фарҳанги моддӣ бо ашё; фарҳанги маънавӣ бо ғоя, дониш ва арзишҳо алоқаманд аст.','Осорхона — моддӣ. Забон ва адабиёт — маънавӣ.','Меъморӣ ба кадом навъ дохил мешавад?'),
 Lesson('Функсияҳои фарҳанг','Нақш','Фарҳанг вазифаҳои маърифатӣ, тарбиявӣ, коммуникативӣ, танзимӣ ва ҳифзи меросро иҷро мекунад.','Забон муоширатро таъмин мекунад; анъана таҷрибаро мегузаронад.','Се вазифаи фарҳангро шарҳ деҳ.'),
 Lesson('Мероси фарҳангӣ','Мерос','Мероси фарҳангӣ ёдгориҳо, анъанаҳо, дониш ва осори таърихии меросмонда мебошад.','Ёдгориҳои таърихӣ ва ҳунарҳои мардумӣ.','Як намунаи мероси фарҳангии Тоҷикистонро шарҳ деҳ.'),
 Lesson('Фарҳанг ва ҷомеа','Ҷомеа','Арзишҳо рафторро шакл медиҳанд ва ҷомеа фарҳангро тағйир медиҳад.','Меъёрҳои эҳтиром муносибатҳои иҷтимоиро танзим мекунанд.','Мисоли таъсири ҷомеа ба фарҳанг биёр.')
];
class LibraryScreen extends StatelessWidget {
 const LibraryScreen({super.key});
 @override Widget build(BuildContext context)=>Scaffold(appBar:AppBar(title:const Text('BOOKS',style:TextStyle(fontWeight:FontWeight.w900,letterSpacing:2))),body:ListView(padding:const EdgeInsets.all(18),children:[
 Container(padding:const EdgeInsets.all(22),decoration:BoxDecoration(gradient:const LinearGradient(colors:[Color(0xFF14251F),green]),borderRadius:BorderRadius.circular(24)),child:const Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Icon(Icons.auto_stories,color:Color(0xFFC49A52),size:42),SizedBox(height:16),Text('КИТОБХОНАИ ДОНИШ',style:TextStyle(color:Colors.white,fontSize:23,fontWeight:FontWeight.w900)),Text('Китобҳо • Дарсҳо • Машқҳо • Санҷишҳо',style:TextStyle(color:Colors.white70))])),
 const SizedBox(height:18),
 _Tile(icon:Icons.menu_book,title:'Фарҳангшиносӣ',subtitle:'251 саҳифа • хондани офлайн',onTap:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>const CultureReader()))),
 _Tile(icon:Icons.code,title:'Python — аз асос то ООП',subtitle:'15 дарс бо мисол ва машқ',onTap:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>const LessonList(title:'Python',lessons:pythonLessons)))),
 const SizedBox(height:10),const Text('ДАРСҲОИ ИЛОВАГӢ',style:TextStyle(color:green,fontWeight:FontWeight.w900)),
 _Tile(icon:Icons.history_edu,title:'Дарсҳои фарҳангшиносӣ',subtitle:'5 мавзӯи шарҳдодашуда',onTap:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>const LessonList(title:'Фарҳангшиносӣ',lessons:cultureLessons)))),
 _Tile(icon:Icons.quiz,title:'Тестҳо ва санҷиши дониш',subtitle:'10 саволи тасодуфӣ • хол',onTap:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>const QuizScreen()))),
 _Tile(icon:Icons.school,title:'Алгебра ва физика',subtitle:'Формулаҳо ва шарҳи кӯтоҳ',onTap:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>const ExtraLessons()))),
 ]));
}
class _Tile extends StatelessWidget {
 final IconData icon;final String title,subtitle;final VoidCallback onTap;
 const _Tile({required this.icon,required this.title,required this.subtitle,required this.onTap});
 @override Widget build(BuildContext context)=>Card(color:Colors.white,child:ListTile(leading:CircleAvatar(backgroundColor:const Color(0xFFE6EDE5),child:Icon(icon,color:green)),title:Text(title,style:const TextStyle(fontWeight:FontWeight.bold)),subtitle:Text(subtitle),trailing:const Icon(Icons.chevron_right),onTap:onTap));
}
class LessonList extends StatelessWidget {
 final String title;final List<Lesson> lessons;
 const LessonList({super.key,required this.title,required this.lessons});
 @override Widget build(BuildContext context)=>Scaffold(appBar:AppBar(title:Text(title)),body:ListView.builder(itemCount:lessons.length,itemBuilder:(context,i){final l=lessons[i];return Card(color:Colors.white,child:ListTile(leading:CircleAvatar(child:Text((i+1).toString())),title:Text(l.title),subtitle:Text(l.group),onTap:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>LessonDetail(lesson:l)))));}));
}
class LessonDetail extends StatefulWidget {
 final Lesson lesson;const LessonDetail({super.key,required this.lesson});
 @override State<LessonDetail> createState()=>_LessonDetailState();
}
class _LessonDetailState extends State<LessonDetail>{
 final answer=TextEditingController();
 String feedback='';
 @override void dispose(){answer.dispose();super.dispose();}
 String normalize(String value)=>value.toLowerCase().replaceAll(RegExp(r'[^a-zа-яё0-9]+'), '');
 bool checkAnswer(Lesson lesson,String value){
  final v=normalize(value); if(v.isEmpty)return false;
  switch(lesson.title){
   case 'Python чист?': return v.contains('print') && v.contains('салом');
   case 'Тағйирёбандаҳо': return v.contains('city') && v.contains('=');
   case 'Навъҳои маълумот': return ['int','float','str','bool'].every(v.contains);
   case 'Амалиётҳои математикӣ': return v.contains('1');
   case 'Шартҳои if / else': return v.contains('if') && (v.contains('>') || v.contains('<'));
   case 'Даври for': return v.contains('for') && v.contains('range');
   case 'Даври while': return v.contains('while');
   case 'Функсияҳо': return v.contains('def') && v.contains('square') && v.contains('return');
   case 'Рӯйхатҳо (list)': return v.contains('[') && v.contains(']');
   case 'Tuple ва Set': return v.contains('set');
   case 'Луғатҳо (dict)': return v.contains('{') && v.contains(':');
   case 'Сатрҳо (str)': return v.contains('upper');
   case 'Файлҳо': return v.contains('open') && v.contains('write');
   case 'Хатогиҳо': return v.contains('try') && v.contains('except');
   case 'Синфҳо ва объектҳо': return v.contains('class') && v.contains('book');
   default: return v.length >= 12;
  }
 }
 @override Widget build(BuildContext context){final l=widget.lesson;return Scaffold(appBar:AppBar(title:Text(l.title)),body:ListView(padding:const EdgeInsets.all(18),children:[
 Text(l.group.toUpperCase(),style:const TextStyle(color:green,fontWeight:FontWeight.bold)),const SizedBox(height:10),Text(l.title,style:const TextStyle(fontSize:25,fontWeight:FontWeight.w900)),
 const SizedBox(height:18),const Text('ҚОИДА / ШАРҲ',style:TextStyle(fontWeight:FontWeight.w900,color:green)),Text(l.rule,style:const TextStyle(fontSize:16,height:1.5)),
 const SizedBox(height:18),const Text('МИСОЛ',style:TextStyle(fontWeight:FontWeight.w900,color:green)),Container(padding:const EdgeInsets.all(14),decoration:BoxDecoration(color:const Color(0xFF14251F),borderRadius:BorderRadius.circular(12)),child:SelectableText(l.example,style:const TextStyle(color:Color(0xFFE9D5A7),fontFamily:'monospace'))),
 const SizedBox(height:18),const Text('МАШҚ',style:TextStyle(fontWeight:FontWeight.w900,color:green)),Text(l.task),TextField(controller:answer,maxLines:4,decoration:const InputDecoration(hintText:'Ҷавоб ё кодро навис...',border:OutlineInputBorder())),
 if(feedback.isNotEmpty) Padding(padding:const EdgeInsets.symmetric(vertical:10),child:Text(feedback,style:TextStyle(fontWeight:FontWeight.bold,color:feedback.startsWith('Дуруст')?green:Colors.deepOrange))),
 FilledButton(onPressed:(){setState(()=>feedback=checkAnswer(l,answer.text)?'Дуруст! Ҷавоб талаботи асосии машқро дорад.':'Ҷавоб нопурра аст. Қоида ва мисолро муқоиса кун.');},child:const Text('Санҷидани машқ'))
 ]));}
}
class CultureReader extends StatefulWidget {const CultureReader({super.key});@override State<CultureReader> createState()=>_CultureReaderState();}
class _CultureReaderState extends State<CultureReader>{
 late final PageController page;int current=0;static const total=251;
 @override void initState(){super.initState();page=PageController();}
 @override void dispose(){page.dispose();super.dispose();}
 void jump(){final c=TextEditingController(text:(current+1).toString());showDialog(context:context,builder:(_)=>AlertDialog(title:const Text('Рақами саҳифа'),content:TextField(controller:c,keyboardType:TextInputType.number),actions:[TextButton(onPressed:()=>Navigator.pop(context),child:const Text('Бекор')),FilledButton(onPressed:(){final n=int.tryParse(c.text);if(n!=null&&n>=1&&n<=total){page.jumpToPage(n-1);Navigator.pop(context);}},child:const Text('Гузар'))]));}
 @override Widget build(BuildContext context)=>Scaffold(appBar:AppBar(title:const Text('Фарҳангшиносӣ'),actions:[IconButton(onPressed:jump,icon:const Icon(Icons.find_in_page)),Padding(padding:const EdgeInsets.only(right:14),child:Center(child:Text((current+1).toString()+'/$total')))]),
 body:LayoutBuilder(builder:(context,constraints)=>PageView.builder(controller:page,itemCount:total,onPageChanged:(i)=>setState(()=>current=i),itemBuilder:(context,index)=>AnimatedBuilder(animation:page,child:InteractiveViewer(minScale:1,maxScale:4,child:Image.asset('assets/pages/'+(index+1).toString().padLeft(3,'0')+'.jpg',fit:BoxFit.contain,width:constraints.maxWidth,height:constraints.maxHeight,errorBuilder:(_,__,___)=>const Center(child:Text('Саҳифа ёфт нашуд')))),builder:(context,child){final p=page.hasClients?(page.page??page.initialPage.toDouble()):0.0;final d=(p-index).clamp(-1.0,1.0);return Transform(alignment:d>0?Alignment.centerLeft:Alignment.centerRight,transform:Matrix4.identity()..setEntry(3,2,0.0012)..rotateY(d*0.42),child:Opacity(opacity:(1-d.abs()*0.18).clamp(0.0,1.0),child:child));}))),
 bottomNavigationBar:SafeArea(child:Padding(padding:const EdgeInsets.all(12),child:Row(children:[Expanded(child:OutlinedButton(onPressed:current>0?()=>page.previousPage(duration:const Duration(milliseconds:380),curve:Curves.easeInOutCubic):null,child:const Text('Пешина'))),const SizedBox(width:10),Expanded(child:FilledButton(onPressed:current<total-1?()=>page.nextPage(duration:const Duration(milliseconds:380),curve:Curves.easeInOutCubic):null,child:const Text('Баъдӣ')))]))));
}
class Question {final String subject,question,explanation;final List<String> answers;final int correct;const Question(this.subject,this.question,this.answers,this.correct,this.explanation);}
const questions=<Question>[
 Question('Python','Кадом калима функсия месозад?',['func','def','function','make'],1,'def калимаи калидӣ барои функсия аст.'),
 Question('Python','Натиҷаи 17 % 5 чанд аст?',['2','3','3.4','5'],0,'% бақияи тақсимро медиҳад.'),
 Question('Python','Индекси аввалини list чанд аст?',['1','-1','0','2'],2,'Индекси рӯйхат аз 0 оғоз мешавад.'),
 Question('Python','Кадом навъ True ё False нигоҳ медорад?',['str','bool','float','list'],1,'bool навъи мантиқӣ аст.'),
 Question('Python','Барои илова ба охири list кадом метод аст?',['push','add','append','insertEnd'],2,'append() элементро ба охир илова мекунад.'),
 Question('Python','range(3) кадом қиматҳоро медиҳад?',['1,2,3','0,1,2','0,1,2,3','3'],1,'range(3) аз 0 то 2 аст.'),
 Question('Python','Кадом оператор баробариро месанҷад?',['=','==','!=','=>'],1,'== муқоиса мекунад, = қимат таъин мекунад.'),
 Question('Python','Барои коркарди хатогӣ кадом сохтор аст?',['if/else','for/in','try/except','def/return'],2,'try/except хатогиҳоро коркард мекунад.'),
 Question('Python','Кадом маҷмӯа такрориро нест мекунад?',['list','tuple','set','str'],2,'set танҳо элементҳои нодирро нигоҳ медорад.'),
 Question('Python','Кадом функсия дарозии сатрро медиҳад?',['size()','len()','countAll()','long()'],1,'len() шумораи элементҳоро медиҳад.'),
 Question('Фарҳангшиносӣ','Фарҳанг чиро дар бар мегирад?',['Танҳо биноҳо','Арзишҳои моддӣ ва маънавӣ','Танҳо пул','Танҳо қонун'],1,'Фарҳанг ҳам моддӣ ва ҳам маънавӣ мебошад.'),
 Question('Фарҳангшиносӣ','Кадомаш фарҳанги маънавист?',['Асбоб','Бино','Забон','Либос'],2,'Забон унсури фарҳанги маънавӣ аст.'),
 Question('Фарҳангшиносӣ','Кадом вазифа таҷрибаро ба наслҳо мегузаронад?',['Ҳифзи мерос','Тиҷорат','Нақлиёт','Истеҳсол'],0,'Фарҳанг мерос ва таҷрибаро нигоҳ медорад.'),
 Question('Фарҳангшиносӣ','Мероси фарҳангӣ чист?',['Танҳо ашёи нав','Осор, анъана ва донишҳои меросӣ','Танҳо варзиш','Танҳо технология'],1,'Мероси фарҳангӣ аз наслҳо ба наслҳо мегузарад.'),
 Question('Фарҳангшиносӣ','Фарҳанг ба ҷомеа чӣ таъсир дорад?',['Меъёр ва рафторро шакл медиҳад','Ҳеҷ таъсир надорад','Танҳо ҳаворо тағйир медиҳад','Танҳо иқтисодро ҳисоб мекунад'],0,'Арзишҳо ва меъёрҳои фарҳангӣ рафторро роҳнамоӣ мекунанд.')
];
class QuizScreen extends StatefulWidget {const QuizScreen({super.key});@override State<QuizScreen> createState()=>_QuizScreenState();}
class _QuizScreenState extends State<QuizScreen>{
 late List<Question> quiz;int index=0,score=0;int? selected;bool answered=false;
 @override void initState(){super.initState();quiz=List<Question>.of(questions)..shuffle();quiz=quiz.take(10).toList();}
 void choose(int n){if(answered)return;setState((){selected=n;answered=true;if(n==quiz[index].correct)score++;});}
 void next(){if(index==quiz.length-1){showDialog(context:context,barrierDismissible:false,builder:(_)=>AlertDialog(title:const Text('Натиҷаи тест'),content:Text('Холи ту: '+score.toString()+' аз '+quiz.length.toString()+'\n'+(score>=8?'Офарин! Донишат хуб аст.':'Мавзӯъҳоро такрор карда, боз санҷ.')),actions:[FilledButton(onPressed:(){Navigator.pop(context);Navigator.pop(context);},child:const Text('Анҷом'))]));}else{setState((){index++;selected=null;answered=false;});}}
 @override Widget build(BuildContext context){final q=quiz[index];return Scaffold(appBar:AppBar(title:const Text('Тест'),actions:[Center(child:Padding(padding:const EdgeInsets.only(right:16),child:Text((index+1).toString()+'/'+quiz.length.toString())))]),body:ListView(padding:const EdgeInsets.all(18),children:[
 LinearProgressIndicator(value:(index+1)/quiz.length),const SizedBox(height:20),Text(q.subject.toUpperCase(),style:const TextStyle(color:green,fontWeight:FontWeight.bold)),Text(q.question,style:const TextStyle(fontSize:22,fontWeight:FontWeight.w900)),
 ...List.generate(q.answers.length,(i){final good=i==q.correct,chosen=i==selected;final bg=answered&&good?const Color(0xFFD9EBDD):answered&&chosen?const Color(0xFFF4D8D5):Colors.white;return Card(color:bg,child:ListTile(leading:CircleAvatar(child:Text(String.fromCharCode(65+i))),title:Text(q.answers[i]),trailing:answered&&good?const Icon(Icons.check_circle,color:green):null,onTap:()=>choose(i)));}),
 if(answered)...[Text(selected==q.correct?'Дуруст!':'Ҷавоби дуруст: '+q.answers[q.correct],style:const TextStyle(fontWeight:FontWeight.bold,color:green)),Text(q.explanation),FilledButton(onPressed:next,child:Text(index==quiz.length-1?'Натиҷаро дидан':'Саволи навбатӣ'))]
 ]));}
}
class ExtraLessons extends StatelessWidget {const ExtraLessons({super.key});@override Widget build(BuildContext context)=>Scaffold(appBar:AppBar(title:const Text('Алгебра ва физика')),body:ListView(padding:const EdgeInsets.all(16),children:const[
 _Formula(title:'Детерминанти 2×2',formula:'Δ = ad − bc',note:'|3 2; 1 5| = 3×5 − 2×1 = 13.'),
 _Formula(title:'Қоидаи Крамер',formula:'x = Δx / Δ\ny = Δy / Δ',note:'Барои система, агар Δ ≠ 0.'),
 _Formula(title:'Қонуни дуюми Нютон',formula:'F = m × a',note:'F — N, m — kg, a — m/s².'),
 _Formula(title:'Қувваи соиш',formula:'Fсоиш = μ × N',note:'μ — коэффисиенти соиш; N — қувваи такягоҳ.'),
 _Formula(title:'Энергияи кинетикӣ',formula:'Eₖ = (m × v²) / 2',note:'m — kg, v — m/s, энергия — J.'),
 _Formula(title:'Қонуни Архимед',formula:'Fₐ = ρ × g × V',note:'ρ — зичии моеъ, V — ҳаҷми қисми ғӯтида.')
 ]));}
class _Formula extends StatelessWidget {final String title,formula,note;const _Formula({required this.title,required this.formula,required this.note});@override Widget build(BuildContext context)=>Card(color:Colors.white,child:Padding(padding:const EdgeInsets.all(16),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text(title,style:const TextStyle(fontWeight:FontWeight.w900,color:green)),SelectableText(formula,style:const TextStyle(fontFamily:'monospace',fontSize:18)),Text(note)])));}
class PdfReader extends StatelessWidget {
 final String path,title;
 const PdfReader({super.key,required this.path,required this.title});
 @override Widget build(BuildContext context)=>Scaffold(
  appBar:AppBar(title:Text(title)),
  body:Center(child:Padding(padding:const EdgeInsets.all(24),child:Text(
   'Барои кушодани PDF ҳоло намоишгари дохилӣ танзим нашудааст. Файл дар китобхона нигоҳ дошта мешавад.',
   textAlign:TextAlign.center,
  ))),
 );
}
