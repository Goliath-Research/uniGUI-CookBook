unit IQMS.Common.UserFieldsPicklistEditor;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  Vcl.Menus,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
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
  uniMainMenu,
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox, uniMemo;

type
  TFrmUserFieldsPicklistEditor = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Panel4: TUniPanel;
    Panel5: TUniPanel;
    Panel6: TUniPanel;
    Label3: TUniLabel;
    Panel9: TUniPanel;
    sbtnVerifySQL: TUniSpeedButton;
    Panel8: TUniPanel;
    Panel3: TUniPanel;
    Label1: TUniLabel;
    wwDBComboBoxResultField: TUniDBComboBox;
    Panel7: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    popmSQLExample: TUniPopupMenu;
    SeeExample1: TUniMenuItem;
    RichEdit1: TUniMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SeeExample1Click(Sender: TObject);
    procedure sbtnVerifySQLClick(Sender: TObject);
    procedure wwDBComboBoxResultFieldDropDown(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure Label3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    procedure ValidatePickListSQL;
    procedure LoadDataSetFieldNames;
    procedure ValidateResultField;
    { Private declarations }
  public
    { Public declarations }
    constructor Create( AOwner: TComponent; ASQL, AFieldName: string );
    class function DoShowModal( AOwner: TComponent; var ASQL, AFieldName: string ): Boolean;
  end;

var
  FrmUserFieldsPicklistEditor: TFrmUserFieldsPicklistEditor;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.MsgFrm,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils;

{ TTFrmUserFieldsPicklistEditor }
class function TFrmUserFieldsPicklistEditor.DoShowModal(AOwner: TComponent; var ASQL, AFieldName: string ): Boolean;
begin
  with self.Create( AOwner, ASQL, AFieldName ) do
  try
    Result:= ShowModal = mrOK;
    if Result then
    begin
      ASQL:= RichEdit1.Text;
      AFieldName:= wwDBComboBoxResultField.Text;
    end;
  finally
    Release;
  end;
end;

procedure TFrmUserFieldsPicklistEditor.btnOKClick(Sender: TObject);
begin
  ValidatePickListSQL;
  ValidateResultField;

  ModalResult:= mrOK;
end;

constructor TFrmUserFieldsPicklistEditor.Create( AOwner: TComponent; ASQL, AFieldName: string );
begin
  inherited Create( AOwner );
  IQRegFormRead( self, [ self ]);

  RichEdit1.Text:= ASQL;
  wwDBComboBoxResultField.Text:= AFieldName;
end;

procedure TFrmUserFieldsPicklistEditor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmUserFieldsPicklistEditor.sbtnVerifySQLClick(Sender: TObject);
begin
  ValidatePickListSQL;
end;

procedure TFrmUserFieldsPicklistEditor.SeeExample1Click(Sender: TObject);
var
  AMesg: TStringList;
begin
  AMesg:= TStringList.Create;
  try
    AMesg.Add('select id as "ID", ');
    AMesg.Add('       name as "Division Name", ');
    AMesg.Add('       descrip as "Description" ');
    AMesg.Add('  from division ');
    AMesg.Add('');
    AMesg.Add('/* Note how each column is defined using ''as'' and double quotes */');
    IQShowStringList(AMesg);  // IQMsgFrm.pas
  finally
    AMesg.Free;
  end;
end;

procedure TFrmUserFieldsPicklistEditor.ValidatePickListSQL;
var
  Qry: TFDQuery;
begin
  Qry:= TFDQuery.Create(nil);
  with Qry do
  try
    ConnectionName := 'IQFD';
    SQL.Assign( RichEdit1.Lines );
    Open;
  finally
    Free;
  end;
end;


procedure TFrmUserFieldsPicklistEditor.wwDBComboBoxResultFieldDropDown(Sender: TObject);
begin
  LoadDataSetFieldNames;
end;

procedure TFrmUserFieldsPicklistEditor.Label3MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbRight then
    popmSQLExample.Popup(x,y,sender);
end;

procedure TFrmUserFieldsPicklistEditor.LoadDataSetFieldNames;
var
  Qry: TFDQuery;
begin
  Qry:= TFDQuery.Create(nil);
  with Qry do
  try
    ConnectionName := 'IQFD';
    SQL.Assign( RichEdit1.Lines );
    try
      FieldDefs.Update;
    except on E: Exception do
      begin
        IQError(Format('Unable to determine the column names - check the SQL statement and try again.'#13#13' Error: %s', [ E.Message ]));
        ABORT;
      end;
    end;
    GetFieldNames( wwDBComboBoxResultField.Items );
  finally
    Free;
  end;
end;


procedure TFrmUserFieldsPicklistEditor.ValidateResultField;
begin
  LoadDataSetFieldNames;
  IQAssert( wwDBComboBoxResultField.Items.IndexOf( wwDBComboBoxResultField.Text ) > -1, 'Invalid ''Result Field'' - operation aborted');
end;


end.
