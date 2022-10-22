unit Repdef_Cat;

{Note: do not drop SecurityInspector on this form. This form has embeded TFrmRepDef
with built-in SecurityRegister that we use for granting rights per app_id}

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.Search,
  IQMS.WebVcl.RepDef,
  Vcl.Menus,
  IQMS.WebVcl.About,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniGUIFrame, IQUniGrid, Vcl.Controls;

type
  TFrmRepDef_Cat = class(TUniForm)
    pnlRepdef_Cat: TUniPanel;
    Splitter1: TUniSplitter;
    pnlRepdefCarrier: TUniPanel;
    IQSearch1: TIQUniGridControl;
    SrcRepdef_Cat: TDataSource;
    QryRepdef_Cat: TFDQuery;
    QryRepdef_CatAPP_ID: TStringField;
    QryRepdef_CatDESCRIP: TStringField;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    Contents1: TUniMenuItem;
    PopupMenu1: TUniPopupMenu;
    ShowAllReports1: TUniMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SrcRepdef_CatDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure ShowAllReports1Click(Sender: TObject);
  private
    FFrmRepDef: TFrmRepDef;
    FIQRepDef : TIQWebRepDef;
    procedure SyncRepdefFormToApp_ID;
    { Private declarations }
  public
    { Public declarations }
    property FrmRepDef: TFrmRepDef read FFrmRepDef;
    property IQRepDef : TIQWebRepDef  read FIQRepDef;

    class procedure DoShowModal;
    class procedure DoShow;
    function IsReportVisible( AReportName: string ): Boolean;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  { TODO : IQSecIns not yet converted }
//  IQSecIns,
  IQMS.Common.HelpHook,
  repdef_cat_rep_list;

{ TFrmRepDef_Cat }

class procedure TFrmRepDef_Cat.DoShowModal;
var
  LFrmRepDef_Cat : TFrmRepDef_Cat;
begin
  LFrmRepDef_Cat := TFrmRepDef_Cat.create(UniGUIApplication.UniApplication);
  with LFrmRepDef_Cat do
  begin
    ShowModal;
  end;
end;

class procedure TFrmRepDef_Cat.DoShow;
var
  LFrmRepDef_Cat : TFrmRepDef_Cat;
begin
  LFrmRepDef_Cat := TFrmRepDef_Cat.Create(UniGUIApplication.UniApplication);
  LFrmRepDef_Cat.Show;
end;

procedure TFrmRepDef_Cat.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmRepDef_Cat.FormShow(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
  IQRegFormRead( self, [ self ]);
  { TODO : IQSecIns not yet converted }
  //EnsureSecurityInspectorOnTopOf( self );
end;

procedure TFrmRepDef_Cat.SrcRepdef_CatDataChange(Sender: TObject;
  Field: TField);
begin
  if QryRepdef_Cat.State = dsInactive then EXIT;

  SyncRepdefFormToApp_ID;
end;

procedure TFrmRepDef_Cat.SyncRepdefFormToApp_ID;
begin
  if QryRepdef_CatAPP_ID.asString = '' then EXIT;

  {free current IQRepDef}
  try
    if Assigned( FFrmRepDef ) then
       FFrmRepDef.pnlCarrier.Parent:= FFrmRepDef;
    if Assigned( FIQRepDef ) then
       FIQRepDef.Free;   {this will trigger free of the child form TFrmRepDef}
  finally
    FFrmRepDef:= NIL;
    FIQRepDef := NIL;
  end;

  {create new IQRepDef wrapper and FrmRepDef - the actual form}
  FIQRepDef:= TIQWebRepDef.Create( self );
  FIQRepDef.App_ID:= QryRepdef_CatAPP_ID.asString;

  FFrmRepDef:= TFrmRepDef.Create( FIQRepDef, FIQRepDef.App_ID);
  FFrmRepDef.btnExit.Visible   := FALSE;
  FFrmRepDef.btnCurrent.Visible:= FALSE;
  FFrmRepDef.btnPrint.Left     := FFrmRepDef.btnExit.Left;
  FFrmRepDef.btnSetUp.Left     := FFrmRepDef.btnCurrent.Left;
  FFrmRepDef.sbtnSaveCriteria.Visible:= FALSE;
  FFrmRepDef.FilterSelectionCriteriaPickListByUser:= FALSE;

  FFrmRepDef.CheckUpgrade;
  FFrmRepDef.FormShow(NIL);

  {move contents of TFrmRepdef to TFrmRepDef_Cat.pnlRepdefCarrier }
  FFrmRepDef.pnlCarrier.Parent:= self.pnlRepdefCarrier;

  { TODO : IQSecIns not yet converted }
  //RefreshSecurityInspectorOnForm( FFrmRepDef );
end;


procedure TFrmRepDef_Cat.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmRepDef_Cat.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmRepDef_Cat.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmSETUP{CHM}, iqhtmSETUPch3{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmRepDef_Cat.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );
end;

procedure TFrmRepDef_Cat.ShowAllReports1Click(Sender: TObject);
begin
  TFrmRepdef_Cat_Rep_List.DoShow(SrcRepdef_Cat ); // repdef_cat_rep_list.pas
end;

function TFrmRepDef_Cat.IsReportVisible( AReportName: string ): Boolean;
begin
  Result:= FALSE;
  if Assigned( FFrmRepDef ) and Assigned(FFrmRepDef.SR) and (AReportName <> '') then
     Result:= FFrmRepDef.SR.Visible[  FFrmRepDef.SR.DeriveComponentNameFrom( AReportName )];
end;

end.

