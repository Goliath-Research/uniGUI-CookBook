unit IQMS.Common.UDWorksheet;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.DBCtrls,
  IQMS.WebVcl.UDEmbeddedForm,
  Vcl.Buttons,
  Vcl.Menus,
  IQMS.WebVcl.About,
  Data.DB,
  IQMS.WebVcl.Hpick,
  vcl.wwdblook,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  IQMS.Common.JumpConstants,
  IQMS.WebVcl.SecurityRegister,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniMainMenu;

type
  TFrmUDWorksheet = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    Splitter1: TUniSplitter;
    navMain: TUniDBNavigator;
    Panel4: TUniPanel;
    Panel6: TUniPanel;
    Splitter2: TUniSplitter;
    IQUDEmbeddedForm1: TIQWebUDEmbeddedForm;
    Panel7: TUniPanel;
    Panel8: TUniPanel;
    Splitter3: TUniSplitter;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Panel5: TUniPanel;
    Splitter4: TUniSplitter;
    Panel9: TUniPanel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    Panel10: TUniPanel;
    dbeCode: TUniDBEdit;
    dbeDescrip: TUniDBEdit;
    Panel11: TUniPanel;
    Splitter5: TUniSplitter;
    Panel12: TUniPanel;
    Label5: TUniLabel;
    Panel14: TUniPanel;
    wwDBComboDlgResult: TUniEdit;
    sbtnSearch: TUniSpeedButton;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    PkWorksheet: TIQWebHPick;
    PkWorksheetID: TBCDField;
    PkWorksheetCODE: TStringField;
    PkWorksheetDESCRIP: TStringField;
    PkWorksheetTABLE_NAME: TStringField;
    PkWorksheetCOLUMN_NAME: TStringField;
    PkWorksheetRESULT_COLUMN_NAME: TStringField;
    QryWorksheet: TFDQuery;
    SrcWorksheet: TDataSource;
    QryWorksheetID: TBCDField;
    QryWorksheetCODE: TStringField;
    QryWorksheetDESCRIP: TStringField;
    QryWorksheetTABLE_NAME: TStringField;
    QryWorksheetCOLUMN_NAME: TStringField;
    QryWorksheetRESULT_COLUMN_NAME: TStringField;
    QryWorksheetFakeID: TFloatField;
    wwDBComboDlgTableName: TUniEdit;
    wwDBComboDlgColumnName: TUniEdit;
    PkTableName: TIQWebHPick;
    PkTableNameTABLE_NAME: TStringField;
    PkColumnName: TIQWebHPick;
    PkColumnNameCOLUMN_NAME: TStringField;
    SR: TIQWebSecurityRegister;
    PkUDColumn: TIQWebHPick;
    PkUDColumnID: TBCDField;
    PkUDColumnCOL_NAME: TStringField;
    PkUDColumnCOL_LABEL: TStringField;
    PkUDColumnCOL_TYPE: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure About1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure sbtnSearchClick(Sender: TObject);
    procedure QryWorksheetCalcFields(DataSet: TDataSet);
    procedure QryWorksheetBeforePost(DataSet: TDataSet);
    procedure SrcWorksheetDataChange(Sender: TObject; Field: TField);
    procedure PkColumnNameBeforeOpen(DataSet: TDataSet);
    procedure PkWorksheetIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure wwDBComboDlgTableNameCustomDlg(Sender: TObject);
    procedure wwDBComboDlgColumnNameCustomDlg(Sender: TObject);
    procedure IQUDEmbeddedForm1AfterStructureChange(Sender: TObject);
    procedure PkUDColumnBeforeOpen(DataSet: TDataSet);
    procedure wwDBComboDlgResultCustomDlg(Sender: TObject);
    procedure QryWorksheetBeforeEdit(DataSet: TDataSet);
    procedure SrcWorksheetStateChange(Sender: TObject);
    procedure QryWorksheetBeforeDelete(DataSet: TDataSet);
  private
    procedure InitEmbeddedForm;
    procedure IQNotify( var Msg: TMessage ); message iq_Notify;
    procedure AssignReadOnly( AControl: TUniCustomEdit; Value: Boolean );
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    class procedure DoShow( AOwner: TComponent );
    class function GetID( ATableName, AColumnName: string ): Real;
    class function WorksheetExists( ATableName, AColumnName: string ): Boolean;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  System.Character,
  IQMS.Common.Usr_Flds;

