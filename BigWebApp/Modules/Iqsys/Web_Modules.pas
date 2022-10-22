unit Web_Modules;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
//  Vcl.Wwdatsrc,
//  Mask,
//  Vcl.Buttons,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
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
  uniDBNavigator,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQUniGrid, uniGUIFrame, Vcl.Controls;

type
  TFrmWebModules = class(TUniForm)
    Panel1: TUniPanel;
    wwDBGrid1: TIQUniGridControl;
    wwDataSource1: TDataSource;
    wwTable1: TFDTable;
    wwTable1ID: TBCDField;
    wwTable1NAME: TStringField;
    wwTable1DESCRIP: TStringField;
    wwDBComboBox1: TUniDBComboBox;
    sbtnAddAll: TUniSpeedButton;
    Bevel1: TUniPanel;
    procedure wwTable1BeforePost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnAddAllClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoEditWebModules;
procedure DoEnsureAllModulesExist; {Aux function}

implementation

{$R *.DFM}

uses
  IQMS.Common.DataConst,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  IQMS.Common.HelpHook,
  IQMS.Common.Controls;

procedure DoEditWebModules;
var
  frm : TFrmWebModules;
begin
  frm := TFrmWebModules.Create(uniGUIApplication.UniApplication);
  frm.ShowModal;
end;

{Aux Function}
procedure GetAvailableModules( AList: TStrings );
begin
  try
    with TFDStoredProc.Create(nil) do
    try
      ConnectionName := cnstFDConnectionName; //IQMS.Common.DataConst
//      Connection := MainModule.FDConnection;
      StoredProcName:= 'IQMS.CRW_WEB_MODULES';
      Params.CreateParam( ftCursor, 'CRW_CURSOR', ptInputOutput );
      Open;

      while not eof do
      begin
        AList.Add( FieldByName('NAME').asString );
        Next;
      end;
    finally
      Free;
    end;
  except
    {if WEB_ACCESS does not exist because OAS is not installed - return blank string}
    AList.Text:= '';
  end;
end;

procedure DoEnsureAllModulesExist;
var
  I: Integer;
  S: string;
  AList: TStringList;
begin
  S:= '';
  AList:= TStringList.Create;
  try
    GetAvailableModules( AList );

    if AList.Count = 0 then
       EXIT;

    {Prepare list: select 'EXISTING ORDERS' from dual UNION ALL select 'CHECKOUT' from dual ...}
    for I:= 0 to AList.Count - 1 do
      if S = '' then
         S:= Format('select ''%s'' as name from dual ', [ AList[ I ]])
      else
         S:= S + Format(' UNION ALL select ''%s'' from dual ', [ AList[ I ] ]);

    {Prepare: insert into web_module( name ) select 'EXISTING ORDERS' from dual UNION ALL select 'CHECKOUT' from dual ... MINUS select name from web_module}
    S:= 'insert into web_module( name ) ' + S + ' MINUS select name from web_module';

    ExecuteCommand( S );
    ExecuteCommand( 'update web_module set descrip = name where descrip is NULL' );
  finally
    AList.Free;
  end;
end;

procedure TFrmWebModules.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  {Populate drop down box}
  wwDBComboBox1.Items.Clear;
  //for I:= 0 to High( constAVAILABLE_MODULES ) do wwDBComboBox1.Items.Add( constAVAILABLE_MODULES[ I ]);
  GetAvailableModules( wwDBComboBox1.Items );

  IQSetTablesActive( TRUE, self );
  IQRegFormRead(self, [ self, wwDBGrid1 ]);
{ TODO -oLema : Incompatible types: 'TDBNavigator' and 'TUniDBNavigator' }
//  IQMS.Common.Controls.ResizeNavBar(NavMain);


end;

procedure TFrmWebModules.wwTable1BeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet );
end;

procedure TFrmWebModules.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self, wwDBGrid1 ]);
end;

procedure TFrmWebModules.sbtnAddAllClick(Sender: TObject);
var
  I: Integer;
  AList: TStringList;
begin
  AList:= TStringList.Create;
  try
    GetAvailableModules( AList );
    for I:= 0 to AList.Count - 1 do
      if not wwTable1.Locate('name', AList[ I ], []) then
      begin
        wwTable1.Append;
        wwTable1NAME.AsString   := AList[ I ];
        wwTable1DESCRIP.AsString:= ProperCase( AList[ I ]);
        wwTable1.Post;
      end;
  finally
    AList.Free;
  end;
end;

procedure TFrmWebModules.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmSETUP{CHM}, iqhtmSETUPch4{HTM} );  {IQMS.Common.HelpHook.pas}
end;

end.
