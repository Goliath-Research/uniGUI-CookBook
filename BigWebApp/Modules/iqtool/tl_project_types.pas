unit tl_project_types;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Vcl.Buttons,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.SecurityRegister,
  IQMS.Common.JumpConstants,
  FireDAC.UI.Intf,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  VCl.DbCtrls,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQUniGrid, uniGUIFrame;

type
  TFrmTLProjectTypes = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    wwDBGrid1: TIQUniGridControl;
    SrcProjectType: TDataSource;
    QryProjectType: TFDQuery;
    QryProjectTypeID: TBCDField;
    QryProjectTypeNAME: TStringField;
    QryProjectTypeDESCRIP: TStringField;
    sbtnSearch: TUniSpeedButton;
    PkType: TIQWebHPick;
    PkTypeID: TBCDField;
    PkTypeNAME: TStringField;
    PkTypeDESCRIP: TStringField;
    SR: TIQWebSecurityRegister;
    FDUpdateSQL1: TFDUpdateSQL;
    procedure QryProjectTypeNewRecord(DataSet: TDataSet);
    procedure QryProjectTypeBeforePost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnSearchClick(Sender: TObject);
    procedure PkTypeIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure IQNotify(var Msg: TMessage); message iq_Notify;
  public
    { Public declarations }
    class procedure DoShow;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;

const
  constInsert = 1;

class procedure TFrmTLProjectTypes.DoShow;
var
  LFrmTLProjectTypes : TFrmTLProjectTypes;
begin
  LFrmTLProjectTypes := TFrmTLProjectTypes.Create(UniGUIApplication.UniApplication);
  LFrmTLProjectTypes.Show;
end;

procedure TFrmTLProjectTypes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(Self, [Self, wwDBGrid1]);
end;

procedure TFrmTLProjectTypes.IQNotify(var Msg: TMessage);
begin
  case Msg.WParam of
    constInsert:
{ TODO -oGPatil -cWebConvert : TUniDBNavigator does not contain BtnClick
      if navMain.Controls[Ord(nbInsert)].Enabled and SR.Enabled['NavMain'] and
        SR.Insert['NavMain'] then
        navMain.BtnClick(nbInsert);   }
  end;
end;

procedure TFrmTLProjectTypes.PkTypeIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
  Action := mrOK;
  ResultValue := 0;
  PostMessage(Self.Handle, iq_Notify, constInsert, 0); { Call Insert }
end;

procedure TFrmTLProjectTypes.QryProjectTypeBeforePost(DataSet: TDataSet);
begin
  QryProjectTypeNAME.asString := UpperCase(QryProjectTypeNAME.asString);
end;

procedure TFrmTLProjectTypes.QryProjectTypeNewRecord(DataSet: TDataSet);
begin
  QryProjectTypeID.AsLargeInt := GetNextID('tool_project_type');
end;

procedure TFrmTLProjectTypes.sbtnSearchClick(Sender: TObject);
begin
  with PkType do
    if Execute then
      QryProjectType.Locate('id', System.Variants.VarAsType(GetValue('id'),
        varInt64), [])
end;

procedure TFrmTLProjectTypes.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead(Self, [Self, wwDBGrid1]);
  IQSetTablesActive(True, Self);
(* TODO -oGPatil -cWebConvert :
  LocateOrPickList(Self, 0 { ID } , QryProjectType, PkType); *)
end;

end.
