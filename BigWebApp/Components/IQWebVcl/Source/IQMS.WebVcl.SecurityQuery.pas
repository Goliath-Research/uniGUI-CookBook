unit IQMS.WebVcl.SecurityQuery;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Data.DB,
  Vcl.DBGrids,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  Vcl.Menus,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQUniGrid, uniGUIFrame, Vcl.Controls;

type
  TSecurityQuery = class(TUniForm)
    Splitter2: TUniSplitter;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    Table1: TFDTable;
    Table2: TFDTable;
    wwDataSource1: TDataSource;
    wwTable1: TFDTable;
    Table1ROLE_NAME: TStringField;
    Table2APP_S_CODE: TStringField;
    Table2ROLE_NAME: TStringField;
    wwTable1APP_S_CODE: TStringField;
    wwTable1ROLE_NAME: TStringField;
    wwTable1C_NAME: TStringField;
    wwTable1C_ENABLED: TStringField;
    wwTable1C_INSERT: TStringField;
    wwTable1C_DELETE: TStringField;
    wwTable1C_RD_WR: TStringField;
    wwTable1C_VISIBLE: TStringField;
    Panel1: TUniPanel;
    Splitter1: TUniSplitter;
    DBGrid2: TUniDBGrid;
    Panel2: TUniPanel;
    wwDBGrid3: TIQUniGridControl;
    Panel3: TUniPanel;
    Panel4: TUniPanel;
    DBGrid1: TUniDBGrid;
    DBNavigator1: TUniDBNavigator;
    PopupMenu1: TUniPopupMenu;
    DenySystemWide1: TUniMenuItem;
    Panel5: TUniPanel;
    Shape4: TUniPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure DenySystemWide1Click(Sender: TObject);
    procedure wwDBGrid3DBGridDrawColumnCell(Sender: TObject; ACol,
      ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
  private
    procedure SetRole(const ARole: string);
    { Private declarations }
  public
    { Public declarations }
    property Role:string write SetRole;
  end;

procedure DoSecurityQuery( const ARole: string );

var
  SecurityQuery: TSecurityQuery;

implementation

{$R *.DFM}

uses
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.WebVcl.ResourceStrings;

procedure DoSecurityQuery( const ARole: string );
begin
  with TSecurityQuery.Create( uniGUIApplication.UniApplication ) do
  begin
    Role:=ARole;
    ShowModal;
  end;
end;

procedure TSecurityQuery.FormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self, DBGrid1, DBGrid2, wwDBGrid3, Panel4, Panel1]);
  IQSetTablesActive(TRUE, self);
end;

procedure TSecurityQuery.PopupMenu1Popup(Sender: TObject);
var
  AField: TField;
begin
  wwTable1.CheckBrowseMode;

  DenySystemWide1.Enabled:= False;
//  AField:= wwDBGrid3.GetActiveField();
  if not Assigned(AField) then
     EXIT;

  DenySystemWide1.Enabled := AField.asString <> 'Y';
  DenySystemWide1.Caption := Format( IQMS.WebVcl.ResourceStrings.cTXT0000204 {'Deny system wide %s'}, [ AField.DisplayLabel ]);
  DenySystemWide1.Checked := AField.asString = 'Z';
end;

procedure TSecurityQuery.SetRole(const ARole: string);
begin
  Table1.Locate('ROLE_NAME', ARole, []);
end;

procedure TSecurityQuery.wwDBGrid3DBGridDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
    if (Column.Field = wwTable1C_VISIBLE)
     or
     (Column.Field = wwTable1C_ENABLED)
     or
     (Column.Field = wwTable1C_INSERT)
     or
     (Column.Field = wwTable1C_DELETE)
     or
     (Column.Field = wwTable1C_RD_WR) then
  begin
    if Column.Field.asString = 'Z' then
       Attribs.Color:= clRed
  end;
end;

procedure TSecurityQuery.DenySystemWide1Click(Sender: TObject);
var
  AField: TField;
begin
//  AField:= wwDBGrid3.GetActiveField();
  if not Assigned(AField) then
     EXIT;

  if (AField.asString <> 'Z') and IQConfirmYN(Format( IQMS.WebVcl.ResourceStrings.cTXT0000203, [ AField.DisplayLabel, AField.DisplayLabel, AField.DisplayLabel ])) then
     begin
       wwTable1.Edit;
       AField.asString := 'Z'
     end
  else
     begin
       wwTable1.Edit;
       AField.asString := 'N';
     end;
  wwTable1.Post;
end;

procedure TSecurityQuery.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, DBGrid1, DBGrid2, wwDBGrid3, Panel4, Panel1]);
end;

end.

