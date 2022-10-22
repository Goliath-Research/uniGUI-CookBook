unit Snd_Tool;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  Mask,
  FireDAC.Comp.DataSet,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniMultiItem,
  uniGUIApplication,
  uniComboBox,
  IQUniGrid, uniGUIFrame, uniDBNavigator, uniDBComboBox, Vcl.Controls;

type
  TFrmSndopTool = class(TUniForm)
    wwDBGridTool: TIQUniGridControl;
    wwDBComboBoxToolEqNo: TUniDBComboBox;
    Bevel1: TUniPanel;
    procedure wwDBComboBoxToolEqNoDropDown(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    DM: TDataModule;
  public
    { Public declarations }
    class procedure DoShow;
  end;

implementation

{$R *.DFM}

uses
  Snd_dm,
  { TODO -ombaral -cWebIQ : Need to check dependency
  PM_Info,
  }
  Snd_PR,
  IQMS.Common.RegFrm;

{ TFrmSndopTool }

class procedure TFrmSndopTool.DoShow;
var
  LFrmSndopTool : TFrmSndopTool;
begin
  LFrmSndopTool :=TFrmSndopTool.Create(uniGUIApplication.UniApplication);
  LFrmSndopTool.show;
end;


procedure TFrmSndopTool.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= caFree;
  IQRegFormWrite( self, [ self, wwDBGridTool ]);
end;

procedure TFrmSndopTool.UniFormCreate(Sender: TObject);
var
   LSnd_Process : TSnd_Process;
begin
  LSnd_Process:=TSnd_Process.Create(uniGUIApplication.UniApplication);
  LSnd_Process.DM.Name:= 'SndDM';
  inherited;
  LSnd_Process.DM.Name:= '';
  DM:= LSnd_Process.DM;
  IQRegFormRead( self, [ self, wwDBGridTool ]);
end;

procedure TFrmSndopTool.wwDBComboBoxToolEqNoDropDown(Sender: TObject);
var
  ID: Real;
begin
  (*{ TODO -ombaral -cWebIQ : Need to check dependency }
  ID:= TSndDM(DM).TblSndop_PmeqmtPMEQMT_ID.asFloat;
  if DoPMInfo( ID ) then                               {PM_Info.pas}
  begin
     TSndDM(DM).TblSndop_Pmeqmt.Edit;
     TSndDM(DM).TblSndop_PmeqmtSNDOP_ID.asFloat := TSndDM(DM).TblSndOpID.asFloat;
     TSndDM(DM).TblSndop_PmeqmtPMEQMT_ID.asFloat:= ID;
     TSndDM(DM).Tblsndop_Pmeqmt.Post;
  end;
  *)
end;

end.

