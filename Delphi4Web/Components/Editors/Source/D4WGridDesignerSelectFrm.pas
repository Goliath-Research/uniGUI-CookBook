unit D4WGridDesignerSelectFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniGUIBaseClasses, uniMultiItem,
  uniListBox, uniGUIDialogs;

type
  TD4WDesignerSelectForm = class(TUniForm)
    UniListBox: TUniListBox;
    UniButton1: TUniButton;
    UniButton2: TUniButton;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure UniListBoxDblClick(Sender: TObject);
  private
    FResultClass: TPersistentClass;
    FCategory: Integer;
    FResult: string;
    FData: Variant;
    FItemIndex: Integer;
    procedure SetResultClass(const Value: TPersistentClass);
    procedure SetCategory(const Value: Integer);
    procedure SetResult(const Value: string);
    procedure SetData(const Value: Variant);
    procedure SetItemIndex(const Value: Integer);
    { Private declarations }
  public
    { Public declarations }
    procedure ShowList(const ACaption: string; const AList: TStrings; Callback: TUniDialogCallBackProc); overload;
    procedure ShowList(const ACaption: string; Callback: TUniDialogCallBackProc); overload;
    procedure ShowList(const ACaption: string; Callback: TUniDialogCallBackAnonProc); overload;

    property ResultClass: TPersistentClass read FResultClass write SetResultClass;
    property Category: Integer read FCategory write SetCategory;
    property Result: string read FResult write SetResult;
    property Data: Variant read FData write SetData;
    property ItemIndex: Integer read FItemIndex write SetItemIndex;
  end;

implementation

uses
  uniGUIApplication;

{$R *.dfm}


{ TD4WDesignerSelectForm }

procedure TD4WDesignerSelectForm.SetCategory(const Value: Integer);
begin
  FCategory := Value;
end;

procedure TD4WDesignerSelectForm.SetData(const Value: Variant);
begin
  FData := Value;
end;

procedure TD4WDesignerSelectForm.SetItemIndex(const Value: Integer);
begin
  FItemIndex := Value;
end;

procedure TD4WDesignerSelectForm.SetResult(const Value: string);
begin
  FResult := Value;
end;

procedure TD4WDesignerSelectForm.SetResultClass(const Value: TPersistentClass);
begin
  FResultClass := Value;
end;

procedure TD4WDesignerSelectForm.ShowList(const ACaption: string;
  Callback: TUniDialogCallBackAnonProc);
var
  Index : Integer;
begin
  Self.Caption := ACaption;

  ShowModal(
    procedure(Sender: TComponent; AResult:Integer)
    begin
      if AResult = mrOK then
      begin
        Index := UniListBox.ItemIndex;
        FItemIndex := Index;
        if Index > -1 then
          Result := UniListBox.Items[UniListBox.ItemIndex];
        Callback(Sender, AResult);
      end;
    end
  );
end;

procedure TD4WDesignerSelectForm.ShowList(const ACaption: string; Callback: TUniDialogCallBackProc);
begin
  ShowList(ACaption,
    procedure(Sender: TComponent; AResult:Integer)
    begin
      Callback(Sender, AResult);
    end
  );

end;

procedure TD4WDesignerSelectForm.ShowList(const ACaption: string; const AList: TStrings; Callback: TUniDialogCallBackProc);
var
  I, Index : Integer;
  Sl : TUniControlClass;
begin
  Self.Caption := ACaption;

  UniListBox.Clear;
  for I:=0 to AList.Count -1 do
  begin
    Sl := TUniControlClass(AList.Objects[I]);
    if sl <> nil then
      UniListBox.Items.AddObject(AList[I]+ ' - '+Sl.ClassName, TObject(Sl))
    else
      UniListBox.Items.Add(AList[I]);
  end;

  ShowModal(
    procedure(Sender: TComponent; AResult:Integer)
    var
      Ix : Integer;
    begin
      if AResult = mrOK then
      begin
        Index := UniListBox.ItemIndex;
        if Index > -1 then
        begin
          ResultClass := TUniControlClass(UniListBox.Items.Objects[Index]);
          Result := UniListBox.Items[Index];
          Ix := System.Pos(' ', Result);
          if Ix > 0 then
            Result := System.Copy(Result, 1, Ix - 1);
        end
        else
        begin
          ResultClass := nil;
          Result := '';
        end;
        Callback(Sender, AResult);
      end;
    end
  );
end;

procedure TD4WDesignerSelectForm.UniFormBeforeShow(Sender: TObject);
begin
  if UniListBox.Items.Count > 0 then
    UniListBox.ItemIndex := 0;
end;

procedure TD4WDesignerSelectForm.UniListBoxDblClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

end.
