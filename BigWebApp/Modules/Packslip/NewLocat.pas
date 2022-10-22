unit NewLocat;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Psnewloc,
  FireDAC.Comp.DataSet,
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
  IQMS.WebVcl.Hpick,
  Data.DB,
  FireDAC.Comp.Client,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Buttons,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniLabel, uniDateTimePicker, uniDBDateTimePicker, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDBLookupComboBox, uniEdit, uniBitBtn, uniSpeedButton,
  uniButton, uniPanel, uniStatusBar;

type
  TFrmNewLocByArinvt = class(TFrmNewLocation)
    Label4: TUniLabel;
    wwDBDateTimePickerLotDate: TUniDBDateTimePicker;
  strict private
    { Private declarations }
    FDate: TDateTime;
    FNonConformID: Real;
    FFGMultiID: Real;
  protected
    function GetArinvtID: Real; override;
    procedure InsertFGMulti(AArinvtID, ALocID: Real;
      const ALotNo: string); override;
  public
    { Public declarations }
    property FGMultiID: Real read FFGMultiID write FFGMultiID;
    property InDate: TDateTime read FDate write FDate;
    property NonConformID: Real read FNonConformID write FNonConformID;
  end;

function GetNewLocationByArinvt(AArinvtID: Real; var AFGMultiID: Real;
  ADivision_ID: Real = 0): TModalResult;
function GetNewLocationByArinvt_B(AArinvtID: Real; var AFGMultiID: Real;
  ANonConform_ID: Real; ADivision_ID: Real = 0): TModalResult;
function GetNewLocationDefaultLotByArinvt(AArinvtID: Real; var AFGMultiID: Real;
  const ALot: string; ADate: TDateTime; ADivision_ID: Real = 0;
  AWorkorder_ID: Real = 0): TModalResult;

implementation

{$R *.DFM}


uses
  IQMS.Common.DataLib,
  uniGUIApplication;

function GetNewLocationByArinvt(AArinvtID: Real; var AFGMultiID: Real;
  ADivision_ID: Real = 0): TModalResult;
begin
  with TFrmNewLocByArinvt.Create(UniApplication) do
    begin
      ArinvtID := AArinvtID;
      DivisionID := ADivision_ID;
      InDate := Date;
      Result := ShowModal;
      if Result = mrOK then
        AFGMultiID := FGMultiID;
    end;
end;

function GetNewLocationByArinvt_B(AArinvtID: Real; var AFGMultiID: Real;
  ANonConform_ID: Real; ADivision_ID: Real = 0): TModalResult;
begin
  with TFrmNewLocByArinvt.Create(UniApplication) do
    begin
      ArinvtID := AArinvtID;
      DivisionID := ADivision_ID;
      NonConformID := ANonConform_ID;
      InDate := Date;
      Result := ShowModal;
      if Result = mrOK then
        AFGMultiID := FGMultiID;
    end;
end;

function GetNewLocationDefaultLotByArinvt(AArinvtID: Real; var AFGMultiID: Real;
  const ALot: string; ADate: TDateTime; ADivision_ID: Real = 0;
  AWorkorder_ID: Real = 0): TModalResult;
begin
  with TFrmNewLocByArinvt.Create(UniApplication) do
    begin
      ArinvtID := AArinvtID;
      DivisionID := ADivision_ID;
      EditLotNo.Text := ALot;
      InDate := ADate;
      Result := ShowModal;
      if Result = mrOK then
        AFGMultiID := FGMultiID;
    end;
end;

function TFrmNewLocByArinvt.GetArinvtID: Real;
begin
  Result := FArinvtID;
end;

procedure TFrmNewLocByArinvt.InsertFGMulti(AArinvtID, ALocID: Real;
  const ALotNo: string);
var
  AMake_To_Order_Detail_ID: Real;
begin
  FGMultiID := GetNextID('FGMULTI');

  if Trunc(FNonConformID) <> 0 then
    ExecuteCommandFmt(
      'insert into fgmulti(id, arinvt_id, loc_id, lotno, in_date, non_conform_id) ' +
      'values(%f, %f, %f, ''%s'', to_date(''%s'', ''MM/DD/RRRR HH24:MI:SS''), %f)',
      [FGMultiID, AArinvtID, ALocID, ALotNo,
      FormatDateTime('mm/dd/yyyy hh:nn:ss', FDate), FNonConformID])
  else
    ExecuteCommandFmt(
      'insert into fgmulti(id, arinvt_id, loc_id, lotno, in_date) ' +
      'values(%f, %f, %f, ''%s'', to_date(''%s'', ''MM/DD/RRRR HH24:MI:SS''))',
      [FGMultiID, AArinvtID, ALocID, ALotNo,
      FormatDateTime('mm/dd/yyyy hh:nn:ss', FDate)]);

  if wwDBDateTimePickerLotDate.DateTime > 0 then
    ExecuteCommandFmt(
      'update fgmulti set lot_date = to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss'') where id = %f',
      [FormatDateTime('mm/dd/yyyy hh:nn:ss', wwDBDateTimePickerLotDate.DateTime),
      FGMultiID]);

  self.CheckUpdateLotExpiryDate(AArinvtID, ALotNo);

  if FWorkorder_ID > 0 then
  begin
    AMake_To_Order_Detail_ID := SelectValueFmtAsFloat(
      'select mto.get_ord_detail( %f ) from dual ', [FWorkorder_ID]);
    if AMake_To_Order_Detail_ID > 0 then
      ExecuteCommandFmt(
        'update fgmulti set make_to_order_detail_id = %f where id = %f',
        [AMake_To_Order_Detail_ID, FGMultiID]);
  end;
end;

end.
