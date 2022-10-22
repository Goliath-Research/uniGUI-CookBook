unit JCScope;

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
  Datesdlg,
  StdCtrls,
  ExtCtrls,
  ComCtrls,
  DBCtrls,
  Db,
  Wwtable,
  Wwdatsrc,
  Wwquery,
  IQMS.WebVcl.Hpick,
  Mask,
  wwdbedit,
  Wwdotdot,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniComboBox, uniDBComboBox, uniButton,
  uniPanel, uniDateTimePicker, uniGroupBox;

type
  TFrmJCScope = class(TFrmDatesDialog)
    Label3: TUniLabel;
    Label4: TUniLabel;
    dbOrderno: TUniDBLookupComboBox;
    DbMfgNo: TUniDBLookupComboBox;
    QryOrderno: TFDQuery;
    QryMfgNo: TFDQuery;
    QryOrdernoORDERNO: TStringField;
    QryMfgNoMFGNO: TStringField;
    Label5: TUniLabel;
    wwDBLookupComboWO: TUniDBLookupComboBox;
    wwQryWO: TFDQuery;
    wwQryWOWORKORDER_ID: TBCDField;
    Label6: TUniLabel;
    dbLotNo: TUniDBLookupComboBox;
    wwQryLotNo: TFDQuery;
    wwQryLotNoFG_LOTNO: TStringField;
    Label7: TUniLabel;
    wwDBComboDlgItemNo: TUniEdit;
    PkArinvt: TIQWebHPick;
    PkArinvtID: TBCDField;
    PkArinvtITEMNO: TStringField;
    PkArinvtCLASS: TStringField;
    PkArinvtREV: TStringField;
    PkArinvtDESCRIP: TStringField;
    PkArinvtDESCRIP2: TStringField;
    PkArinvtEPLANT_ID: TBCDField;
    PkArinvtARCUSTO_ID: TBCDField;
    PkArinvtCUSTNO: TStringField;
    PkArinvtCOMPANY: TStringField;
    PkArinvtPK_HIDE: TStringField;
    srcLotNo: TDataSource;
    srcWO: TDataSource;
    srcMfgNo: TDataSource;
    srcOrderno: TDataSource;
    procedure btnOKClick(Sender: TObject);
    procedure AssignParams(DataSet: TDataSet);
    procedure DateTimePicker1CloseUp(Sender: TObject);
    procedure CheckOpenTable(Sender: TObject);
    procedure wwDBComboDlgItemNoCustomDlg(Sender: TObject);
    procedure wwDBComboDlgItemNoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FArinvt_ID: Real;
    procedure SetArinvt_ID(const Value: Real);
    procedure Set_AFrom(const Value: TDateTime);
    procedure Set_AMfgNo(const Value: String);
    procedure Set_AOrderNo(const Value: string);
    procedure Set_ATo(const Value: TDateTime);
    procedure Set_AWorkorder_ID(const Value: Real);
    procedure Set_FLotNo(const Value: string);
  public
    { Public declarations }
    property Arinvt_ID: Real read FArinvt_ID write SetArinvt_ID;
    property AFrom: TDateTime write Set_AFrom;
    property ATo: TDateTime write Set_ATo;
    property AOrderNo: string write Set_AOrderNo;
    property AMfgNo: String write Set_AMfgNo;
    property AWorkorder_ID: Real write Set_AWorkorder_ID;
    property FLotNo: string write Set_FLotNo;
  end;

function GetJCScope( var FFrom, FTo: TDateTime; var FOrderNo, FMfgNo: string; var FWorkorder_ID: Real; var FLotNo: string; var AArinvt_ID: Real ): Boolean;

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  UniGuiApplication;

function GetJCScope( var FFrom, FTo: TDateTime; var FOrderNo, FMfgNo: string; var FWorkorder_ID: Real; var FLotNo: string; var AArinvt_ID: Real ): Boolean;
var
  LFrm: TFrmJCScope;
begin
  LFrm:= TFrmJCScope.Create(UniGuiApplication.UniApplication);
  Result:= LFrm.ShowModal = mrOK;
  if Result then
  begin
    FFrom:= Trunc(LFrm.DateTimePicker1.DateTime);
    FTo  := Trunc(LFrm.DateTimePicker2.DateTime);
    FOrderNo := LFrm.dbOrderno.Text;
    FMfgNo   := LFrm.dbMfgNo.Text;
    if LFrm.wwDBLookupComboWO.Text > '' then
      FWorkorder_ID:= StrToFloat( LFrm.wwDBLookupComboWO.Text )
    else
      FWorkorder_ID:= 0;
    FLotNo:= LFrm.dbLotNo.Text;
    AArinvt_ID:= LFrm.Arinvt_ID;
  end;
end;

procedure TFrmJCScope.btnOKClick(Sender: TObject);
begin
  if wwDBLookupComboWO.Text > '' then
     StrToFloat( wwDBLookupComboWO.Text );

  inherited;
end;

procedure TFrmJCScope.AssignParams(DataSet: TDataSet);
begin
  inherited; {n}

  with DataSet as TFDQuery do
  begin
    ParamByName('date_start').asDateTime:= DateTimePicker1.DateTime;
    ParamByName('date_end').asDateTime  := DateTimePicker2.DateTime;
  end;
end;

procedure TFrmJCScope.DateTimePicker1CloseUp(Sender: TObject);
begin
  inherited;
  IQSetTablesActive( FALSE, self );
end;

procedure TFrmJCScope.CheckOpenTable(Sender: TObject);
begin
  inherited;

  with TUniDBLookupComboBox(Sender) do
    if not DataSource.Dataset.Active then
       DataSource.Dataset.Open;
end;

procedure TFrmJCScope.wwDBComboDlgItemNoCustomDlg(Sender: TObject);
begin
  inherited;
  with PkArinvt do
    if Execute then
       Arinvt_ID:= GetValue('ID');
end;

procedure TFrmJCScope.SetArinvt_ID(const Value: Real);
begin
  FArinvt_ID:= Value;
  if FArinvt_ID = 0 then
     wwDBComboDlgItemNo.Text:= ''
  else
     wwDBComboDlgItemNo.Text:= SelectValueByID('itemno', 'arinvt', FArinvt_ID);
end;

procedure TFrmJCScope.Set_AFrom(const Value: TDateTime);
begin
  if Value <> 0 then
     DateTimePicker1.DateTime:= Value
  else
     DateTimePicker1.DateTime:= Date;
end;

procedure TFrmJCScope.Set_AMfgNo(const Value: String);
begin
  dbMfgNo.Text:= Value;
end;

procedure TFrmJCScope.Set_AOrderNo(const Value: string);
begin
  dbOrderno.Text:= Value;
end;

procedure TFrmJCScope.Set_ATo(const Value: TDateTime);
begin
  if Value <> 0 then
     DateTimePicker2.DateTime:= Value
  else
     DateTimePicker2.DateTime:= DateTimePicker1.DateTime;
end;

procedure TFrmJCScope.Set_AWorkorder_ID(const Value: Real);
begin
  if Value > 0 then
  begin
    wwDBLookupComboWO.KeyValue:= FloatToStr(Value);
  end;
end;

procedure TFrmJCScope.Set_FLotNo(const Value: string);
begin
  dbLotNo.Text:= Value;
end;

procedure TFrmJCScope.wwDBComboDlgItemNoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = VK_DELETE then
  begin
    Arinvt_ID:= 0;
    Key:= 0;
  end;
end;

end.
