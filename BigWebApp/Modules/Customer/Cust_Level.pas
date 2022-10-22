unit Cust_Level;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus,
  IQMS.WebVcl.About,
  IQMS.WebVcl.RepDef,
  FireDAC.Comp.Client,
  Data.DB,
  FireDAC.Comp.DataSet,
  Vcl.Buttons,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.SecurityRegister,
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
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmCustomerLevel = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Reports1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrinterSetup1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQRepDef1: TIQWebRepDef;
    PrinterSetupDialog1: TPrinterSetupDialog;
    IQAbout1: TIQWebAbout;
    PnlToolbar: TUniPanel;
    PnlMain: TUniPanel;
    PMain: TUniPopupMenu;
    Grid: TIQUniGridControl;
    SrcArcustoLevel: TDataSource;
    QryArcustoLevel: TFDQuery;
    FDUpdateSQLCustLevel: TFDUpdateSQL;
    QryArcustoLevelID: TBCDField;
    QryArcustoLevelSEQ: TBCDField;
    QryArcustoLevelCUST_LEVEL: TBCDField;
    QryArcustoLevelNAME: TStringField;
    QryArcustoLevelDESCRIP: TStringField;
    sbtnMoveUp: TUniSpeedButton;
    sbtnMoveDown: TUniSpeedButton;
    sbtnSearchInv: TUniSpeedButton;
    Search1: TUniMenuItem;
    PkArcustoLevel: TIQWebHPick;
    PkArcustoLevelSEQ: TBCDField;
    PkArcustoLevelCUST_LEVEL: TBCDField;
    PkArcustoLevelNAME: TStringField;
    PkArcustoLevelDESCRIP: TStringField;
    PkArcustoLevelID: TBCDField;
    SR: TIQWebSecurityRegister;
    procedure Exit1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrinterSetup1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure QryArcustoLevelNewRecord(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnMoveUpClick(Sender: TObject);
    procedure sbtnMoveDownClick(Sender: TObject);
    procedure Search1Click(Sender: TObject);
    { TODO : TGridDrawState not converted }
   { procedure GridCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);  }
    procedure QryArcustoLevelBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure DoShow;
  end;

implementation

{$R *.dfm}

uses
  cust_rscstr,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  IQMS.Common.TableSequence;

{ TFrmCustomerLevel }

class procedure TFrmCustomerLevel.DoShow;
var
  AForm: TUniForm;
begin
  AForm := IQMS.Common.Controls.FindFormByClassName('TFrmCustomerLevel');
  if not Assigned(AForm) then
    AForm := Self.Create(UniGUIApplication.UniApplication);
  AForm.Show;
end;

procedure TFrmCustomerLevel.FormCreate(Sender: TObject);
begin
  if QryArcustoLevel.Active then QryArcustoLevel.Close;
  QryArcustoLevel.Open;
end;

procedure TFrmCustomerLevel.FormShow(Sender: TObject);
begin
  IQMS.Common.RegFrm.IQRegFormRead(Self, [Self, Grid]);
end;

{ TODO : TGridDrawState not converted }
{procedure TFrmCustomerLevel.GridCalcCellColors(Sender: TObject; Field: TField;
  State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  if Highlight then
    Exit;
  if Field.ReadOnly or Field.Calculated or
    (CompareText(Field.FieldName,'SEQ') = 0) then
    ABrush.Color := clBtnFace;
end;   }

procedure TFrmCustomerLevel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [Self, Grid]);
end;

procedure TFrmCustomerLevel.Search1Click(Sender: TObject);
begin
  with PkArcustoLevel do
    if Execute then
      QryArcustoLevel.Locate('ID', System.Variants.VarAsType(GetValue('ID'), varInteger), []);
end;

procedure TFrmCustomerLevel.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmCustomerLevel.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCustomerLevel.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrmCustomerLevel.PrinterSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrmCustomerLevel.QryArcustoLevelBeforePost(DataSet: TDataSet);
var
  AAlreadyExists: Boolean;
begin
  // 05/22/2014 Ensure QryArcustoLevelCUST_LEVEL exists.
  // cust_rscstr.cTXT0000008 = 'Please enter a customer level.';
  IQMS.Common.Miscellaneous.IQAssert(QryArcustoLevelCUST_LEVEL.AsInteger > 0,
   cust_rscstr.cTXT0000008);
  AAlreadyExists := SelectValueFmtAsInteger(
    'SELECT 1 FROM arcusto_level WHERE cust_level = %d AND ' +
    'id <> %d AND ROWNUM < 2', [QryArcustoLevelCUST_LEVEL.AsInteger,
    QryArcustoLevelID.AsInteger]) = 1;
  // cust_rscstr.cTXT0000009 = 'Please enter a unique value for Level.';
  IQMS.Common.Miscellaneous.IQAssert(not AAlreadyExists, cust_rscstr.cTXT0000009);
end;

procedure TFrmCustomerLevel.QryArcustoLevelNewRecord(DataSet: TDataSet);
begin
  QryArcustoLevelID.Value := GetNextID('ARCUSTO_LEVEL');
  QryArcustoLevelSEQ.Value := SelectValueAsInteger(
    'SELECT MAX(seq) FROM arcusto_level') + 1;
end;

procedure TFrmCustomerLevel.sbtnMoveUpClick(Sender: TObject);
begin
  ChangeSequence(QryArcustoLevel { DataSet } , 'ARCUSTO_LEVEL' { TableName } ,
    '' { Master Field } , QryArcustoLevelSEQ.AsInteger { Current Seq } ,
    QryArcustoLevelSEQ.AsInteger - 1 { New Seq } ); // table_seq
end;

procedure TFrmCustomerLevel.sbtnMoveDownClick(Sender: TObject);
begin
  ChangeSequence(QryArcustoLevel { DataSet } , 'ARCUSTO_LEVEL' { TableName } ,
    '' { Master Field } , QryArcustoLevelSEQ.AsInteger { Current Seq } ,
    QryArcustoLevelSEQ.AsInteger + 1 { New Seq } ); // table_seq
end;

end.
