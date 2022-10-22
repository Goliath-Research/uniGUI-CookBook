unit ClassLst;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  Vcl.Buttons,
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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, IQUniGrid, uniGUIFrame;

type
  TFrmClassList = class(TUniForm)
    Panel1: TUniPanel;
    DataSource1: TDataSource;
    Table1: TFDTable;
    Table1CLASS: TStringField;
    Table1DESCRIP: TStringField;
    DBNavigator1: TUniDBNavigator;
    wwDBGrid1: TIQUniGridControl;
    Table1PRIMARY_MATERIAL: TStringField;
    Panel2: TUniPanel;
    Bevel1: TUniPanel;
    Panel3: TUniPanel;
    btnOK: TUniButton;
    Table1MANDATORY_DIM: TStringField;
    Table1ID: TBCDField;
    sbtnDimCharacteristics: TUniSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Table1BeforePost(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure sbtnDimCharacteristicsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure EnsureOurMainClassesExist;
  public
    { Public declarations }
    class procedure EnsureClassExists( AClass: string; AType: string = '' );
    class procedure EnsurePrimaryMaterialIsChecked;
  end;

procedure DoClassList;
function DoClassListSelectOnDoubleClick: string;
procedure PopulateInvClass( AList: TStrings; AOnlyPrimMaterial: Boolean = FALSE );

implementation

{$R *.DFM}

uses
  inv_class_dim_setup,
  inv_rscstr,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm;
  { TODO -oathite -cWebConvert : Depenedent on iqsecins
  iqsecins;}

procedure PopulateInvClass( AList: TStrings; AOnlyPrimMaterial: Boolean = FALSE );
begin
  AList.Clear;
  with TFDQuery.Create(Application) do
  try
    Connection := UniMainModule.FDConnection1;

//    DataBaseName:= 'IQ';
    SQL.Add('select distinct class from arinvt_class where NVL(type,''*'') <> ''ROUTING'' ');

    if AOnlyPrimMaterial then
       SQL.Add(' and primary_material = ''Y'' ');

    SQL.Add('order by class');
    Open;
    while not Eof do
    begin
      AList.Add( Fields[ 0 ].asString );
      Next;
    end;
  finally
    Free;
  end;
end;


procedure DoClassList;
var
  LFrmClassList : TFrmClassList;
begin
  LFrmClassList := TFrmClassList.Create( uniGUIApplication.UniApplication );
  LFrmClassList.ShowModal;
end;

function DoClassListSelectOnDoubleClick: string;
var
  LFrmClassList : TFrmClassList;
begin
  LFrmClassList := TFrmClassList.Create( uniGUIApplication.UniApplication );
  if (LFrmClassList.ShowModal = mrOK) and not (LFrmClassList.Table1.Eof and LFrmClassList.Table1.Bof) then
    Result:= LFrmClassList.Table1CLASS.asString
  else
    Result:= '';
end;

procedure TFrmClassList.FormCreate(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  EnsureOurMainClassesExist;
end;

procedure TFrmClassList.FormShow(Sender: TObject);
begin
  IQRegFormRead(self, [self, wwDBGrid1 ]);
  Self.BringToFront;
  { TODO -oathite -cWebConvert : Depenedent on iqsecins
  iqsecins.EnsureSecurityInspectorOnTopOf(Self);  }
end;

procedure TFrmClassList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (Table1.State in [dsEdit, dsInsert]) then
     if IQWarningYN(inv_rscstr.cTXT0000028 {'Save changes?'}) then
        Table1.Post
     else
        Table1.Cancel;
  EnsureOurMainClassesExist;
  IQRegFormWrite(self, [self, wwDBGrid1 ]);
end;

procedure TFrmClassList.EnsureOurMainClassesExist;
begin
  EnsureClassExists( 'IN' );
  EnsureClassExists( 'PK' );
  // EnsureClassExists( 'PL' );  {Oct-23-2002}
  EnsureClassExists( 'FG' );
  EnsureClassExists( 'TL' );
  EnsureClassExists( 'MT' );
  EnsureClassExists( 'UD' );
  Table1.Refresh;
end;

class procedure TFrmClassList.EnsureClassExists( AClass: string; AType: string = '' );
begin
  if SelectValueFmtAsFloat('select 1 from arinvt_class where class = ''%s''', [ AClass ]) = 0 then
     ExecuteCommandFmt('Insert into arinvt_class( class, descrip, type ) values( ''%s'', ''%s'', ''%s'') ',
                [ AClass, AClass + ' Inventory', AType ]);
end;

class procedure TFrmClassList.EnsurePrimaryMaterialIsChecked;
begin
  if SelectValueAsFloat('select 1 from arinvt_class where primary_material = ''Y'' and rownum < 2') = 1 then
     EXIT;

  TFrmClassList.EnsureClassExists( 'PL' );  {ClassLst.pas}

  ExecuteCommand('update arinvt_class set primary_material = ''Y'' where class in (''PL'', ''BL'')' );
end;

procedure TFrmClassList.Table1BeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet );
end;

procedure TFrmClassList.FormActivate(Sender: TObject);
begin
//  IQHelp.AssignHTMLFile( iqchmSETUP{CHM}, iqhtmSETUPch4{HTM} );  {IQMS.Common.HelpHook.pas}
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmINVENTORY{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmClassList.btnOKClick(Sender: TObject);
begin
  if not (Table1.Eof and Table1.Bof) then
     ModalResult:= mrOK
  else
     raise Exception.Create(inv_rscstr.cTXT0000029 {'No class found'});
end;


procedure TFrmClassList.sbtnDimCharacteristicsClick(Sender: TObject);
begin
  TFrmInvClassDimSetup.DoShowModal(Table1ID.asFloat );  // inv_class_dim_setup.pas
end;


end.
