unit cc_sequences;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  MainModule,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  IQMS.WebVcl.About,
  Vcl.Menus,
  FireDAC.UI.Intf,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmCCSequences = class(TUniForm)
    SrcSequences: TDataSource;
    QrySequences: TFDQuery;
    QrySequencesDESCRIPTION: TStringField;
    QrySequencesSEQUENCE_NAME: TStringField;
    QrySequencesSEQUENCE_VALUE: TFMTBCDField;
    PnlGrid: TUniPanel;
    Grid: TIQUniGridControl;
    cmbGridCurrentValue: TUniEdit;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    Edit1: TUniMenuItem;
    ChangeCurrentSequence1: TUniMenuItem;
    PMain: TUniPopupMenu;
    ChangeCurrentSequence2: TUniMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    { TODO : TGridDrawState not yet converted }
    {procedure GridCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush); }
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure ChangeCurrentSequence1Click(Sender: TObject);
    { TODO : TNavigateBtn not yet converted }
    //procedure NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure DoShow;
  end;

implementation

{$R *.dfm}


uses
  IQMS.Common.Controls,
  IQMS.Common.InquireNumber,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Sequence;

class procedure TFrmCCSequences.DoShow;
var
  AForm: TFrmCCSequences;
begin
  { TODO : Incompatible types: 'TUniForm' and 'TForm' }
  //AForm := IQMS.Common.Controls.FindFormByClassType(Self);
  //for testing removed the not in the below if statement
  if not Assigned(AForm) then
    AForm := TFrmCCSequences.Create(UniGUIApplication.UniApplication);
  AForm.Show;
end;

procedure TFrmCCSequences.FormCreate(Sender: TObject);
begin
  QrySequences.Connection := UniMainModule.FDConnection1;
  QrySequences.Close;
  QrySequences.Open;
  { TODO : ncompatible types: 'TDBNavigator' and 'TUniDBNavigator' }
  //IQMS.Common.Controls.AutoSizeNavBar(NavMain);
  QrySequencesDESCRIPTION.ReadOnly := True;
  QrySequencesSEQUENCE_NAME.ReadOnly := True;
  QrySequencesSEQUENCE_VALUE.ReadOnly := True;
end;

procedure TFrmCCSequences.FormShow(Sender: TObject);
begin
  IQMS.Common.RegFrm.IQRegFormRead(Self, [Self, Grid]);
end;

procedure TFrmCCSequences.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [Self, Grid]);
end;

procedure TFrmCCSequences.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCCSequences.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

{ TODO : TGridDrawState not yet converted }
{procedure TFrmCCSequences.GridCalcCellColors(Sender: TObject; Field: TField;
  State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  if Highlight then
    Exit;
  if (CompareText(Field.FieldName, 'DESCRIPTION') = 0) or
    (CompareText(Field.FieldName, 'SEQUENCE_NAME') = 0) then
    ABrush.Color := clBtnFace;
end;        }

{ TODO : TNavigateBtn not yet converted }
{procedure TFrmCCSequences.NavMainBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbEdit then
    begin
      ChangeCurrentSequence1Click(nil);
      System.SysUtils.Abort;
    end;
end;   }

procedure TFrmCCSequences.ChangeCurrentSequence1Click(Sender: TObject);
var
  ASequenceName: string;
  AValue: Integer;
begin
  ASequenceName := QrySequencesSEQUENCE_NAME.AsString;
  AValue := QrySequencesSEQUENCE_VALUE.AsInteger;
  if  IQMS.Common.InquireNumber.IQInputInteger('Change Value',
    'Change current sequence value to:', AValue) then
    begin
      IQMS.Common.Sequence.SetCurrentSequenceNumber(AValue, ASequenceName);
      QrySequences.Close;
      QrySequences.Open;
      QrySequences.Locate('SEQUENCE_NAME', ASequenceName, []);
    end;
end;

end.
