unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Spin;

type

  { TForm1 }

  TForm1 = class(TForm)
    ListBox1: TListBox;
    SpinEdit1: TSpinEdit;
    procedure FormCreate(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  with ListBox1.Items do
  begin
    AddObject('one',TObject(PtrInt(1)));
    AddObject('two',TObject(PtrInt(2)));
    AddObject('three',TObject(PtrInt(3)));
    AddObject('four',TObject(PtrInt(4)));
  end;
end;

procedure TForm1.ListBox1Click(Sender: TObject);
begin
  Self.Caption:=
    Format('object = %d',[PtrInt(ListBox1.Items.Objects[ListBox1.ItemIndex])]);
end;

procedure TForm1.SpinEdit1Change(Sender: TObject);
var
  i: PtrInt = 1;
begin
  i:= ListBox1.Items.IndexOfObject(TObject(PtrInt(SpinEdit1.Value)));

  if (i <> -1)
    then ListBox1.ItemIndex:= i
    else ListBox1.ItemIndex:= 0;

  ListBox1Click(Sender);
end;

end.

