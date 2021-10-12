import 'package:exple_api/platform_alert.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class StopWatch extends StatefulWidget {
  final String ? name;
  final String ? email;
  const StopWatch({Key? key,this.name,this.email}) : super(key: key);
  @override
  _StopWatchState createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {

   get name => widget.name;
  int milliseconds=0;
  Timer ? timer;
  bool isTicking =true;
  final laps=<int>[];

  final itemHeigh=60.0;
  final scrollController=ScrollController();

  void _lap(){
    setState(() {
      laps.add(milliseconds);
       milliseconds = 0;
    });
    scrollController.animateTo(
        itemHeigh*laps.length,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn
    );
  }
    @override
    void initState() {
      super.initState();
      milliseconds=0;
      timer=Timer.periodic(Duration(seconds: 1), _onTick);
    }
  void _onTick(Timer time){
   setState(() {
      milliseconds +=100;
   }); //reload each time timer
  }
  String _secondsText(int milliseconds){
      final seconds=milliseconds/1000;
      return '$seconds seconds';
  }
  void _startTimer(){
    timer=Timer.periodic(Duration(milliseconds: 100), _onTick);
    setState(() {
      milliseconds=0;
      isTicking=true;
    });
  }
  void _stopTimer(BuildContext context){

    setState(() {
      timer!.cancel();
      isTicking=false;
    });

    final controller= showBottomSheet(context: context, builder: _buildRunCompleteSheet);

    Future.delayed(Duration(seconds: 5)).then((_) => controller.close());

    /*final totalRuntime=laps.fold<int>(milliseconds, (total, lap) => total+lap);
    final alert=PlatformAlert(
        title: 'Run Completed',
        message: 'Total Run Time is ${_secondsText(totalRuntime)}.'
    );
    alert.show(context);*/
  }
  Widget _buildRunCompleteSheet(BuildContext context){
    final totalRuntime=laps.fold<int>(milliseconds, (total, lap) => total+lap);
    final textTheme=Theme.of(context).textTheme;
    return SafeArea(
        child: Container(
          color: Theme.of(context).cardColor,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Run Finished ',style: textTheme.headline6,),
                Text('Total Run Time is ${_secondsText(totalRuntime)}'),
              ],
            ),
          ),
        ),
    );
  }

  @override
  void dispose(){
    timer!.cancel();
    super.dispose();
  }
  
  Widget _buildLapDisplay(){
    return Scrollbar(
      child: ListView.builder(
        controller: scrollController,
        itemExtent: itemHeigh,
        itemCount: laps.length,
          physics: BouncingScrollPhysics(),
        itemBuilder: (context,index){
            final milliseconds=laps[index];
            return ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 50),
              title: Text('Lap ${index+1}'),
              trailing: Text(_secondsText(milliseconds)),
            );
        },

      ),
    );
  }
  @override
  Widget build(BuildContext context) {
       //SCAFFOLD WIDGET
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body:  Column(
          children: [
            Flexible(flex: 1,child: buildCounter(context)),
            Flexible(flex: 3,child: _buildLapDisplay()),
          ],
        ),
    );
  }

  Container buildCounter(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Center(
        child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                   'Lap ${laps.length +1}',
                    style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(color: Colors.white),
              ),
              Text(
                _secondsText(milliseconds),
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: Colors.white),
              ),
              SizedBox(height: 20,),
              buildControls(),
            ],
          ),
      ),
    );
  }

  Row buildControls() {
    return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    foregroundColor: MaterialStateProperty.all(Colors.white)
                  ),
                    child: Text('Start'),
                    onPressed: isTicking ? null : _startTimer,
                ),
              SizedBox(width: 20,),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.yellow),
                 ),
                child: Text('Lap'),
                onPressed: isTicking ? _lap : null,
              ),
              SizedBox(width: 20,),
              Builder(
                builder:(context)=> TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                      foregroundColor: MaterialStateProperty.all(Colors.white)
                    ),
                    child: Text('Stop'),
                    onPressed: isTicking ? ()=>  _stopTimer(context) : null ,
                ),
              ),
          ]
          );
  }
}