const
  cnstAppendNew = 1;

type
  TCustomEditLocal = class(TUniCustomEdit)
  public
    property Color;
  end;


class function TFrmUDWorksheet.GetID( ATableName, AColumnName: string ): Real;
var
  A: Variant;
begin
  Result:= 0;
  A:= SelectValueArrayFmt('select id, result_column_name from ud_worksheet where table_name = ''%s'' and column_name = ''%s''',
                     [ Trim(UpperCase(ATableName)), Trim(UpperCase(AColumnName))]);
  if VarArrayDimCount(A) = 0 then
     EXIT;

  if A[ 1 ] = '' then
     EXIT;

  Result:= A[ 0 ];
end;

class function TFrmUDWorksheet.WorksheetExists( ATableName, AColumnName: string ): Boolean;
begin
  Result:= self.GetID( ATableName, AColumnName ) > 0;
end;


{ TFrmUDWorksheet }
class procedure TFrmUDWorksheet.DoShow(AOwner: TComponent);
begin
  self.Create(AOwner).Show;
end;


procedure TFrmUDWorksheet.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmUDWorksheet.About1Click(Sender: TObject);
begin
  IQAbout1.Execute
end;

constructor TFrmUDWorksheet.Create(AOwner: TComponent);
begin
  inherited;
  IQSetTablesActive( TRUE, self );
  IQRegFormRead(self, [self]);
  LocateOrPickList( self, 0, QryWorksheet, PkWorksheet);
end;

procedure TFrmUDWorksheet.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
end;

procedure TFrmUDWorksheet.QryWorksheetBeforePost(DataSet: TDataSet);

  procedure _CheckCodeIsAlphaNumeric( ACode: string );
  var
    I: Integer;
    Ch: Char;
  begin
    for i:= 1 to Length(ACode) do
    begin
      Ch:= ACode[I];
      IQAssert( Ch.IsLetter
                or
                Ch.IsNumber
                or
                (Ch = '_') ,
                'Worksheet code must contain only alpha numeric values - operation aborted');
    end;
  end;

begin
  IQAssignIDBeforePost( DataSet, 'ud_worksheet');

  _CheckCodeIsAlphaNumeric( QryWorksheetCODE.asString );
end;

procedure TFrmUDWorksheet.QryWorksheetCalcFields(DataSet: TDataSet);
begin
  QryWorksheetFakeID.asFloat:=  - QryWorksheetID.asFloat;
end;

procedure TFrmUDWorksheet.sbtnSearchClick(Sender: TObject);
begin
  if PkWorksheet.Execute then
     QryWorksheet.Locate('id', PkWorksheet.GetValue('id'), []);
end;

procedure TFrmUDWorksheet.SrcWorksheetDataChange(Sender: TObject;
  Field: TField);
begin
  if QryWorksheet.State = dsBrowse then
     InitEmbeddedForm;
end;

procedure TFrmUDWorksheet.SrcWorksheetStateChange(Sender: TObject);
begin
  AssignReadOnly( dbeCode, QryWorksheet.State <> dsInsert);
end;

procedure TFrmUDWorksheet.QryWorksheetBeforeDelete(DataSet: TDataSet);
begin
  // ud_tables record with the children gets deleted in the trigger TUD_UD_WORKSHEET.
  // just get rid of the view here
  if QryWorksheetCODE.asString > '' then
     ExecuteCommandFmt('drop view %s', [ Format('v_ud_worksheet_%s', [ QryWorksheetCODE.asString ])]);
end;

procedure TFrmUDWorksheet.QryWorksheetBeforeEdit(DataSet: TDataSet);
begin
  IQUDEmbeddedForm1.Active:= False;
end;

procedure TFrmUDWorksheet.InitEmbeddedForm;
begin
  if QryWorksheetCODE.asString = '' then
     EXIT;

  IQUDEmbeddedForm1.TableName:= QryWorksheetTABLE_NAME.asString;
  IQUDEmbeddedForm1.Active:= True;
end;

procedure TFrmUDWorksheet.PkColumnNameBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'table_name', QryWorksheetTABLE_NAME.asString);
end;

