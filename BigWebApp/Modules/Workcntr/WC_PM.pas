unit WC_PM;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Pm_info,
//  Mask,
//  Vcl.Wwdatsrc,
  IQMS.WebVcl.Jump,
  Vcl.Menus,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIApplication,
  uniMainMenu, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.HPick, Data.DB, uniButton, uniBitBtn, uniDateTimePicker,
  uniDBDateTimePicker, uniDBLookupComboBox, uniMultiItem, uniComboBox,
  uniDBComboBox, uniGUIClasses, uniEdit, uniDBEdit, uniLabel, uniSplitter,
  uniGroupBox, Vcl.Forms, uniGUIBaseClasses, uniPanel;

type
  TPMInfo_WorkCenter = class(TPMinfo)
    popmPM: TUniPopupMenu;
    JumptoPMEquipment1: TUniMenuItem;
    PMWorkorderReferences1: TUniMenuItem;
    IQJumpPM: TIQWebJump;
    procedure JumptoPMEquipment1Click(Sender: TObject);
    procedure PMWorkorderReferences1Click(Sender: TObject);
  private
    { Private declarations }
    procedure EnableEditControls(AEnabled: Boolean);
  public
    { Public declarations }
  end;

// Informational only
procedure DoWorkCenterPMInfo(AID: Real);
// Allows edit
function DoWorkCenterPMInfoEx(var AID: Real): Boolean;


implementation

{$R *.DFM}


uses
  IQMS.Common.Controls,
  IQMS.Common.Miscellaneous,
  wc_pm_workorders;

// Information only
procedure DoWorkCenterPMInfo(AID: Real);
var
  frm: TPMInfo_WorkCenter;
begin
  frm := TPMInfo_WorkCenter.Create(uniGUIApplication.UniApplication);
  frm.ID := AID;
  frm.EnableEditControls(False);
  frm.ShowModal;
end;

// Allow edit or insert
function DoWorkCenterPMInfoEx(var AID: Real): Boolean;
var
  frm: TPMInfo_WorkCenter;
begin
  frm := TPMInfo_WorkCenter.Create(uniGUIApplication.UniApplication);
  frm.ID := AID;
  frm.EnableEditControls(True);
  Result := frm.ShowModal = mrOk;
  if Result then
    AID := frm.TblPMEqmt.FieldByName('ID').asFloat;
end;

{ TPMInfo_WorkCenter }

procedure TPMInfo_WorkCenter.EnableEditControls(AEnabled: Boolean);
begin
  bbtnNew.Visible := AEnabled;
  bbtnPick.Visible := AEnabled;
  IQMS.Common.Controls.IQEnableControl([Eqno, DBEdit2 { , DBComboBox1 } ], AEnabled);
  Eqno.ReadOnly := not AEnabled;
end;

procedure TPMInfo_WorkCenter.JumptoPMEquipment1Click(Sender: TObject);
begin
  // inherited;
  IQJumpPM.Execute;
end;

procedure TPMInfo_WorkCenter.PMWorkorderReferences1Click(Sender: TObject);
begin
  // inherited;
  IQAssert(TblPmEqmtID.asFloat > 0,
    'MRO Equipment is not assigned - operation aborted.');
  TFrmWorkCenterPMWorkorders.DoShow(TblPmEqmtID.asFloat);
  // wc_pm_workorders.pas
end;

end.
