unit IQMS.WebVcl.POApproverTree;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.DBGrids,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniBasicGrid,
  uniDBGrid,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.Controls;

type
  TFrmPOApproverTree = class(TUniForm)
    DBGrid1: TUniDBGrid;
    DataSource1: TDataSource;
    Query1: TFDQuery;
    Query1USER_NAME: TStringField;
    Query1PO_APPROVER: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
  private
    procedure SetUserName(const AUserName: String);
    { Private declarations }
  public
   property UserName :String Write SetUserName;
    { Public declarations }
  end;


procedure DoShowPOApproverTree( AUserName: string );

implementation

{$R *.DFM}

uses
  IQMS.Common.RegFrm,
  IQMS.WebVcl.ResourceStrings;

procedure DoShowPOApproverTree( AUserName: string );
begin
  with TFrmPOApproverTree.Create( uniGUIApplication.UniApplication  ) do
  begin
    UserName:=AUserName;
    ShowModal;
  end
end;

procedure TFrmPOApproverTree.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, DBGrid1 ])
end;

procedure TFrmPOApproverTree.SetUserName(const AUserName: String);
begin
  with Query1 do
  begin
    Close;
    ParamByName('user_name').asString:= AUserName;
    Open;
  end;
  Caption:= Format( IQMS.WebVcl.ResourceStrings.cTXT0000252 {'%s PO Approver Tree'}, [AUserName]);
end;

procedure TFrmPOApproverTree.UniFormCreate(Sender: TObject);
begin

  IQRegFormRead( self, [ self, DBGrid1 ]);
end;

end.
