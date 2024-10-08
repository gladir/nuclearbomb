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
  (Country:'Chine';Region:'R�gion de Gansu'),
  (Country:'Chine';Region:'R�gion du Xinjiang'),
  (Country:'Etats-Unis';Region:'Montana'),
  (Country:'Etats-Unis';Region:'Dakota du Nord'),
  (Country:'Etats-Unis';Region:'Wyoming'),
  (Country:'Inde';Region:'Andhra Pradesh'),
  (Country:'Russie';Region:'R�gion de Dombarovsky'),
  (Country:'Russie';Region:'R�gion d''Irkoutsk'),
  (Country:'Russie';Region:'R�gion de Kaliningrad'),
  (Country:'Russie';Region:'R�gion de Kozelsk'),
  (Country:'Russie';Region:'R�gion de Krasno�arsk'),
  (Country:'Russie';Region:'R�gion de Novossibirsk'),
  (Country:'Russie';Region:'R�gion de Saratov'),
  (Country:'Russie';Region:'R�gion de Tver')
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
                     'nucl�aire connus.');
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
  WriteLn('Pays',' ':21,'R�gion/�tat');
  WriteLn('------------------------ -------------------------');
  For I:=0 to High(SiloLocation)do Begin
   WriteLn(PadRight(SiloLocation[I].Country,25),SiloLocation[I].Region);
  End;
 End;
END.