unit FR_Param;

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
  DBCtrls,
  Db,
  ComCtrls,
  Mask,
  IQMS.WebVcl.SecurityRegister,
  ExtCtrls,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniDBCheckBox,
  uniEdit,
  uniDBEdit,
  uniRadioButton,
  uniRadioGroup,
  uniDBRadioGroup,
  uniPanel,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel,
  uniPageControl;

type
  TFrmForeParams = class(TUniForm)
    PageControl1: TUniPageControl;
    TabSheet1: TUniTabSheet;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    DataSource1: TDataSource;
    Table1: TFDTable;
    DBCheckBox1: TUniDBCheckBox;
    DBEdit1: TUniDBEdit;
    Label1: TUniLabel;
    Panel1: TUniPanel;
    Label3: TUniLabel;
    rbtnWeekly: TUniRadioButton;
    rbtnMonthly: TUniRadioButton;
    Panel2: TUniPanel;
    Label4: TUniLabel;
    rbtnPromiseDate: TUniRadioButton;
    rbtnMustShipDate: TUniRadioButton;
    TabSheet2: TUniTabSheet;
    DBCheckBox2: TUniDBCheckBox;
    DBCheckBox3: TUniDBCheckBox;
    DBCheckBox4: TUniDBCheckBox;
    dbGroupBoxGenerateForecast: TUniDBRadioGroup;
    GroupBoxConsume: TUniGroupBox;
    GroupBoxWO: TUniGroupBox;
    GroupBox1: TUniGroupBox;
    SR: TIQWebSecurityRegister;
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Table1BeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoForecastParams();



implementation

uses
  IQMS.Common.HelpHook
  { TODO -oSanketG -cWebConvert : Need to revisit }
  //IQSecIns
  ;

{$R *.DFM}

procedure DoForecastParams();
var
  FrmForeParams: TFrmForeParams;
begin
  FrmForeParams := TFrmForeParams.Create( uniGUIApplication.UniApplication );
  FrmForeParams.ShowModal;
end;

procedure TFrmForeParams.FormCreate(Sender: TObject);
begin
  Table1.Open;
  // dbchkGenerateBy.Hint:= 'Check to generate forecast based on past shipments.'#13'Default is sales orders.';

  rbtnWeekly.Checked := Table1.FieldByName('FR_CONSUME_MONTHLY').asString <> 'Y';
  rbtnMonthly.Checked:= Table1.FieldByName('FR_CONSUME_MONTHLY').asString = 'Y';

  rbtnPromiseDate.Checked := Table1.FieldByName('FR_MUST_SHIP_BASED').asString <> 'Y';
  rbtnMustShipDate.Checked:= Table1.FieldByName('FR_MUST_SHIP_BASED').asString = 'Y';

  PageControl1.ActivePageIndex:= 0;
end;

procedure TFrmForeParams.btnOKClick(Sender: TObject);
begin
  Table1.Edit;
  if rbtnMonthly.Checked then
     Table1.FieldByName('FR_CONSUME_MONTHLY').asString:= 'Y'
  else
     Table1.FieldByName('FR_CONSUME_MONTHLY').asString:= 'N';

  if rbtnMustShipDate.Checked then
     Table1.FieldByName('FR_MUST_SHIP_BASED').asString:= 'Y'
  else
     Table1.FieldByName('FR_MUST_SHIP_BASED').asString:= 'N';

  Table1.Post;

  ModalResult:= mrOK;
end;

procedure TFrmForeParams.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmForecast{CHM}, iqhtmForecast{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmForeParams.FormShow(Sender: TObject);
begin
  { TODO -oSanketG -cWebConvert : Need to revisit, dependent on IQSecIns }
  //EnsureSecurityInspectorOnTopOf( self );
end;

procedure TFrmForeParams.Table1BeforePost(DataSet: TDataSet);
begin
  if DataSet.FieldByName('FR_WO_TIME_FENCE').AsFloat > 999.999 then
    raise exception.create('WO Time Fence should be less than or equal to 999.99');

end;

end.
