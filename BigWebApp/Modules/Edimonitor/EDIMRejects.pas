unit EDIMRejects;

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
  edimngr_main,
  Grids,
  Wwdbigrd,
  Wwdbgrid,
  DBCtrls,
  ExtCtrls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, IQUniGrid, uniGUIFrame;

type
  TFrmRejects = class(TUniForm)
    Panel1: TUniPanel;
    DBNavigator1: TUniDBNavigator;
    wwDBGrid1: TIQUniGridControl;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
 //   constructor Create(AOwner:TComponent);override;
  end;

procedure DoShowRejects(Aowner:TComponent);

var
  FrmRejects: TFrmRejects;

implementation
uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;
{$R *.DFM}

procedure DoShowRejects(Aowner:TComponent);
begin
  FrmRejects := TFrmRejects.Create(UniGUIApplication.UniApplication);
  FrmRejects.ShowModal;
end;



procedure TFrmRejects.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( Self, [ Self, wwDBGrid1 ] ); // IQMS.Common.RegFrm.pas
  Action := caFree;
end;

procedure TFrmRejects.UniFormCreate(Sender: TObject);
begin
      IQRegFormRead( Self, [ Self, wwDBGrid1 ] ); // IQMS.Common.RegFrm.pas
end;

end.
