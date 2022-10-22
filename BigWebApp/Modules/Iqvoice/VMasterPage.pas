unit VMasterPage;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  Vcl.Buttons,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
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
  TFrmPage_Master = class(TUniForm)
    Panel1: TUniPanel;
    SrcPage_Ctrl: TDataSource;
    TblPage_Ctrl: TFDTable;
    TblPage_CtrlID: TBCDField;
    TblPage_CtrlCODE: TStringField;
    TblPage_CtrlDESCRIP: TStringField;
    TblPage_CtrlTYPE: TStringField;
    TblPage_CtrlWAV_FILE_NAME: TStringField;
    TblPage_CtrlINTERVAL: TBCDField;
    TblPage_CtrlREPEAT_COUNT: TBCDField;
    sbtnRecord: TUniSpeedButton;
    OpenDialog1: TOpenDialog;
    wwDBGrid1: TIQUniGridControl;
    wwDBComboDlgFileName: TUniEdit;
    wwDBComboBoxType: TUniDBComboBox;
    wwDBComboBoxCode: TUniDBComboBox;
    SecurityRegister1: TIQWebSecurityRegister;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TblPage_CtrlNewRecord(DataSet: TDataSet);
    procedure sbtnRecordClick(Sender: TObject);
    procedure TblPage_CtrlBeforePost(DataSet: TDataSet);
    procedure wwDBComboDlgFileNameCustomDlg(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure ViewEdit;
  end;



implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous,
  VRecorder,
  IQMS.Common.Numbers,
  System.Variants
  { TODO -oSanketG -cWebConvert : Need to revisit }
  //IQSecIns
  ;

class procedure TFrmPage_Master.ViewEdit;
var
  FrmPage_Master: TFrmPage_Master;
begin
  FrmPage_Master := TFrmPage_Master.Create(uniGUIApplication.uniApplication);
  FrmPage_Master.ShowModal;
end;

procedure TFrmPage_Master.FormCreate(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [self, wwDBGrid1]);
end;

procedure TFrmPage_Master.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, wwDBGrid1]);
end;

procedure TFrmPage_Master.TblPage_CtrlNewRecord(DataSet: TDataSet);
var
  A: Variant;
begin
  A:= SelectValueArray( 'select pg_interval, pg_repeat_count from params' );
  if VarArrayDimCount( A ) = 0 then
     EXIT;

  TblPage_CtrlINTERVAL.asFloat    := fMax( 15, A[ 0 ]);
  TblPage_CtrlREPEAT_COUNT.asFloat:= IIf( A[ 1 ] = 0, 3, A[ 1 ]);
end;

procedure TFrmPage_Master.sbtnRecordClick(Sender: TObject);
begin
  TFrmRecorder.DoVoiceRecorder;  {VRecorder.pas}
end;

procedure TFrmPage_Master.TblPage_CtrlBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet );

  with wwDBComboBoxCode.Items do
  if (IndexOf( TblPage_CtrlCODE.asString ) = -1) and (TblPage_CtrlTYPE.asString = 'EXCEPTION') then
     raise Exception.CreateFmt( 'Unknown Exception for Code = %s. Change to Announcement', [ TblPage_CtrlCODE.asString ]);
end;

procedure TFrmPage_Master.wwDBComboDlgFileNameCustomDlg(Sender: TObject);
begin
  with OpenDialog1 do
  begin
    if InitialDir = '' then
       InitialDir:= IQMS.Common.Miscellaneous.IQGetMasterHomePath;

    if not Execute then
       EXIT;

    TblPage_Ctrl.Edit;
    TblPage_CtrlWAV_FILE_NAME.asString:= FileName;
  end;
end;

procedure TFrmPage_Master.FormShow(Sender: TObject);
begin
  { TODO -oSanketG -cWebConvert : Need to revisit, dependent on IQSecIns}
  //EnsureSecurityInspectorOnTopOf( self ); // IQSecIns.pas
end;

end.
