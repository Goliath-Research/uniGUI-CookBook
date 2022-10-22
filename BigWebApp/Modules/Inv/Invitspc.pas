unit InvItspc;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Menus,
  IQMS.WebVcl.About,
  Data.DB,
  Vcl.Wwdatsrc,
{ TODO -oGPatil -cWebConvert : Dependency
  InvtShel, }
  Vcl.Buttons,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.SecurityRegister,
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
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, uniMainMenu, uniComboBox, uniDBComboBox, IQUniGrid,
  uniGUIFrame;

type
  TFrmInvItemSpec = class(TUniForm)
    Panel1: TUniPanel;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    SrcSpecs: TDataSource;
    TblSpecs: TFDTable;
    N1: TUniMenuItem;
    MasterSpecs1: TUniMenuItem;
    Grid: TIQUniGridControl;
    TblSpecsID: TBCDField;
    TblSpecsARINVT_ID: TBCDField;
    TblSpecsMASTER_SPEC_ID: TBCDField;
    TblSpecsDescription: TStringField;
    TblSpecsCode: TStringField;
    TblSpecsRev: TStringField;
    dbDescrip: TUniDBLookupComboBox;
    DBCode: TUniDBLookupComboBox;
    DBRev: TUniDBLookupComboBox;
    QryMS: TFDQuery;
    QryMSID: TBCDField;
    QryMSCODE: TStringField;
    QryMSDESCRIP: TStringField;
    QryMSREV: TStringField;
    Contents1: TUniMenuItem;
    Bevel1: TUniPanel;
    sbnSearch: TUniSpeedButton;
    PkItemSpec: TIQWebHPick;
    PkItemSpecID: TBCDField;
    PkItemSpecMASTER_SPEC_ID: TBCDField;
    PkItemSpecCODE: TStringField;
    PkItemSpecDESCRIP: TStringField;
    PkItemSpecREV: TStringField;
    SR: TIQWebSecurityRegister;
    SrcQryMS: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure MasterSpecs1Click(Sender: TObject);
    procedure TblSpecsBeforePost(DataSet: TDataSet);
    procedure TblSpecsAfterScroll(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure sbnSearchClick(Sender: TObject);
    procedure PkItemSpecBeforeOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure TblSpecsCalcFields(DataSet: TDataSet);
    procedure dbDescripCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoInvItemSpec;

implementation
{$R *.DFM}
uses
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib,
  InvMspcs,
  IQMS.Common.HelpHook,
  inv_rscstr;
{ TODO -oGPatil -cWebConvert : Dependency
  IQSecIns; }

procedure DoInvItemSpec;
var
  LFrmInvItemSpec : TFrmInvItemSpec;
begin
  LFrmInvItemSpec := TFrmInvItemSpec.Create(UniGUIApplication.UniApplication);
  LFrmInvItemSpec.Show;
end;

procedure TFrmInvItemSpec.dbDescripCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  TblSpecsMASTER_SPEC_ID.AsFloat := QryMSID.asFloat;
end;

procedure TFrmInvItemSpec.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, Grid]);
end;

procedure TFrmInvItemSpec.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmInvItemSpec.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmInvItemSpec.MasterSpecs1Click(Sender: TObject);
begin
  DoMasterSpecs;  {in InvMspcs.pas}
  QryMS.Close;
  QryMS.Open;
end;

procedure TFrmInvItemSpec.TblSpecsBeforePost(DataSet: TDataSet);
begin
  with TblSpecs do
  begin
    if FieldByName('MASTER_SPEC_ID').asFloat = 0 then
      raise Exception.Create(inv_rscstr.cTXT0000080 {'Please enter a Master Specification.'});
(* TODO -oGPatil -cWebConvert : Dependency invt_shell
    if FieldByName('ARINVT_ID').asFloat = 0 then
      FieldByName('ARINVT_ID').asFloat := TInvt_Shell(self.Owner).DM.SrcArinvt.DataSet.FieldByName('ID').asFloat;

    if SelectValueFmtAsFloat('select Count(id) from arinvt_spec where arinvt_id = %f and master_spec_id = %f and id <> %f',
                 [TInvt_Shell(self.Owner).DM.SrcArinvt.DataSet.FieldByName('ID').asFloat,
                  FieldByName('MASTER_SPEC_ID').asFloat,
                  FieldByName('ID').asFloat]) <> 0 then
      raise exception.Create(inv_rscstr.cTXT0000081 {'A Master Specification is already assigned to this item.'});   *)
  end;
  IQAssignIDBeforePost(DataSet); {in IQlib}
end;

procedure TFrmInvItemSpec.TblSpecsAfterScroll(DataSet: TDataSet);
begin
(* TODO -oGPatil -cWebConvert : Dependency invt_shell
  Caption := Format(inv_rscstr.cTXT0000082 {'Item Specification for %s (%s)'},
                    [TInvt_Shell(self.Owner).DM.SrcArinvt.DataSet.FieldByName('DESCRIP').asString,
                     TInvt_Shell(self.Owner).DM.SrcArinvt.DataSet.FieldByName('ITEMNO').asString])    *)
end;

procedure TFrmInvItemSpec.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmINVENTORY{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmInvItemSpec.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( 1136691 );
end;

procedure TFrmInvItemSpec.sbnSearchClick(Sender: TObject);
begin
  with PkItemSpec do
    if Execute then
       TblSpecs.Locate('ID', GetValue('ID'), [])
end;

procedure TFrmInvItemSpec.PkItemSpecBeforeOpen(DataSet: TDataSet);
begin
(* TODO -oGPatil -cWebConvert : Dependency invt_shell
  with TFDQuery(DataSet) do
    ParamByName('arinvt_id').Value := TInvt_Shell(self.Owner).DM.SrcArinvt.DataSet.FieldByName('ID').asFloat;  *)
end;

procedure TFrmInvItemSpec.FormShow(Sender: TObject);
begin
{ TODO -oGPatil -cWebConvert : Dependency iqsecins
  EnsureSecurityInspectorOnTopOf( self );}
end;

procedure TFrmInvItemSpec.TblSpecsCalcFields(DataSet: TDataSet);
begin
  if TblSpecsMASTER_SPEC_ID.asFloat > 0 then
  begin
     TblSpecsCode.asString:= SelectValueByID('CODE', 'MASTER_SPEC', TblSpecsMASTER_SPEC_ID.asFloat);
     TblSpecsDescription.asString:= SelectValueByID('DESCRIP', 'MASTER_SPEC', TblSpecsMASTER_SPEC_ID.asFloat);
     TblSpecsRev.asString:= SelectValueByID('REV', 'MASTER_SPEC', TblSpecsMASTER_SPEC_ID.asFloat);
  end;

end;



procedure TFrmInvItemSpec.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive( False, self );
(* TODO -oGPatil -cWebConvert : Dependency invt_shell
  TblSpecs.MasterSource := TInvt_Shell(AOwner).DM.SrcArinvt;   *)
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [self, Grid]);
  dbDescrip.Visible := false;
  DBRev.Visible := false;
end;

end.
