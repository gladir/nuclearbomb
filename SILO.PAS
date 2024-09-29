{ @author: Sylvain Maltais (support@gladir.com)
  @created: 2024
  @website(https://www.gladir.com/nuclearbomb  )
  @abstract(Target: Turbo Pascal 7, Free Pascal 3.2)
}

Program SILO;

Type
 LocationRec=Record
  Country:String[20];
  Region:String[20];
 End;

Const
 SiloLocation:Array[0..14]of LocationRec=(
  (Country:'Chine';Region:'Province de Henan'),
  (Country:'Chine';Region:'RÇgion de Gansu'),
  (Country:'Chine';Region:'RÇgion du Xinjiang'),
  (Country:'Etats-Unis';Region:'Montana'),
  (Country:'Etats-Unis';Region:'Dakota du Nord'),
  (Country:'Etats-Unis';Region:'Wyoming'),
  (Country:'Inde';Region:'Andhra Pradesh'),
  (Country:'Russie';Region:'RÇgion de Dombarovsky'),
  (Country:'Russie';Region:'RÇgion d''Irkoutsk'),
  (Country:'Russie';Region:'RÇgion de Kaliningrad'),
  (Country:'Russie';Region:'RÇgion de Kozelsk'),
  (Country:'Russie';Region:'RÇgion de Krasnoãarsk'),
  (Country:'Russie';Region:'RÇgion de Novossibirsk'),
  (Country:'Russie';Region:'RÇgion de Saratov'),
  (Country:'Russie';Region:'RÇgion de Tver')
 );

Var
 I:Integer;

Function PadRight(S:String;Space:Byte):String;
Var
 I:Byte;
Begin
 If Length(S)<Space Then For I:=Length(S)+1 to Space do S:=S+' ';
 PadRight:=S;
End;

Function StrToUpper(S:String):String;
Var
 I:Byte;
Begin
 For I:=1 to Length(S)do Begin
  If S[I] in['a'..'z']Then S[I]:=Chr(Ord(S[I])-32);
 End;
 StrToUpper:=S;
End;

BEGIN
 If(ParamStr(1)='/?')or(ParamStr(1)='--help')or(ParamStr(1)='-h')or
   (ParamStr(1)='/h')or(ParamStr(1)='/H')Then Begin
  WriteLn('SILO - Cette commande permet d''afficher la liste des silos ',
                     'nuclÇaire connus.');
  WriteLn;
  WriteLn('Syntaxe : SILO [country]');
  WriteLn;
  WriteLn(' country  Affiche uniquement les silos pour ce pays');
 End
  Else
 If ParamCount>0 Then Begin
  For I:=0 to High(SiloLocation)do Begin
   If StrToUpper(SiloLocation[I].Country)=StrToUpper(ParamStr(1))Then Begin
    WriteLn(SiloLocation[I].Region);
   End;
  End;
 End
  Else
 Begin
  WriteLn('Pays',' ':21,'RÇgion/êtat');
  WriteLn('------------------------ -------------------------');
  For I:=0 to High(SiloLocation)do Begin
   WriteLn(PadRight(SiloLocation[I].Country,25),SiloLocation[I].Region);
  End;
 End;
END.