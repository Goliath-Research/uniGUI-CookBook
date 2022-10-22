unit MultiSelectEplants;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.WebVcl.Search,
  Data.DB,
  Vcl.Wwdatsrc,
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
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton, IQUniGrid, uniGUIFrame;

type
  TFrmMultiSelEplants = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    BtnCancel: TUniButton;
    BtnOk: TUniButton;
    IQSearch1: TIQUniGridControl;
    SrcEplants: TDataSource;
    QryEplants: TFDQuery;
    QryEplantsID: TBCDField;
    QryEplantsNAME: TStringField;
    PkEplant: TIQWebHPick;
    PkEplantID: TBCDField;
    PkEplantNAME: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FModule_Type:String;
    procedure SetModule_Type(const Value: string);
  public
    { Public declarations }
    property Module_Type: string read FModule_Type write SetModule_Type;
  end;

procedure DoMultiSelectEplants(AModule_Type:String);


implementation
uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;
{$R *.dfm}

procedure DoMultiSelectEplants(AModule_Type:String);
var
  LFrmMultiSelEplants : TFrmMultiSelEplants;
begin
  LFrmMultiSelEplants := TFrmMultiSelEplants.Create(uniGUIApplication.UniApplication);
  LFrmMultiSelEplants.Module_Type := AModule_Type;
  LFrmMultiSelEplants.ShowModal;
end;

procedure TFrmMultiSelEplants.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
end;

procedure TFrmMultiSelEplants.SetModule_Type(const Value: string);
begin
  FModule_Type := Value;
end;

procedure TFrmMultiSelEplants.UniFormCreate(Sender: TObject);
var
  AQry:TFDQuery;
begin
  QryEplants.Open;
  IQRegFormRead( self, [self]);
  AQry := TFDQuery.Create(nil);
  AQry.Connection := UniMainModule.FDConnection1;
  AQry.Sql.Add(Format('select eplant_id from MULTI_EPLANT_USER where module_type = ''%s'' and user_id = misc.getusername', [FModule_Type]));
  AQry.Open;
  if not (AQry.Eof and AQry.Bof) then
  begin
    while not AQry.Eof do
    begin
      QryEplants.Locate('ID', AQry.FieldByName('eplant_id').asFloat, []);
      { TODO -oathite -cWebConvert : Undeclared identifier: 'SelectRecord'
      IqSearch1.DBgrid.SelectRecord; }
      AQry.Next;

    end;
  end;
end;

procedure TFrmMultiSelEplants.BtnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmMultiSelEplants.BtnOkClick(Sender: TObject);
var
  I:Integer;
begin
  ExecuteCommandFmt('delete from MULTI_EPLANT_USER where module_type = ''%s'' and user_id = misc.getusername', [FModule_Type]);
  if IqSearch1.DBGrid.SelectedRows.Count <> 0 then
  begin
    with iqSearch1.DBGrid, iqSearch1.DBGrid.DataSource.Dataset do
    try
        DisableControls;
        for i:= 0 to SelectedRows.Count-1 do
        begin
          GotoBookmark( SelectedRows.Items[i] );
          ExecuteCommandFmt('insert into MULTI_EPLANT_USER (module_type, eplant_id, user_id) values (''%s'', %f, misc.getusername)', [FModule_Type, QryEplantsID.asFloat]);
        end;
    finally
       EnableControls;
    end;
  end;
  Close;
end;



end.
