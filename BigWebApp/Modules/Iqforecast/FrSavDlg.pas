unit FrSavDlg;

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
  ComCtrls,
  Db,
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
  uniRadioButton,
  uniDateTimePicker,
  uniGroupBox,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel, uniComboBox, uniDBComboBox;

type
  TFrmForecastSaveDlg = class(TUniForm)
    GroupBox2: TUniGroupBox;
    Label6: TUniLabel;
    rbtnAll_Cust: TUniRadioButton;
    rbtnOne_Cust: TUniRadioButton;
    wwcombCustomer: TUniDBLookupComboBox;
    GroupBox1: TUniGroupBox;
    Label1: TUniLabel;
    rbtnAll_Items: TUniRadioButton;
    rbtnOne_Item: TUniRadioButton;
    wwcombItem: TUniDBLookupComboBox;
    GroupBox3: TUniGroupBox;
    Label2: TUniLabel;
    Label3: TUniLabel;
    DateTimePicker1: TUniDateTimePicker;
    DateTimePicker2: TUniDateTimePicker;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    wwQryCustomer: TFDQuery;
    wwQryCustomerCUSTNO: TStringField;
    wwQryCustomerCOMPANY: TStringField;
    wwQryCustomerARCUSTO_ID: TBCDField;
    wwQryItems: TFDQuery;
    wwQryItemsARINVT_ID: TBCDField;
    wwQryItemsITEMNO: TStringField;
    wwQryItemsCLASS: TStringField;
    wwQryItemsREV: TStringField;
    wwQryItemsDESCRIP: TStringField;
    procBackup: TFDStoredProc;
    procGet_Quarter: TFDStoredProc;
    lblCurrentQuarter: TUniLabel;
    procRestore: TFDStoredProc;
    Src_wwQryCustomer: TDataSource;
    Src_wwQryItems: TDataSource;
    procedure btnOKClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FMode: string;
    procedure Validate;
    procedure ReplaceTableNameIn( wwQry: TFDQuery;  AFromTableName, AToTableName: string );
    procedure SetMode(const Value: string);
  public
    { Public declarations }
    property Mode: string write SetMode;
  end;

procedure DoBackupRestoreForecast( AMode: string = 'Backup');



implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.StringUtils,
  IQMS.Common.PanelMsg,
  ForeMain;

procedure DoBackupRestoreForecast( AMode: string = 'Backup');
var
  FrmForecastSaveDlg: TFrmForecastSaveDlg;
begin
  FrmForecastSaveDlg := TFrmForecastSaveDlg.Create( uniGUIApplication.uniApplication );
  FrmForecastSaveDlg.Mode:= AMode;
  FrmForecastSaveDlg.ShowModal;
end;

procedure TFrmForecastSaveDlg.ReplaceTableNameIn( wwQry: TFDQuery;  AFromTableName, AToTableName: string );
var
  I: Integer;
begin
  with wwQry do
  begin
    Close;
    for I:= 0 to SQL.Count - 1 do
      if Pos(AFromTableName, SQL[ I ]) > 0 then
         SQL[ I ]:= StrTran( SQL[ I ], AFromTableName, AToTableName );
  end;
end;

procedure TFrmForecastSaveDlg.SetMode(const Value: string);
begin
  FMode := Value;
end;

procedure TFrmForecastSaveDlg.UniFormCreate(Sender: TObject);
begin
  {Backup or Restore}
  Caption:= Format('%s Forecast', [ FMode ]);

  if CompareText( FMode, 'Restore' ) = 0 then
  begin
    ReplaceTableNameIn( wwQryCustomer, ' fore_cust ', ' fore_cust_bak ' );
    ReplaceTableNameIn( wwQryItems,    ' fore_item ', ' fore_item_bak ' );
  end;
end;

procedure TFrmForecastSaveDlg.UniFormShow(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );

  {Initial Dates}
  DateTimePicker1.DateTime := Date;
  with procGet_Quarter do
  begin
