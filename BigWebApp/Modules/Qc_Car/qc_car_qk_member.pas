unit qc_car_qk_member;

interface

uses
  Winapi.Windows,
  System.Classes,
  IQMS.Common.QuickAddBase,
  Data.DB,
  IQMS.WebVcl.Hpick,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniSplitter, uniPageControl, uniButton,
  Vcl.Controls, Vcl.Forms;

type
  TQuickAddTeamMember = class(TQuickAddBase)
    Table1ID: TBCDField;
    Table1NAME: TStringField;
    Table1TITLE: TStringField;
    Table1EMAIL: TStringField;
    Table1USED_CAR: TStringField;
    Table1USERID: TStringField;
    PkUsers: TIQWebHPick;
    PkUsersUSERNAME: TStringField;
    PnlClient01: TUniPanel;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    DBEdit1: TUniDBEdit;
    wwUsers: TUniEdit;
    DBEdit3: TUniDBEdit;
    DBEdit4: TUniDBEdit;
    Splitter1: TUniSplitter; // Lema. was missing from original form
    procedure wwUsersCustomDlg(Sender: TObject);
    procedure Table1NewRecord(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QuickAddTeamMember: TQuickAddTeamMember;

implementation

{$R *.DFM}

uses
  IQMS.Common.Controls;

{ TQuickAddTeamMember }

procedure TQuickAddTeamMember.FormCreate(Sender: TObject);
begin
  inherited;
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlClient02);
end;

{Lema. wwUsersCustomDlg is event handler of missing wwDBComboDlg}
procedure TQuickAddTeamMember.wwUsersCustomDlg(Sender: TObject);
begin
  inherited; {nothing}
  with PkUsers do
   if Execute then
     Table1USERID.asString := GetValue('USERNAME');
end;

procedure TQuickAddTeamMember.Table1NewRecord(DataSet: TDataSet);
begin
  inherited;    {nothing}
  Table1USED_CAR.asString:= 'Y';
end;

end.
