unit Acct_Pk;

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
  Acct_TV,
  DB,
  Buttons,
  ComCtrls,
  StdCtrls,
  ExtCtrls,
  ImgList,
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
  System.ImageList,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel, uniImageList, uniStatusBar, uniTreeView;

type
  TAcctTreeViewPk = class(TAcctTreeView)
    sbtnOnTop: TUniSpeedButton;
    Bevel2: TUniPanel;
    procedure sbtnOnTopClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TreeView1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

uses
  IQMS.Common.JumpConstants,
  fin_rpt_rscstr;

procedure TAcctTreeViewPk.FormCreate(Sender: TObject);
begin
  inherited;
  LoadTreeViewFromQuery;
  if FormStyle = fsNormal then
     sbtnOnTop.Down:= FALSE
  else
     sbtnOnTop.Down:= TRUE;
end;

procedure TAcctTreeViewPk.sbtnOnTopClick(Sender: TObject);
begin
  inherited; {nothing}
  if FormStyle = fsNormal then
     FormStyle:= fsStayOnTop
  else
     FormStyle:= fsNormal;
end;

procedure TAcctTreeViewPk.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  PostMessage( TWinControl(Owner).Handle,        // Owner Window Handle
               iq_AfterCloseChild,  // Message ID
               1,                   // just an identifier so the parent will know what child window was closed
               0 );
end;

procedure TAcctTreeViewPk.TreeView1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if ssLeft in Shift then
     TreeView1.BeginDrag(FALSE);
end;

end.