procedure TFrmUDWorksheet.IQNotify(var Msg: TMessage);
begin
  case Msg.WParam of
    cnstAppendNew: if navMain.Controls[ Ord(nbInsert) ].Enabled and SR.Enabled['NavMain'] and SR.Insert['NavMain'] then
                      navMain.DataSource.DataSet.Insert;
  end;
end;

procedure TFrmUDWorksheet.PkWorksheetIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
  Action:= mrOK;
  ResultValue:= 0;
  PostMessage( self.Handle, iq_Notify, cnstAppendNew, 0 );
end;

procedure TFrmUDWorksheet.wwDBComboDlgColumnNameCustomDlg(Sender: TObject);
begin
  with PkColumnName do
    if Execute then
    begin
      QryWorksheet.Edit;
      QryWorksheetCOLUMN_NAME.asString:= GetValue('column_name');
    end;
end;

procedure TFrmUDWorksheet.wwDBComboDlgTableNameCustomDlg(Sender: TObject);
begin
  with PkTableName do
    if Execute then
    begin
      QryWorksheet.Edit;
      if QryWorksheetTABLE_NAME.asString <> GetValue('table_name') then
      begin
        QryWorksheetTABLE_NAME.asString:= GetValue('table_name');
        QryWorksheetCOLUMN_NAME.Clear;
      end;
    end;
end;

procedure TFrmUDWorksheet.IQUDEmbeddedForm1AfterStructureChange(Sender: TObject);
var
  AValidView  : Boolean;
  AValidColumn: Boolean;
  AUD_Tables_ID: Real;
begin
  AUD_Tables_ID:= 0;
  AValidView:= IQUDEmbeddedForm1.Active and Assigned(IQUDEmbeddedForm1.Child) and ViewExists( IQUDEmbeddedForm1.Child.View_Name );
  if AValidView then
     AUD_Tables_ID:= IQUDEmbeddedForm1.Child.UD_Tab_ID;

  AValidColumn:=  AValidView
                  and
                  (SelectValueFmtAsFloat('select 1 from ud_cols where ud_tables_id = %f and col_name = ''%s''',
                             [ AUD_Tables_ID, QryWorksheetRESULT_COLUMN_NAME.asString ]) = 1);
  // all is valid - exit
  if AValidColumn then
     EXIT;

  // get default col_name
  QryWorksheet.Edit;
  if not AValidView then
     QryWorksheetRESULT_COLUMN_NAME.Clear
  else
     QryWorksheetRESULT_COLUMN_NAME.asString:= SelectValueFmtAsString('select col_name from ud_cols '+
                                                            ' where ud_tables_id = %f     '+
                                                            '   and col_type = ''N''      '+
                                                            ' order by groupbox_seq desc  ',
                                                            [ AUD_Tables_ID ]);
  QryWorksheet.Post;
end;

procedure TFrmUDWorksheet.wwDBComboDlgResultCustomDlg(Sender: TObject);
begin
  with PkUDColumn do
    if Execute then
    begin
      QryWorksheet.Edit;
      QryWorksheetRESULT_COLUMN_NAME.asString:= GetValue('col_name');
      QryWorksheet.Post;
    end;
end;


procedure TFrmUDWorksheet.PkUDColumnBeforeOpen(DataSet: TDataSet);
var
   AUD_Tables_ID: Real;
begin
  if IQUDEmbeddedForm1.Active and Assigned(IQUDEmbeddedForm1.Child) and (IQUDEmbeddedForm1.Child.UD_Tab_ID > 0) then
     AUD_Tables_ID:= IQUDEmbeddedForm1.Child.UD_Tab_ID
  else
     AUD_Tables_ID:= IQMS.Common.Usr_Flds.GetUD_Tables_ID( IQUDEmbeddedForm1.Source, QryWorksheetCODE.asString );

  if AUD_Tables_ID = 0 then
     EXIT;

  AssignQueryParamValue(DataSet, 'ud_tables_id', AUD_Tables_ID);
end;

procedure TFrmUDWorksheet.AssignReadOnly( AControl: TUniCustomEdit; Value: Boolean );
begin
  AControl.ReadOnly:= Value and SR.ReadWrite[AControl.Name];
  if AControl.ReadOnly then
     TCustomEditLocal(AControl).Color:= clBtnFace
  else
     TCustomEditLocal(AControl).Color:= clWindow;
end;


end.
