unit InvTrSum;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Menus,
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
  Data.DB,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniRadioButton,
  uniEdit,
  uniPanel,
  uniDateTimePicker,
  uniSplitter,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniMainMenu,
  uniLabel;

type
  TFrmInvTransSummary = class(TUniForm)
    gbResult: TUniGroupBox;
    gbFilter: TUniGroupBox;
    QrySum: TFDQuery;
    QryMoneySum: TFDQuery;
    Panel4: TUniPanel;
    Panel5: TUniPanel;
    SBDrillDown: TUniButton;
    PnlClient04: TUniPanel;
    Splitter2: TUniSplitter;
    PnlLeft02: TUniPanel;
    Label3: TUniLabel;
    Label5: TUniLabel;
    Label4: TUniLabel;
    Label6: TUniLabel;
    PnlClient02: TUniPanel;
    edIN: TUniEdit;
    edOUT: TUniEdit;
    edAmtIn: TUniEdit;
    edAmtOut: TUniEdit;
    Panel6: TUniPanel;
    Panel7: TUniPanel;
    radioMTD: TUniRadioButton;
    radioYTD: TUniRadioButton;
    radioRange: TUniRadioButton;
    PnlClient03: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    PnlClient01: TUniPanel;
    DateTimePicker1: TUniDateTimePicker;
    DateTimePicker2: TUniDateTimePicker;
    Splitter3: TUniSplitter;
    PResult: TUniPopupMenu;
    DrillDowntoTransactionLog1: TUniMenuItem;
    PnlButtonsRight: TUniPanel;
    btnCalculate: TUniButton;
    procedure btnCalculateClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GroupBox2Click(Sender: TObject);
    procedure DoDrillDownToTransLog(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FArinvt_ID: Real;
    procedure Calculate_IN_OUT( Date1, Date2: TDateTime );
    function  Calculate( const In_Out: string;  Date1, Date2: TDateTime ):string;
    function  CalculateAmt( const In_Out: string;  Date1, Date2: TDateTime ):string;
    procedure EnableControl( AWinControl: TWinControl; AValue: Boolean );
    procedure ClearText;
  public
    { Public declarations }
    property Arinvt_ID: Real read FArinvt_ID write FArinvt_ID;
  end;

procedure DoInvTransSummary( AArinvt_ID: Real );

implementation

{$R *.DFM}

uses
  inv_rscstr,
  IQMS.Common.Controls,
  IQMS.Common.Dates,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;
{ TODO -oGPatil -cWebConvert : Dependency
  trlgdtal;  }

procedure DoInvTransSummary(AArinvt_ID: Real );
var
  LFrmInvTransSummary : TFrmInvTransSummary;
begin
    LFrmInvTransSummary := TFrmInvTransSummary.Create(UniGUIApplication.UniApplication);
    LFrmInvTransSummary.Arinvt_ID:= AArinvt_ID;
    LFrmInvTransSummary.Show;
end;

procedure TFrmInvTransSummary.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, gbFilter, PnlLeft01, PnlLeft02 ]);
end;

procedure TFrmInvTransSummary.btnCalculateClick(Sender: TObject);
begin
  ClearText;

  if radioMTD.Checked then
     Calculate_IN_OUT( IQBoM( Date ), Date )
  else if radioYTD.Checked then
     Calculate_IN_OUT( IQBoY( Date ), Date )
  else
     Calculate_IN_OUT( DateTimePicker1.Datetime, DateTimePicker2.Datetime );
end;

procedure TFrmInvTransSummary.ClearText;
begin
  edIN.Clear;
  edOUT.Clear;
  edAmtIN.Clear;
  edAmtOUT.Clear;
end;

procedure TFrmInvTransSummary.Calculate_IN_OUT( Date1, Date2: TDateTime );
begin
  if Date1 > Date2 then
     raise Exception.Create(inv_rscstr.cTXT0000091 {'Invalid date range'});
  edIN.Text := Calculate( 'IN',  Date1, Date2 );
  edOUT.Text:= Calculate( 'OUT', Date1, Date2 );
  edAmtIN.Text := CalculateAmt( 'IN',  Date1, Date2 );
  edAmtOUT.Text:= CalculateAmt( 'OUT', Date1, Date2 );
