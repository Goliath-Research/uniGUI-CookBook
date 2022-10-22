unit D4WEditorTypeDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, ExtCtrls, ImgList, System.ImageList,
  uniGUIClasses;

type
  TD4WEditorDialogForm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    ListBox: TListBox;
    procedure FormShow(Sender: TObject);
    procedure ListBoxDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function ShowList(const Caption: string; const AList: TStrings; var Index: Integer): TUniControlClass; overload;
    function ShowList(const Caption: string; var Index: Integer): string; overload;
  end;

implementation

{$R *.dfm}

procedure TD4WEditorDialogForm.FormShow(Sender: TObject);
begin
  if ListBox.Items.Count > 0 then
    ListBox.ItemIndex := 0;
end;

function TD4WEditorDialogForm.ShowList(const Caption: string; const AList: TStrings; var Index: Integer): TUniControlClass;
var
  I : Integer;
  Sl : TUniControlClass;
begin
  Self.Caption := Caption;

  Result := nil;

  ListBox.Clear;
  for I:=0 to AList.Count -1 do
  begin
    Sl := TUniControlClass(AList.Objects[I]);
    if sl <> nil then
      ListBox.Items.AddObject(AList[I]+ ' - '+Sl.ClassName, TObject(Sl))
    else
      ListBox.Items.Add(AList[I]);
  end;

  if ShowModal = mrOK then
  begin
    Index := ListBox.ItemIndex;
    if Index > -1 then
      Result := TUniControlClass(ListBox.Items.Objects[Index]);
  end;

end;

procedure TD4WEditorDialogForm.ListBoxDblClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

function TD4WEditorDialogForm.ShowList(const Caption: string;
  var Index: Integer): string;
begin
  Self.Caption := Caption;
  Result := '';
  if ShowModal = mrOK then
  begin
    Index := ListBox.ItemIndex;
    if Index > -1 then
      Result := ListBox.Items[ListBox.ItemIndex];
  end;
end;

end.
