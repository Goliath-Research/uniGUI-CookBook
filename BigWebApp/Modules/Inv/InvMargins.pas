unit InvMargins;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  Vcl.Wwdatsrc,
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
  Data.DB,
  Vcl.Controls,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIClasses,
  uniGUIForm,
  uniGUIApplication, IQUniGrid, uniGUIFrame;

type
  TFrmMargings = class(TUniForm)
    wwDBGrid1: TIQUniGridControl;
    Src: TDataSource;
    Qry: TFDQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    procedure SetId(const Value: Real);
    { Private declarations }
  public
    { Public declarations }
    property Id:Real write SetId;
  end;


procedure DoINVMargins(AId:Real);

implementation
uses
  IQMS.Common.RegFrm,
  IQMS.Common.HelpHook;
{$R *.dfm}

procedure DoINVMargins(AId:Real);
var
  LFrmMargings : TFrmMargings;
begin
  LFrmMargings := TFrmMargings.Create(UniGUIApplication.UniApplication);
  LFrmMargings.Id := AId;
  LFrmMargings.ShowModal;
end;

procedure TFrmMargings.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBGrid1 ]);
end;

procedure TFrmMargings.SetId(const Value: Real);
begin
  Qry.Close;
  Qry.ParamByName('AId').Value := Value;
  Qry.Open;
end;

procedure TFrmMargings.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self, wwDBGrid1 ]);
end;

procedure TFrmMargings.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmACCT{CHM}, iqhtmSETUP{HTM} )  {IQMS.Common.HelpHook.pas}
end;

end.