//    ParamByName('v_date').asDateTime:= Date;
    AssignQueryParamValue(procGet_Quarter, 'v_date', Date);
    ExecProc;
    DateTimePicker2.DateTime := ParamByName('v_qtr_end_date').asDateTime;
    lblCurrentQuarter.Caption:= Format('Current Quarter: %d  [ %s - %s ]',
                                       [ ParamByName('v_quarter').asInteger,
                                         ParamByName('v_qtr_start_date').asString,
                                         ParamByName('v_qtr_end_date').asString ]);
  end;
end;

procedure TFrmForecastSaveDlg.btnOKClick(Sender: TObject);
var
  h: TPanelMesg;
  AProc: TFDStoredProc;
begin
  Validate;
  h:= hPleaseWait('');
  try
    // if CompareText( FMode, 'Restore' ) = 0 then AProc:= procRestore else AProc:= procBackup;
    //
    // with AProc do
    // begin
    //   ParamByName('v_arinvt_id' ).asFloat   := IIf( rbtnOne_Item.Checked, wwQryItemsARINVT_ID.asFloat, 0 );
    //   ParamByName('v_arcusto_id').asFloat   := IIf( rbtnOne_Cust.Checked, wwQryCustomerARCUSTO_ID.asFloat, 0 );
    //   ParamByName('v_start_date').asDateTime:= DateTimePicker1.Date;
    //   ParamByName('v_end_date'  ).asDateTime:= DateTimePicker2.Date;
    //   ParamByName('v_kind'      ).asString  := TFrmForecastMain(self.Owner).ForecastType;
    //   ExecProc;
    // end;

    if CompareText( FMode, 'Restore' ) = 0 then
       ExecuteCommandFmt('begin                                                   '+
                 '  forecast.DoRestore( %f,                               '+   // v_arinvt_id
                 '                      %f,                               '+   // v_arcusto_id
                 '                      to_date( ''%s'', ''mm/dd/yyyy''), '+   // v_start_date
                 '                      to_date( ''%s'', ''mm/dd/yyyy''), '+   // v_end_date
                 '                      ''%s'');                          '+   // v_kind
                 'end;                                                    ',
                 [ DtoF(IIf( rbtnOne_Item.Checked, wwQryItemsARINVT_ID.asFloat, 0)),
                   DtoF(IIf( rbtnOne_Cust.Checked, wwQryCustomerARCUSTO_ID.asFloat, 0)),
                   FormatDateTime('mm/dd/yyyy', DateTimePicker1.DateTime),
                   FormatDateTime('mm/dd/yyyy', DateTimePicker2.DateTime),
                   TFrmForecastMain(self.Owner).ForecastType ])
    else
       ExecuteCommandFmt('begin                                                   '+
                 '  forecast.DoBackup( %f,                                '+   // v_arinvt_id
                 '                     %f,                                '+   // v_arcusto_id
                 '                     to_date( ''%s'', ''mm/dd/yyyy''),  '+   // v_start_date
                 '                     to_date( ''%s'', ''mm/dd/yyyy''),  '+   // v_end_date
                 '                     ''%s'');                           '+   // v_kind
                 'end;                                                    ',
                 [ DtoF(IIf( rbtnOne_Item.Checked, wwQryItemsARINVT_ID.asFloat, 0)),
                   DtoF(IIf( rbtnOne_Cust.Checked, wwQryCustomerARCUSTO_ID.asFloat, 0)),
                   FormatDateTime('mm/dd/yyyy', DateTimePicker1.DateTime),
                   FormatDateTime('mm/dd/yyyy', DateTimePicker2.DateTime),
                   TFrmForecastMain(self.Owner).ForecastType ]);
  finally
    h.Free;
  end;

  ModalResult:= mrOK;
end;

procedure TFrmForecastSaveDlg.Validate;
begin
  {Getting Error Undeclared identifier 'LookupValue' so replaced with 'ListField' for wwcombCustomer}
  IQAssert( not rbtnOne_Cust.Checked or (wwcombCustomer.ListField > ''), 'Customer is not assigned'   );
  IQAssert( not rbtnOne_Item.Checked or (wwcombItem.ListField > ''),     'No Inventory Item selected' );
  IQAssert( DateTimePicker1.DateTime <= DateTimePicker2.DateTime,                  'Invalid Date Range' );
end;

end.
