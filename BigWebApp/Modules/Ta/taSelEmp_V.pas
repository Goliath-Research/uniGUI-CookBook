unit taSelEmp_V;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  ExtCtrls,
  DB,
  Wwdatsrc,
  IQMS.WebVcl.Search,
  IQMS.Common.JumpConstants,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQUniGrid, uniGUIFrame;

type
  TFrmTASelEmpViol = class(TUniForm)
    IQSearch1: TIQUniGridControl;
    Src: TDataSource;
    Qry: TFDQuery;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    BtnOk: TUniButton;
    BtnCancel: TUniButton;
    QryPR_EMP_ID: TBCDField;
    QryFIRST_NAME: TStringField;
    QryLAST_NAME: TStringField;
    QryEMPNO: TStringField;
    QrySSNMBR: TStringField;
    QryBADGENO: TStringField;
    QryMIDDLE_NAME: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure IQSearch1DblClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FId :Real;
    procedure IQAfterShowMessage( var Msg: TMessage ); message iq_AfterShowMessage;
    procedure SetID(const Value: Real);
    procedure SetShowAll(const Value: String);
  public
    { Public declarations }
    property ID : Real write SetID;
    property ShowAll : String write SetShowAll;
  end;

function GetEmp(AId:Real; AShowAll:String): real;

implementation

uses
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib;

{$R *.dfm}

function GetEmp(AId:Real; AShowAll:String): real;
var
  LFrmTASelEmpViol : TFrmTASelEmpViol;
begin
   LFrmTASelEmpViol := TFrmTASelEmpViol.Create(UniGUIApplication.UniApplication);
   LFrmTASelEmpViol.ID := AId;
   LFrmTASelEmpViol.ShowAll := AShowAll;
   LFrmTASelEmpViol.ShowModal;
   Result := LFrmTASelEmpViol.FId;
end;

procedure TFrmTASelEmpViol.UniFormCreate(Sender: TObject);
begin
  FId := 0;
  Qry.ParamByName('AId1').Value := FId;

//  Qry.ParamByName('AId2').Value := AId;
  IQRegFormRead( self, [self]);
  PostMessage( Handle, iq_AfterShowMessage, 0, 0 );
//  IQSetTablesActiveEx( TRUE, self, ta_rscstr.cTXT0000200 {'Accessing database.  Please wait.'} );
end;

procedure TFrmTASelEmpViol.IQAfterShowMessage( var Msg: TMessage );
begin
  Qry.Close;
  Qry.Open;
end;


procedure TFrmTASelEmpViol.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
end;

procedure TFrmTASelEmpViol.BtnCancelClick(Sender: TObject);
begin
  FId := 0;
  Close;
end;

procedure TFrmTASelEmpViol.BtnOkClick(Sender: TObject);
begin
  FId := QryPR_EMP_ID.asFloat;
  Close;
end;

procedure TFrmTASelEmpViol.IQSearch1DblClick(Sender: TObject);
begin
  FId := QryPR_EMP_ID.asFloat;
  Close;
end;

procedure TFrmTASelEmpViol.SetID(const Value: Real);
begin
  FID := Value;
end;

procedure TFrmTASelEmpViol.SetShowAll(const Value: String);
begin
  Qry.ParamByName('AShowAll').asString := Value;
end;

end.
