unit Master_Labor;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  Vcl.Forms,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.SecurityRegister,
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
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, uniGUIFrame,
  IQUniGrid, System.Classes, Vcl.Controls;

type
  TFrmMasterLabor = class(TUniForm)
    wwDBGrid1: TIQUniGridControl;
    wwDataSource1: TDataSource;
    wwTblMasterLabor: TFDTable;
    wwTblMasterLaborID: TBCDField;
    wwTblMasterLaborCODE: TStringField;
    wwTblMasterLaborDESCRIP: TStringField;
    SR: TIQWebSecurityRegister;
    Bevel1: TUniPanel;
    wwTblMasterLaborPK_HIDE: TStringField;
    procedure wwTblMasterLaborBeforePost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure ShowModeless;
  end;

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.HelpHook,
  IQMS.Common.Controls;

class procedure TFrmMasterLabor.ShowModeless;
begin
  TFrmMasterLabor.Create( UniGuiApplication.UniApplication ).Show;
end;

procedure TFrmMasterLabor.wwTblMasterLaborBeforePost(DataSet: TDataSet);
begin
  wwTblMasterLaborCODE.asString:= Trim(UpperCase(wwTblMasterLaborCODE.asString));
  IQAssignIDBeforePost( DataSet );
end;

procedure TFrmMasterLabor.FormCreate(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  IQRegFormRead(self, [ self, wwDBGrid1 ]);
end;

procedure TFrmMasterLabor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self, wwDBGrid1 ]);
end;

procedure TFrmMasterLabor.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmSETUP{CHM}, iqhtmSETUPch4{HTM} );  {IQMS.Common.HelpHook.pas}
end;

end.
