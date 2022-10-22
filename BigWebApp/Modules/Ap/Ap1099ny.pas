unit AP1099NY;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
//  Spin,
  Data.DB,
  IQMS.WebVcl.Hpick,
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
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniSpinEdit,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel;

type
  TFrm1099NewYear = class(TUniForm)
    edDescrip: TUniEdit;
    seYear: TUniSpinEdit;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOk: TUniButton;
    btnCancel: TUniButton;
    Qry1099: TFDQuery;
    PkEin: TIQWebHPick;
    PkEinID: TBCDField;
    PkEinDESCRIP: TStringField;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure Insert1099;
  public
    { Public declarations }
    FID:Real;
    FEINId:Real;
    FEINDescrip:String;
  end;

function DoGetNew1099Year: Real;

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  ap_rscstr;

function DoGetNew1099Year:Real;
var
  frm: TFrm1099NewYear;
begin
  frm:= TFrm1099NewYear.Create(uniGUIApplication.UniApplication);
  frm.ShowModal;
  Result := frm.FID;
end;

procedure TFrm1099NewYear.UniFormCreate(Sender: TObject);
begin
  FID := 0;
  seYear.Value := StrToInt(FormatDateTime('yyyy', Date));
end;

procedure TFrm1099NewYear.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrm1099NewYear.btnOkClick(Sender: TObject);
var
  AId:Real;
begin
  FEINId := 0;
  if (SelectValueAsString('select NVL(SEPARATE_PR_ECOMPANY, ''N'') from iqsys where rownum < 2') = 'Y')
    and (SelectValueAsFloat('select count(id) from eplant where ein_id is not null') <> 0) then
  begin
    with PkEin do
    if Execute then
    begin
      FEINId := GetValue('ID');
      FEINDescrip := GetValue('DESCRIP');
    end
    else
      Exit;

    if SelectValueFmtAsFloat('select id from ap1099_years where year = ''%s'' and ein_id = %f', [IntToStr(seYear.Value), FEINId]) <> 0 then
      raise Exception.Create(Format(ap_rscstr.cTXT0000005 {'Year %d already exists'}, [seYear.Value]));

  end
  else
    if SelectValueFmtAsFloat('select id from ap1099_years where year = ''%s''', [IntToStr(seYear.Value)]) <> 0 then
      raise Exception.Create(Format(ap_rscstr.cTXT0000005 {'Year %d already exists'}, [seYear.Value]));



  FID := GetNextID('AP1099_YEARS');
  Insert1099;
  Close;
end;

procedure TFrm1099NewYear.Insert1099;
begin
  ExecuteCommandFmt('insert into ap1099_years (id, year, descrip) values (%f, ''%d'', ''%s'')',
                                     [FID, seYear.Value, edDescrip.Text]);

  if FEINId <> 0 then
    ExecuteCommandFmt('update ap1099_years set ein_id = %f where id = %f', [FEINId, FID]);


  ExecuteCommandFmt('begin ap.Populate_AP1099_Detil(''%s'', %f, %f, ''%s''); end;', [IntToStr(seYear.Value), FID, FEINId, FEINDescrip]);

//  with Qry1099 do
//  begin
//    Close;
//    ParamByName('ADate').Value := IntToStr(seYear.Value);
//    ParamByName('NID').Value := FID;
//    ParamByName('AEin_Id').Value := FEINId;
//    ParamByName('AEin_Descrip').Value := FEINDescrip;
//    Prepare;
//    ExecSql;
//  end;
end;


end.
