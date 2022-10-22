unit TariffChange;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.WebVcl.UDComboBox,
  vcl.Wwdbdatetimepicker,
  Data.DB,
  vcl.wwdatsrc,
  FireDAC.Comp.Client,
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
  FireDAC.Comp.DataSet,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel, uniMultiItem, uniComboBox, uniDBComboBox, uniDateTimePicker,
  uniDBDateTimePicker;

type
  TFrmTariffChange = class(TUniForm)
    Label1: TUniLabel;
    Label2: TUniLabel;
    wwDate: TUniDBDateTimePicker;
    IQUDComboBox1: TIQWebUDComboBox;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    BtnOk: TUniButton;
    BtnCancel: TUniButton;
    TblTariff: TFDTable;
    SrcTariff: TDataSource;
    TblTariffID: TBCDField;
    TblTariffDATE_REVIEWED: TDateTimeField;
    TblTariffREASON: TStringField;
    TblTariffDATE_CHANGED: TDateTimeField;
    TblTariffARINVT_ID: TBCDField;
    TblTariffUSERID: TStringField;
    TblTariffOLD_TARIFF_CODE_ID: TBCDField;
    TblTariffNEW_TARIFF_CODE_ID: TBCDField;
    procedure TblTariffFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FOldTariffCodeId:Real;
    FNewTariffCodeId:Real;
    FArinvtID:Real;
    FResult:Boolean;
    procedure SetArinvtID(const Value: Real);
    procedure SetNewTariffCodeId(const Value: Real);
    procedure SetOldTariffCodeId(const Value: Real);

  public
    { Public declarations }
    property LArinvtID : Real write SetArinvtID;
    property OldTariffCodeId : Real write SetOldTariffCodeId;
    property NewTariffCodeId : Real write SetNewTariffCodeId;
  end;

procedure DoTariffChange(ArinvtID, AOldTariffCodeId, ANewTariffCodeId:Real);

implementation
uses
  IQMS.Common.DataLib,
  IQMS.Common.StringUtils,
  IQMS.Common.RegFrm;

{$R *.dfm}

procedure DoTariffChange( ArinvtID, AOldTariffCodeId, ANewTariffCodeId:Real);
var
  LFrmTariffChange : TFrmTariffChange;
begin
  LFrmTariffChange := TFrmTariffChange.Create(UniGUIApplication.UniApplication);
  with LFrmTariffChange do
  begin
    LArinvtID := ArinvtID;
    OldTariffCodeId := AOldTariffCodeId;
    NewTariffCodeId := ANewTariffCodeId;
    ShowModal;
    if not FResult then
    begin
      ExecuteCommandFmt('insert into TARIFF_CODE_HISTORY (arinvt_id, OLD_TARIFF_CODE_ID, NEW_TARIFF_CODE_ID, date_changed, reason, date_reviewed, userid) ' +
                'values (%f, decode(%f, 0, null, %f), decode(%f, 0, null, %f), sysdate, ''%s'', To_Date(''%s'', ''MM/DD/RRRR''), misc.GetUserName)',
                [FArinvtID,
                 FOldTariffCodeId,
                 FOldTariffCodeId,
                 FNewTariffCodeId,
                 FNewTariffCodeId,
                 'Tariff change reason entry cancelled by user.',
                 FormatDateTime('mm/dd/yyyy', wwDate.DateTime)]);
    end;
  end;

end;

procedure TFrmTariffChange.BtnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmTariffChange.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
end;

procedure TFrmTariffChange.SetArinvtID(const Value: Real);
begin
  FArinvtID := Value;
end;

procedure TFrmTariffChange.SetNewTariffCodeId(const Value: Real);
begin
  FNewTariffCodeId := Value;
end;

procedure TFrmTariffChange.SetOldTariffCodeId(const Value: Real);
begin
  FOldTariffCodeId := Value;
end;

procedure TFrmTariffChange.TblTariffFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
// to fool the IQUDComboBox1
  Accept := false;
end;

procedure TFrmTariffChange.UniFormShow(Sender: TObject);
begin
  IQRegFormRead( self, [self]);
  TblTariff.Open;
  wwDate.DateTime := Date;
  FResult := false;
end;

procedure TFrmTariffChange.BtnOkClick(Sender: TObject);
begin
  ExecuteCommandFmt('insert into TARIFF_CODE_HISTORY (arinvt_id, OLD_TARIFF_CODE_ID, NEW_TARIFF_CODE_ID, date_changed, reason, date_reviewed, userid) ' +
        'values (%f, decode(%f, 0, null, %f), decode(%f, 0, null, %f), sysdate, ''%s'', To_Date(''%s'', ''MM/DD/RRRR''), misc.GetUserName)',
         [FArinvtID,
          FOldTariffCodeId,
          FOldTariffCodeId,
          FNewTariffCodeId,
          FNewTariffCodeId,
          StrTran(Copy(IQUDComboBox1.Text, 1, 2000), '''', ''''''),
          FormatDateTime('mm/dd/yyyy', wwDate.DateTime)]);
  FResult := true;
  Close;
end;

end.
