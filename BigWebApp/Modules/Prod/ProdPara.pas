unit ProdPara;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  Db,
  ComCtrls,
  Wwdatsrc,
  Mask,
  wwdbedit,
  DBCtrls,
  ExtCtrls,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniDBCheckBox,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel,
  uniPageControl, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TFrmProdParams = class(TUniForm)
    wwDataSource1: TDataSource;
    wwTable1: TFDTable;
    Panel1: TUniPanel;
    PageControl1: TUniPageControl;
    TabSheet1: TUniTabSheet;
    GroupBox2: TUniGroupBox;
    DBCheckBox1: TUniDBCheckBox;
    GroupBox1: TUniGroupBox;
    Label1: TUniLabel;
    wwDBSpinEdit1: TUniDBNumberEdit;
    Bevel1: TUniPanel;
    DBCheckBox2: TUniDBCheckBox;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    lblMatConsPercentWarn: TUniLabel;
    ebdMatConsPercentWarn: TUniDBEdit;
    DBCheckBox3: TUniDBCheckBox;
    dbchkHideProdRepCurrShift: TUniDBCheckBox;
    DBCheckBox4: TUniDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBCheckBox4Click(Sender: TObject);
    procedure wwTable1BeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure CheckNotifyPrecisionChange(ANewPrecision: Integer);
  end;

procedure DoProdRepParams;

implementation

{$R *.DFM}

uses
  IQMS.Common.RegFrm,
  IQMS.Common.Dialogs,
  IQMS.Common.HelpHook,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.DataLib,
  { TODO -oathite -cWebConvert : dependent on IQSecIns
  IQSecIns, }
  IQMS.Common.Controls;

procedure DoProdRepParams;
begin
  with TFrmProdParams.Create(uniGUIApplication.UniApplication) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TFrmProdParams.FormCreate(Sender: TObject);
begin
  IQRegFormRead(self, [ self ]);
  Reopen( wwTable1 );
  { TODO -oathite -cWebConvert : Undeclared identifier: 'dbchkFreezeConsumptionBeyondHA'
  IQEnableControl( dbchkFreezeConsumptionBeyondHA, DBCheckBox4.Checked );  }
end;

procedure TFrmProdParams.FormShow(Sender: TObject);
begin
  { TODO -oathite -cWebConvert : dependent on IQSecIns
  EnsureSecurityInspectorOnTopOf( self );           }
end;

procedure TFrmProdParams.wwTable1BeforePost(DataSet: TDataSet);
begin
  if wwTable1.FieldByName('DISPO_HARD_ALLOC_WO_FINISHED').asString <> 'Y' then
    wwTable1.FieldByName('FREEZE_CONS_BEYOND_HARD_ALLOC').Clear;
end;

procedure TFrmProdParams.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self ]);
  Action:= caFree;
end;

procedure TFrmProdParams.btnOKClick(Sender: TObject);
var
  APrecision: Real;
begin
  TFrmProdParams.CheckNotifyPrecisionChange( wwTable1.FieldByName('PROD_REP_DECIMAL').asInteger );

  wwTable1.CheckBrowseMode;

  Close;
end;


class procedure TFrmProdParams.CheckNotifyPrecisionChange( ANewPrecision: Integer );
var
  AOldPrecision: Real;
  S: string;
begin
  S:= '';
  if SecurityManager.EPlantsExist then
     S:= 'Modifying the Production Report Parameters will affect all EPlants.'#13#13;

  if ANewPrecision < 6 then
     IQConfirm( S +
                'Reducing the decimal precision of the inventory usage calculations could '+
                'cause rounding variances in post inventory transactions ');

  AOldPrecision:= SelectValueAsFloat('select prod_rep_decimal from params');

  if (AOldPrecision <> ANewPrecision) then
     ExecuteCommandFmt('insert into eventlog( event_time, userid, text, class ) values (sysdate, ''%s'', ''%s'', ''PROD REP'')',
                [ SecurityManager.UserName,
                Format('Production reporting decimal precision has been altered from %.0f to %d',  [ AOldPrecision, ANewPrecision ])]);
end;


procedure TFrmProdParams.DBCheckBox4Click(Sender: TObject);
begin
  { TODO -oathite -cWebConvert : There is no overloaded version of 'IQEnableControl' that can be called with these arguments
  IQEnableControl( dbchkFreezeConsumptionBeyondHA, DBCheckBox4.Checked );}
end;

procedure TFrmProdParams.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmPROD_REP{HTM} );  {IQMS.Common.HelpHook.pas}
end;

end.
