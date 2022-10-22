unit Profile_Clone;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.WebVcl.Search,
  Data.DB,
  Vcl.Wwdatsrc,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, IQUniGrid, uniGUIFrame;

type
  TFrmCloneList = class(TUniForm)
    btnCancel: TUniButton;
    btnOK: TUniButton;
    wwSrcAllUsers: TDataSource;
    wwQryAllUsers: TFDQuery;
    wwQryAllUsersUSERNAME: TStringField;
    GroupBox1: TUniGroupBox;
    Panel2: TUniPanel;
    IQSearch1: TIQUniGridControl;
    wwQryAllUsersEPLANT_NAME: TStringField;
    Panel1: TUniPanel;
    Panel3: TUniPanel;
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FSrcUserName: string;
    procedure SetSrcUserName(const Value: string);
    function GetSrcUserName: string;
    procedure DoCloneProfile;
  public
    { Public declarations }
    property SrcUserName: string read GetSrcUserName write SetSrcUserName;
  end;

function DoCloneProfileDialog( ASrcUserName: string ) : Boolean;

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;

function DoCloneProfileDialog( ASrcUserName: string ) : Boolean;
var
  frm : TFrmCloneList;
begin
  frm := TFrmCloneList.Create(uniGUIApplication.UniApplication);
  frm.SrcUserName := ASrcUserName;
  Result:= (frm.ShowModal = mrOK);
end;

procedure TFrmCloneList.FormCreate(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self, GroupBox1 ]);
end;

function TFrmCloneList.GetSrcUserName: string;
begin
  result := FSrcUserName;
end;

procedure TFrmCloneList.SetSrcUserName(const Value: string);
begin
  FSrcUserName := Value;
end;

procedure TFrmCloneList.UniFormShow(Sender: TObject);
begin
  Caption:= Format( '%s %s', [ Caption, FSrcUserName ]);
end;

procedure TFrmCloneList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, GroupBox1 ]);
end;

procedure TFrmCloneList.btnOKClick(Sender: TObject);
begin
  if IQSearch1.DBGrid.SelectedRows.Count = 0 then
     raise Exception.Create('Please select target user(s)');
  DoCloneProfile;
  Close;
  ModalResult:= mrOK;
end;

procedure TFrmCloneList.DoCloneProfile;
var
  I: Integer;
begin
   with IQSearch1.DBGrid, IQSearch1.DBGrid.DataSource.DataSet do
   try
     DisableControls;

     for I:= 0 to SelectedRows.Count - 1 do
     begin
       GotoBookmark( SelectedRows.Items[ I ]);

       {check if source user not into target users list}
       if FieldByName('username').asString <> FSrcUserName then
       begin
         {Delete all records from rf_profile for the selected user}
         ExecuteCommandFmt( 'delete from rf_profile where userid = ''%s''', [ FieldByName('username').asString ]);

         {Insert values of Source profile into rf_profile for the selected user}
         ExecuteCommandFmt( 'insert into rf_profile ( userid, module_name, topic, to_prompt, source_id, source, attribute ) '+
                    ' select ''%s'', module_name, topic, to_prompt, source_id, source, attribute '+
                    ' from rf_profile where userid = ''%s''', [ FieldByName('username').asString, FSrcUserName ]);

         ExecuteCommandFmt( 'delete from user_inv_zone where user_name = ''%s''', [ FieldByName('username').asString ]);

         ExecuteCommandFmt( 'insert into user_inv_zone ( user_name, inv_zone_id ) '+
                    ' select ''%s'', a.inv_zone_id '+
                    ' from user_inv_zone a '+
                    'where a.user_name = ''%s''',
                    [ FieldByName('username').asString, FSrcUserName ]);
       end;

       Freebookmark( SelectedRows.Items[ I ]);

     end;
     { TODO -oLema : Unknown SelectedRows.Clear }
//     SelectedRows.Clear;
   finally
     EnableControls;
   end;
end;

end.



