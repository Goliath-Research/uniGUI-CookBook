unit PrDelPr;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.WebVcl.Search,
  Data.DB,
  IQMS.Common.PanelMsg,
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
  uniButton,
  uniDBNavigator, IQUniGrid, uniGUIFrame;

type
  TFrmDelPriors = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    BtnDelete: TUniButton;
    BtnCancel: TUniButton;
    Panel3: TUniPanel;
    Nav: TUniDBNavigator;
    IQSearch1: TIQUniGridControl;
    QryPrior: TFDQuery;
    QryPriorID: TBCDField;
    QryPriorPR_EMP_ID: TBCDField;
    QryPriorPAYPERIOD_ID: TBCDField;
    QryPriorQTR_CODE: TBCDField;
    QryPriorCHEQUE_ID: TBCDField;
    QryPriorAMOUNT: TBCDField;
    QryPriorGLPERIODS_ID_PR: TBCDField;
    QryPriorCHECK_NO: TBCDField;
    QryPriorCHECK_DATE: TDateTimeField;
    QryPriorCHECK_STATUS: TStringField;
    QryPriorBANKINFO_DTL_ID: TBCDField;
    QryPriorVOID_REASON: TStringField;
    QryPriorACCOUNT_NUMBER: TStringField;
    QryPriorPERIOD: TBCDField;
    QryPriorPR_TYPE: TStringField;
    QryPriorPR_PAYGROUP_DESCRIPTION: TStringField;
    QryPriorPAYPERIOD_ENDING_DATE: TDateTimeField;
    QryPriorWORK_PERIOD_BEGIN: TDateTimeField;
    QryPriorWORK_PERIOD_END: TDateTimeField;
    QryPriorTIME_STAMP: TDateTimeField;
    SrcCheck: TDataSource;
    QryPriorFIRST_NAME: TStringField;
    QryPriorLAST_NAME: TStringField;
    QryPriorSSNMBR: TStringField;
    procDeletePriors: TFDStoredProc;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnDeleteClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
  private
    { Private declarations }
    HMsg:TPanelMesg;
  public
    { Public declarations }
    //constructor Create(AOwner:Tcomponent);override;
  end;

procedure DoDeletePayrollPriors;

var
  FrmDelPriors: TFrmDelPriors;

implementation
{$R *.DFM}
uses
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs;

procedure DoDeletePayrollPriors;
var
  form : TFrmDelPriors;

begin
  form := TFrmDelPriors.Create(uniGUIApplication.UniApplication);

  IQSetTablesActive( TRUE, form );
//  IQRegFormRead( form, [ form ]);

  form.ShowModal;
end;

procedure TFrmDelPriors.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  IQRegFormWrite( self, [ self ]);
//  Action := caFree;
end;

procedure TFrmDelPriors.BtnDeleteClick(Sender: TObject);
var
  I: integer;
begin
//  if IqSearch1.DBGrid.SelectedRows.Count = 0 then
//    IqSearch1.DBGrid.SelectedRows;

  with IqSearch1.DBGrid, IqSearch1.DBGrid.datasource.dataset do
  try
    HMsg:= hPleaseWait( 'please wait...' );
    for I:= 0 to SelectedRows.Count-1 do
    begin
      GotoBookmark(SelectedRows.items[i]);
      HMsg.Mesg:= Format('Deleting ID# %d', [Trunc(FieldByName('ID').asFloat)]);
      ProcDeletePriors.ParamByName('V_HIST_EMP_ID').Value := FieldByName('ID').asFloat;
      ProcDeletePriors.Prepare;
      ProcDeletePriors.ExecProc;
    end;
  finally;
    HMsg.Free;
  end;
//  IqSearch1.dbgrid.UnSelectAll;
  QryPrior.Close;
  QryPrior.Open;
  IqConfirm('Done');
end;

procedure TFrmDelPriors.BtnCancelClick(Sender: TObject);
begin
  Close;
end;

end.
