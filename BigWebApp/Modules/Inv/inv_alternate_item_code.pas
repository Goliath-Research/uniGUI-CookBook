unit inv_alternate_item_code;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  Vcl.Buttons,
  IQMS.WebVcl.Hpick,
  IQMS.Common.JumpConstants,
  IQMS.WebVcl.SecurityRegister,
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
  TFrmInvAlternateItemCode = class(TUniForm)
    Panel1: TUniPanel;
    wwDBGrid1: TIQUniGridControl;
    sbtnSearch: TUniSpeedButton;
    SrcAlternateItemCode: TDataSource;
    QryAlternateItemCode: TFDQuery;
    QryAlternateItemCodeID: TBCDField;
    QryAlternateItemCodeCODE: TStringField;
    QryAlternateItemCodeDESCRIP: TStringField;
    PkAlternateItemCode: TIQWebHPick;
    PkAlternateItemCodeID: TBCDField;
    PkAlternateItemCodeCODE: TStringField;
    PkAlternateItemCodeDESCRIP: TStringField;
    UpdateSQLAlernateItemCode: TFDUpdateSQL;
    SR: TIQWebSecurityRegister;
    procedure sbtnSearchClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
    procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn); }
    procedure QryAlternateItemCodeBeforePost(DataSet: TDataSet);
    procedure ApplyUpdate(DataSet: TDataSet);
    procedure PkAlternateItemCodeIQModify(Sender: TObject;
      var Action: TModalResult; var ResultValue: Variant);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure IQNotify( var Msg: TMessage ); message iq_Notify;
  public
    { Public declarations }
    class procedure DoShow;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;

const constInsertViaNavigator = 1;

class procedure TFrmInvAlternateItemCode.DoShow;
var
  LFrmInvAlternateItemCode : TFrmInvAlternateItemCode;
begin
  LFrmInvAlternateItemCode := TFrmInvAlternateItemCode.Create(UniGUIApplication.UniApplication);
  LFrmInvAlternateItemCode.Show;
end;

procedure TFrmInvAlternateItemCode.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBgrid1 ]);
end;

procedure TFrmInvAlternateItemCode.IQNotify(var Msg: TMessage);
begin
(* TODO -oGPatil -cWebConvert : nbInsert undeclared identifier
  case Msg.WParam of
    constInsertViaNavigator:
      if wwDBGrid1.Controls[ Ord(nbInsert) ].Enabled and SR.Enabled['NavMain'] and SR.Insert['NavMain'] then
         wwDBGrid1.Controls.BtnClick( nbInsert );
  end;  ]     *)
end;

procedure TFrmInvAlternateItemCode.PkAlternateItemCodeIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
  Action:= mrOK;
  ResultValue:= 0;
  PostMessage( self.Handle, IQ_Notify, constInsertViaNavigator, 0 );   { Call Insert }
end;

procedure TFrmInvAlternateItemCode.QryAlternateItemCodeBeforePost(
  DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet, 'alternate_item_code');
  QryAlternateItemCodeCODE.asString:= UpperCase(QryAlternateItemCodeCODE.asString);
end;

procedure TFrmInvAlternateItemCode.sbtnSearchClick(Sender: TObject);
begin
  with PkAlternateItemCode do
    if Execute then
       QryAlternateItemCode.Locate('id', GetValue('id'), [])
end;

procedure TFrmInvAlternateItemCode.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self, wwDBgrid1 ]);
(* TODO -oGPatil -cWebConvert : Form owner must be UniApplication Error
  LocateOrPickList( self, 0{id}, QryAlternateItemCode, PkAlternateItemCode ); *)
end;

procedure TFrmInvAlternateItemCode.ApplyUpdate(DataSet: TDataSet);
begin
//  IQApplyUpdateToTable( DataSet );
end;

{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
procedure TFrmInvAlternateItemCode.CheckRefresh(Sender: TObject;
  Button: TNavigateBtn);
begin
  IQCheckRefresh(Sender, Button);
end;   }


end.
