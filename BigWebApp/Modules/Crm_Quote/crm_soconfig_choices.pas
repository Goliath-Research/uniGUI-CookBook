unit crm_soconfig_choices;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Forms,
  crmlist,
  Data.DB,
  Vcl.Wwdatsrc,
  Vcl.Buttons,
  IQMS.WebVcl.Hpick,
  Datasnap.DBClient,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.UI.Intf,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  IQMS.WebVcl.Search,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton, IQUniGrid, uniGUIFrame, uniDBNavigator, uniPanel,
  uniGUIApplication;

type
  { TFrmSalesConfigChoices }
  TFrmSalesConfigChoices = class(TFrmCRMList)
    SrcSalesChoice: TDataSource;
    QrySalesChoice: TFDQuery;
    QrySalesChoiceID: TBCDField;
    QrySalesChoiceCODE: TStringField;
    QrySalesChoiceDESCRIP: TStringField;
    sbtnSearch: TUniSpeedButton;
    PkSalesChoice: TIQWebHPick;
    PkSalesChoiceID: TBCDField;
    PkSalesChoiceCODE: TStringField;
    PkSalesChoiceDESCRIP: TStringField;
    PkSalesChoicePRICE: TFMTBCDField;
    QrySalesChoicePRICE: TFMTBCDField;
    FDUpdateSQL1: TFDUpdateSQL;
    procedure QrySalesChoiceBeforePost(DataSet: TDataSet);
    procedure sbtnSearchClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QrySalesChoiceNewRecord(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure DoShow();
  end;



implementation

uses
  crm_rscstr,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm;

{$R *.dfm}

{ TTFrmSalesConfigChoices }

class procedure TFrmSalesConfigChoices.DoShow();
var
  FrmSalesConfigChoices: TFrmSalesConfigChoices;
begin
  FrmSalesConfigChoices := TFrmSalesConfigChoices.Create(uniGUIApplication.UniApplication);
  FrmSalesConfigChoices.Show;
end;

procedure TFrmSalesConfigChoices.FormShow(Sender: TObject);
begin
  inherited;
  IQRegFormRead(self, [self]);
end;

procedure TFrmSalesConfigChoices.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  IQRegFormWrite(self, [self]);
end;

procedure TFrmSalesConfigChoices.QrySalesChoiceBeforePost(DataSet: TDataSet);
begin
  inherited;
  QrySalesChoiceCODE.asString := UpperCase(QrySalesChoiceCODE.asString);
  // crm_rscstr.cTXT0001968 = 'Please enter a code.';
  IQAssert(QrySalesChoiceCODE.asString > '', crm_rscstr.cTXT0001968);
end;

procedure TFrmSalesConfigChoices.QrySalesChoiceNewRecord(DataSet: TDataSet);
begin
  AssignID(QrySalesChoice, 'sales_choice');
end;

procedure TFrmSalesConfigChoices.sbtnSearchClick(Sender: TObject);
begin
  inherited;

  with PkSalesChoice do
    if Execute then
      QrySalesChoice.Locate('ID',
        System.Variants.VarAsType(GetValue('ID'), varInt64), [])
end;

end.
