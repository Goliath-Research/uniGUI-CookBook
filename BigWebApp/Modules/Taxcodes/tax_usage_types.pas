unit tax_usage_types;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  FireDAC.Comp.Client,
  Data.DB,
  IQMS.WebVcl.Search,
  Vcl.Buttons,
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
  uniDBNavigator, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, IQUniGrid,
  Vcl.Controls, uniGUIFrame;

type
  TFrmTaxUsageTypes = class(TUniForm)
    IQSearch1: TIQUniGridControl;
    qryUsageType: TFDQuery;
    srcUsageType: TDataSource;
    qryUsageTypeID: TBCDField;
    qryUsageTypeCODE: TStringField;
    qryUsageTypeDESCRIPTION: TStringField;
    FDUpdateUsageType: TFDUpdateSQL;
    Panel1: TUniPanel;
    sbtnAddDefault: TUniSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnAddDefaultClick(Sender: TObject);
    procedure qryUsageTypeBeforePost(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoTaxUsageTypes;

implementation

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;

{$R *.dfm}
procedure DoTaxUsageTypes;
var
  frm: TFrmTaxUsageTypes;
begin
  frm:= TFrmTaxUsageTypes.Create(uniGUIApplication.UniApplication);
  frm.ShowModal;
end;

procedure TFrmTaxUsageTypes.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
  IQRegFormRead( self, [ self ]);
end;

procedure TFrmTaxUsageTypes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmTaxUsageTypes.qryUsageTypeBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet, 'ARCUSTO_USAGE_TYPE');
end;

procedure TFrmTaxUsageTypes.sbtnAddDefaultClick(Sender: TObject);
begin
  ExecuteCommand('begin tax_code.populate_default_usage_types; end;');
  ReOpen(qryUsageType);
end;


end.
