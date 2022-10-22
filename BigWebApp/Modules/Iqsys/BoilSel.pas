unit BoilSel;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  BoilBas,
  Data.DB,
  Mask,
  Vcl.Menus,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniButton,
  uniMainMenu, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, IQMS.WebVcl.HPick,
  FireDAC.Comp.DataSet, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.DBCtrls, uniBasicGrid,
  uniDBGrid, uniEdit, uniDBEdit, uniMultiItem, uniComboBox, uniDBComboBox,
  uniLabel, uniPageControl, uniSplitter, uniDBNavigator, uniBitBtn,
  uniSpeedButton;

type
  TFrmBoilerPlatesViewSelect = class(TFrmBoilerPlates)
    Panel3: TUniPanel;
    Panel4: TUniPanel;
    btnSelect: TUniButton;
    btnClose: TUniButton;
    PopupMenu1: TUniPopupMenu;
    CheckSpelling1: TUniMenuItem;
    procedure btnSelectClick(Sender: TObject);
    procedure CheckSpelling1Click(Sender: TObject);
  private
    { Private declarations }
    FBoiler_ID: Real;
  public
    { Public declarations }
    property Boiler_ID: Real read FBoiler_ID write FBoiler_ID;
  end;

function DoViewSelectBoilerPlate( AType: string; var ABoiler_ID:Real ): Boolean;
procedure SaveToBoilerPlate( AText, AType: string );
procedure AssignTextToField( AField: TField; ABoiler_ID: Real );

var
  FrmBoilerPlatesViewSelect: TFrmBoilerPlatesViewSelect;

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Numbers,
  IQMS.Common.StringUtils,
  iqsys_rscstr,
  IQMS.Common.SpellChecker,
  uniGUIApplication;

function DoViewSelectBoilerPlate( AType: string; var ABoiler_ID:Real ): Boolean;
var
  LFrm: TFrmBoilerPlatesViewSelect;
begin
  LFrm:= TFrmBoilerPlatesViewSelect.Create(uniGUIApplication.UniApplication);
  LFrm.AType:= AType;
  Result:= LFrm.ShowModal = mrOK;
  if Result then
    ABoiler_ID:= LFrm.Boiler_ID;
end;

procedure SaveToBoilerPlate( AText, AType: string );
var
  S: string;
begin
  if InputQuery(iqsys_rscstr.cTXT0000060, // 'Save to Boiler Plate'
                iqsys_rscstr.cTXT0000061, // 'Enter boiler plate description'
                S ) and (Trim(S) <> '') then
    ExecuteCommandFmt('insert into boiler_plate( type, text, descrip ) values( ''%s'', ''%s'', ''%s'' )',
               [ AType, StrTran(AText, '''', ''''''), StrTran( S, '''', '''''') ]);
end;

procedure AssignTextToField( AField: TField; ABoiler_ID: Real );
var
  AReplace: Boolean;
  S       : string;
begin
  AReplace:= (Trim(AField.asString) = '') or not
    IQWarningYN(iqsys_rscstr.cTXT0000062{'Append to existing text?'});
  with AField do
  begin
    DataSet.Edit;
    S:= SelectValueFmtAsString('select text from boiler_plate where id = %f', [ ABoiler_ID ]);
    AsString:= IIf( AReplace, S, AsString + #10#13 + S );
  end;
end;

procedure TFrmBoilerPlatesViewSelect.btnSelectClick(Sender: TObject);
begin
  TblBoiler_Plate.CheckBrowseMode;
  Boiler_ID:= TblBoiler_PlateID.asFloat;
  inherited;  // nothing
end;

procedure TFrmBoilerPlatesViewSelect.CheckSpelling1Click(Sender: TObject);
var
  AText:String;
begin
  AText:= dbreText.Text;

  if CheckSpelling( AText ) then
  begin
    TblBoiler_Plate.Edit;
    dbreText.Clear;
    dbreText.Text:= AText;
  end;
end;

end.

