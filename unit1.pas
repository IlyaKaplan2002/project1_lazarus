unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, StdCtrls,
  ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Image1: TImage;
    Label1: TLabel;
    ListBox1: TListBox;
    Memo1: TMemo;
    StringGrid1: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  Tur : array[1..5, 1..6] of Integer;
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var i : Integer;
begin
   for i:=1 to 5 do
   begin
       StringGrid1.Cells[0,i] := IntToStr(i);   //виведення заголовків рядків
       StringGrid1.Cells[i,0] := IntToStr(i);   //виведення заголовків стовпчиків
   end;
       StringGrid1.Cells[6,0] := 'Сума';   //виведення заголовка шостого стовпця
end;

procedure TForm1.Button1Click(Sender: TObject);
var i, j : Integer;
begin
     {значення з таблиці Stringgrid1 вводимо в масив Tur {крім шостого стовпця} }
     for i:=1 to 5 do
         for j:=1 to 5 do
             Tur[i,j] := StrToInt(StringGrid1.Cells[j,i]);
end;

procedure TForm1.Button2Click(Sender: TObject);
var i, j, sum : Integer;
begin
     for i:=1 to 5 do     //перебираємо елементи
     begin
         sum:=0;         //надаємо змінній для підрахунку суми початкове значення 0
         for j:=0 to 5 do           //перебираємо елементи
             sum:=sum + Tur[i,j];   //сумуємо
         StringGrid1.Cells[6,i] := IntToStr(sum);  //виводимо в шостий стовпець суму балів
     end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var N, k, i : Integer;
begin
  k:=0;           //лічильник номера рядкі багаторядкового текстового поля Memo1
  for N:=8 downto 0 do       //перебираємо числа від 8 до 0
    for i:=1 to 5 do         //перебираємо суму балів
    if StrToInt(StringGrid1.Cells[6,i]) = N then   //якщо сума балів у шостому стовпці рівна числу, тоді
    begin
      Memo1.Lines[k] := IntToStr(i);     //виводимо в багаторядкове текстове поле Memo1 номер команди
      k:=k+1                             //збільшуємо лічильник на 1
    end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var i : Integer;
  nomer : String;
begin
  nomer:='III';        //змінна необхідна для виведння місця
  for i:=1 to 3 do     //перебираємо перші три місця в багаторядковому текстовому полі Memo1
    {в список ListBox1 виводимо місце призових команд}
    ListBox1.Items.Add(Copy(nomer, 1, i) + ' місце - ' + Memo1.Lines[i-1] + ' команда');
end;

end.

