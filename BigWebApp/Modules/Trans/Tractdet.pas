unit TrActDet;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  FireDAC.Comp.DataSet,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  IQUniGrid,
//  TranAcct,
  uniGUIFrame,
  Vcl.Controls;

type
  TFrmTranAcctDetails = class(TUniForm)
    Panel4: TUniPanel;
    navAcct: TUniDBNavigator;
    gridAccts: TIQUniGridControl;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoShowTranAcctDetails;

implementation

{$R *.DFM}

uses
  IQMS.Common.RegFrm;

procedure DoShowTranAcctDetails;
var
  FrmTranAcctDetails : TFrmTranAcctDetails;
begin
  FrmTranAcctDetails := TFrmTranAcctDetails.Create(UniApplication);
  with FrmTranAcctDetails do
  begin
//    navAcct.DataSource   := TFrmTransAcct(AOwner).SrcAcctsOne;
//    gridAccts.DataSource := TFrmTransAcct(AOwner).SrcAcctsOne;
//    Caption := Format('Details for %s [%s]',
//                      [TFrmTransAcct(AOwner).QryTransLog.FieldByName('DESCRIP').asString,
//                       TFrmTransAcct(AOwner).QryTransLog.FieldByName('ITEMNO').asString]);
    ShowModal;
  end;
end;

procedure TFrmTranAcctDetails.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, gridAccts]);
end;

procedure TFrmTranAcctDetails.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self, gridAccts]);
end;

end.
