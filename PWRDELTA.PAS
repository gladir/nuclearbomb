{ @author: Sylvain Maltais (support@gladir.com)
  @created: 2024
  @website(https://www.gladir.com/nuclearbomb  )
  @abstract(Target: Turbo Pascal 7, Free Pascal 3.2)
}

Program PWRDELTA;

Var
 kt:Real;
 Err:Word;

BEGIN
 If(ParamStr(1)='/?')or(ParamStr(1)='--help')or(ParamStr(1)='-h')or
   (ParamStr(1)='/h')or(ParamStr(1)='/H')Then Begin
  WriteLn('PWRDELTA - Cette commande permet de calculer les retombÇs ',
                     'radioactives de 500 ÊSv/h en fonction de la puissance ',
                     'de la bombe et de la distance.');
  WriteLn;
  WriteLn('Syntaxe : PWRDELTA power');
  WriteLn;
  WriteLn(' power    Puissance en kt');
 End
  Else
 Begin
  Val(ParamStr(1),kt,Err);
  If Err>0 Then Begin
   WriteLn('Puissance de la bombe en kt invalide !');
   Halt(1);
  End;
  Write('Distance pour 500 ÊSv/h : ');
  If kt<=1.0 Then WriteLn('70 Ö 150 km') Else
  If kt<=10.0 Then WriteLn('150 Ö 250 km')Else
  If kt<=100.0 Then WriteLn('250 Ö 350 km')Else
  If kt<=1000.0 Then WriteLn('350 Ö 600 km')Else
  If kt<=5000.0 Then WriteLn('600 Ö 800 km')Else
  If kt<=10000.0 Then WriteLn('800 Ö 1000 km')
                Else WriteLn('Plus 1200 km');
 End;
END.