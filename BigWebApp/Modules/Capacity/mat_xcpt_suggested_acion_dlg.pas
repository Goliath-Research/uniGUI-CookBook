unit mat_xcpt_suggested_acion_dlg;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  Vcl.CheckLst,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  Vcl.StdCtrls,
  uniScrollBox,
  uniCheckBox;

type
  TFrmMatXcptSuggestedActionDlg = class(TUniForm)
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    sbtnSelectAll: TUniSpeedButton;
    sbtnUnselectAll: TUniSpeedButton;
    Panel4: TUniPanel;
    Panel5: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    UniScrollBox1: TUniScrollBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnSelectAllClick(Sender: TObject);
    procedure sbtnUnselectAllClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    procedure LoadSelectedFrom(AList: TStringList);
    procedure SelectAll(Value: Boolean);
    procedure PopulateSuggestedActionList;
    procedure PopulateListBox(AList:TStringList);
    procedure addCheckListBox( Str: String; Tag: Integer );

    { Private declarations }
  public
    { Public declarations }
    class function DoShowModal( var AList: TStringList ): Boolean;

    procedure SaveSelectedTo(var AList: TStringList);
  end;

var
  FrmMatXcptSuggestedActionDlg: TFrmMatXcptSuggestedActionDlg;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;


class function TFrmMatXcptSuggestedActionDlg.DoShowModal( var AList: TStringList): Boolean;
var
  Frm: TFrmMatXcptSuggestedActionDlg;
begin
  Frm := TFrmMatXcptSuggestedActionDlg.Create(uniGUIApplication.UniApplication);
  with Frm do
  begin
  //     IQRegFormRead(self, [self]);
     PopulateSuggestedActionList;
     LoadSelectedFrom( AList );
     Result:= ShowModal = mrOK;
     if Result then
        SaveSelectedTo( AList );
  end;
end;

procedure TFrmMatXcptSuggestedActionDlg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  IQRegFormWrite(self, [self]);
end;

procedure TFrmMatXcptSuggestedActionDlg.LoadSelectedFrom( AList: TStringList );
var
  I,Pos: Integer;
begin
  for I:= 0 to AList.Count - 1 do
     for Pos := 0 to UniScrollBox1.ComponentCount-1 do
     begin
       if UniScrollBox1.Components[Pos].ClassType=TUniCheckBox then
          if TUniCheckBox(UniScrollBox1.Components[Pos]).Caption=AList[ I ] then
             TUniCheckBox(UniScrollBox1.Components[Pos]).Checked := TRUE;
    end;
end;


procedure TFrmMatXcptSuggestedActionDlg.SaveSelectedTo( var AList: TStringList );
var
  I: Integer;
begin
  AList.Clear;
  for I := 0 to UniScrollBox1.ComponentCount-1 do
  begin
   if UniScrollBox1.Components[i].ClassType=TUniCheckBox then
      if TUniCheckBox(UniScrollBox1.Components[i]).Checked then
         AList.Add(TUniCheckBox(UniScrollBox1.Components[i]).Caption);
  end;
end;

procedure TFrmMatXcptSuggestedActionDlg.sbtnSelectAllClick(Sender: TObject);
begin
  SelectAll( TRUE );
end;

procedure TFrmMatXcptSuggestedActionDlg.sbtnUnselectAllClick(Sender: TObject);
begin
  SelectAll( FALSE );
end;

procedure TFrmMatXcptSuggestedActionDlg.SelectAll( Value: Boolean );
var
  I: Integer;
begin
   for I := 0 to UniScrollBox1.ComponentCount-1 do
   begin
     if UniScrollBox1.Components[i].ClassType=TUniCheckBox then
        TUniCheckBox(UniScrollBox1.Components[i]).Checked := Value;
   end;
end;


procedure TFrmMatXcptSuggestedActionDlg.addCheckListBox(Str: String;
  Tag: Integer);
 var
  aCheckBox : TUniCheckBox;
begin
  aCheckBox         := TUniCheckBox.Create(UniScrollBox1);
  aCheckBox.Checked := True;
  aCheckBox.Parent  := UniScrollBox1;
  aCheckBox.Caption := Str;
  aCheckBox.Align   := alTop;
  aCheckBox.Tag     := Tag;
end;

procedure TFrmMatXcptSuggestedActionDlg.btnOKClick(Sender: TObject);
begin
  ModalResult:= mrOK;
end;

procedure TFrmMatXcptSuggestedActionDlg.PopulateListBox(AList: TStringList);
var
  i : Integer;
begin
   for i :=0 to  AList.Count - 1 do
      addCheckListBox(AList[ i ],i);
end;

procedure TFrmMatXcptSuggestedActionDlg.PopulateSuggestedActionList ;
var
  AList: TStringList;
begin
  AList:= TStringList.Create;
  try
    LoadColumnValueIntoStringList( AList, 'select distinct action from  v_po_exist_ideal_dtl' );
    AList.Sort;
    PopulateListBox( AList );
 finally
    AList.Free;
 end;
end;

end.