end;

function TFrmInvTransSummary.Calculate( const In_Out: string;  Date1, Date2: TDateTime ):string;
begin
  with QrySum do
  begin
    Close;
    ParamByName('arinvt_id').Value := Arinvt_ID;
    ParamByName('date1').Value := Trunc(Date1);
    ParamByName('date2').Value := Trunc(Date2);
    ParamByName('trans_in_out').Value := In_Out;
    Open;
    Result:= FormatFloat('###,###,###,###.######', Fields[ 0 ].asFloat);
    Close;
  end;
end;

function TFrmInvTransSummary.CalculateAmt( const In_Out: string;  Date1, Date2: TDateTime ):string;
begin
  with QryMoneySum do
  begin
    Close;
    ParamByName('arinvt_id').Value := Arinvt_ID;
    ParamByName('date1').Value := Trunc(Date1);
    ParamByName('date2').Value := Trunc(Date2);
    ParamByName('trans_in_out').Value := In_Out;
    Open;
    Result:= Format('%.6f', [Fields[ 0 ].asFloat]);
//    Result:= FormatFloat('###,###,###,###.######', Fields[ 0 ].asFloat);
    Close;
  end;
end;

procedure TFrmInvTransSummary.GroupBox2Click(Sender: TObject);
begin
  ClearText;
  EnableControl( DateTimePicker1, Sender = radioRange );
  EnableControl( DateTimePicker2, Sender = radioRange );
end;

procedure TFrmInvTransSummary.UniFormCreate(Sender: TObject);
begin
{ TODO -oGPatil -cWebConvert : Incompatible types: 'TForm' and 'TFrmInvTransSummary'
  CenterForm(Self); // IQMS.Common.Controls.pas   }
  IQRegFormRead( self, [ self, gbFilter, PnlLeft01, PnlLeft02 ]);
  DateTimePicker1.Datetime:= Date;
  DateTimePicker2.Datetime:= Date;
  GroupBox2Click( radioMTD );
end;

procedure TFrmInvTransSummary.UniFormShow(Sender: TObject);
begin
  Caption:= Format(inv_rscstr.cTXT0000204, [ SelectValueByID('rtrim(itemno) || ''/'' || rtrim(descrip)', 'arinvt', Arinvt_ID )]); // 'Inventory Summary [ %s ]';
end;

procedure TFrmInvTransSummary.EnableControl( AWinControl: TWinControl; AValue: Boolean );
begin
  AWinControl.Enabled:= AValue;
  if AValue then
    TUniEdit(AWinControl).Color:= clWindow
  else
    TUniEdit(AWinControl).Color:= clBtnFace;
end;

procedure TFrmInvTransSummary.DoDrillDownToTransLog(Sender: TObject);
var
  ADateStart, ADateEnd: TDateTime;
  Year, Month, Day, Hour, Min, Sec, MSec: Word;
begin
  ADateEnd := Date;
  DecodeDate(Now, Year, Month, Day);
  if radioRange.Checked then
  begin
    ADateStart := DateTimePicker1.Datetime;
    ADateEnd   := DateTimePicker2.Datetime;
  end
  else if radioMTD.Checked then
    ADateStart := EncodeDate(Year, Month, 1)
  else
    ADateStart := EncodeDate(Year, 1, 1);

  ADateStart:= Trunc(ADateStart);
  ADateEnd  := Trunc(ADateEnd);
{ TODO -oGPatil -cWebConvert : Dependency
  DoTransLogBetweenDatesAll( Arinvt_ID, ADateStart, ADateEnd);     {in TrLgDtAl.pas}
end;

procedure TFrmInvTransSummary.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmINVENTORY{HTM} );  {IQMS.Common.HelpHook.pas}
end;

end.
