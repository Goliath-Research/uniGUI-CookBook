unit wc_rtlabel_groups;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.DBCtrls, //TNavigateBtn
  FireDAC.Comp.Client,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, IQUniGrid,
  uniGUIFrame, Vcl.Controls;

type
  TFrmWorkCenterRTLabelGroup = class(TUniForm)
    Panel1: TUniPanel;
    wwDBGrid1: TIQUniGridControl;
    DataSource1: TDataSource;
    Query1: TFDQuery;
    UpdateSQL1: TFDUpdateSQL;
    Query1ID: TBCDField;
    Query1DESCRIP: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);
    procedure FormShow(Sender: TObject);
    procedure Query1NewRecord(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure DoShow;
  end;

implementation

{$R *.dfm}


uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;

procedure TFrmWorkCenterRTLabelGroup.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive(True, self);
end;

class procedure TFrmWorkCenterRTLabelGroup.DoShow;
var
  frm: TFrmWorkCenterRTLabelGroup;
begin
  frm:= TFrmWorkCenterRTLabelGroup.Create(uniGUIApplication.UniApplication);
  frm.Show;
end;

procedure TFrmWorkCenterRTLabelGroup.FormShow(Sender: TObject);
begin
  IQRegFormRead(self, [self])
end;

procedure TFrmWorkCenterRTLabelGroup.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormwrite(self, [self]);
end;

procedure TFrmWorkCenterRTLabelGroup.CheckRefresh(Sender: TObject;
  Button: TNavigateBtn);
begin
  IQCheckRefresh(Sender, Button);
end;

procedure TFrmWorkCenterRTLabelGroup.Query1NewRecord(DataSet: TDataSet);
begin
  Query1ID.AsLargeInt := GetNextID('AUTO_LABEL_GROUP');
end;


end.
