unit EDMErrors;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  Grids,
  Wwdbigrd,
  Wwdbgrid,
  DBCtrls,
  ExtCtrls,
  edimngr_main,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator;

type
  TFrmEdiMErrors = class(TUniForm)
    Panel1: TUniPanel;
    DBNavigator1: TUniDBNavigator;
    wwDBGrid1: TIQUniGridControl;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner:TComponent);override;
  end;

procedure DoShowErrors(Aowner:TComponent);


var
  FrmEdiMErrors: TFrmEdiMErrors;

implementation
uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;
{$R *.DFM}

procedure DoShowErrors(Aowner:TComponent);
begin
  with TFrmEdiMErrors.Create(AOwner) do Show;
end;

constructor TFrmEdiMErrors.Create(AOwner:TComponent);
begin
  inherited;
  IQRegFormRead( Self, [ Self, wwDBGrid1 ] ); // IQMS.Common.RegFrm.pas
end;

procedure TFrmEdiMErrors.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite( Self, [ Self, wwDBGrid1 ] ); // IQMS.Common.RegFrm.pas
  Action := caFree;
end;

end.
