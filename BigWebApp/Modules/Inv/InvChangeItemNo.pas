unit InvChangeItemNo;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Mask,
  Data.DB,
  IQMS.WebVcl.UDComboBox,
{ TODO -oGPatil -cWebConvert : Dependency
  IQMS.Common.UserMessages,
  IQSecIns,   }
  IQMS.WebVcl.SecurityRegister,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox;

type
  TFrmChangeItemNo = class(TUniForm)
    DataSource1: TDataSource;
    PnlMain: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient01: TUniPanel;
    Label5: TUniLabel;
    Label4: TUniLabel;
    dbeItemNo: TUniDBEdit;
    PnlButtons: TUniPanel;
    IQUDComboBox1: TIQWebUDComboBox;
    Panel1: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    SecurityRegister1: TIQWebSecurityRegister;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure IQUDComboBox1CloseUp(Sender: TObject);
  private
    { Private declarations }
    FOldItemNo: string;
    FOldRev   : string;
    FArinvtDataSet: TDataSet;
    procedure IQNotify( var Msg: TMessage ); {message iq_Notify;}
    procedure SetArinvtDataSet(const Value: TDataSet);
  public
    { Public declarations }
    property ArinvtDataSet: TDataSet read FArinvtDataSet write SetArinvtDataSet;
  end;

procedure DoChangeItemno(AArinvtDataSet: TDataSet );

implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Dialogs;

procedure DoChangeItemno(AArinvtDataSet: TDataSet );
var
  LFrmChangeItemNo : TFrmChangeItemNo;
begin
  LFrmChangeItemNo := TFrmChangeItemNo.Create(UniGUIApplication.UniApplication);
  LFrmChangeItemNo.ArinvtDataSet := AArinvtDataSet;
  LFrmChangeItemNo.ShowModal;
end;

procedure TFrmChangeItemNo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self, PnlLeft01]);
end;


procedure TFrmChangeItemNo.FormShow(Sender: TObject);
begin
{ TODO -oGPatil -cWebConvert : Dependency
  EnsureSecurityInspectorOnTopOf( self );  {IQSecIns.pas}
end;

procedure TFrmChangeItemNo.btnCancelClick(Sender: TObject);
begin
  ModalResult:= mrCancel;

  if not Assigned( DataSource1.DataSet ) then
     EXIT;

  if not (DataSource1.DataSet.State in [ dsEdit, dsInsert ]) then
     EXIT;

  DataSource1.DataSet.FieldByName('itemno').asString:= FOldItemNo;
  DataSource1.DataSet.FieldByName('rev').asString   := FOldRev;
end;

procedure TFrmChangeItemNo.IQNotify(var Msg: TMessage);
begin
  IQWarning( 'Please note the Revision field can be only 15 chars long - any extra characters will be truncated.')
end;

procedure TFrmChangeItemNo.IQUDComboBox1CloseUp(Sender: TObject);
begin
{ TODO -oGPatil -cWebConvert : IQUDComboBox1CloseUp definition changed.Old one not valid
  if not Select then EXIT;

  with Sender do
    if (ItemIndex > -1) and ( Length( Items[ ItemIndex ] ) > 15 ) then
       PostMessage( self.Handle, iq_Notify, 0, 0);    {IQMS.Common.UserMessages.pas}
end;

procedure TFrmChangeItemNo.SetArinvtDataSet(const Value: TDataSet);
begin
  DataSource1.DataSet := Value;
  FOldItemNo:= Value.FieldByName('itemno').asString;
  FOldRev   := Value.FieldByName('rev').asString;
end;

procedure TFrmChangeItemNo.UniFormCreate(Sender: TObject);
begin
{ TODO -oGPatil -cWebConvert :  Incompatible types: 'TForm' and 'TFrmChangeItemNo'
  IQMS.Common.Controls.CenterForm(Self); // default position   }
  IQRegFormRead(self, [self, PnlLeft01]);
  AdjustControlsWidthBasedOnParent( PnlClient01, [dbeItemNo, IQUDComboBox1], 6 );  // IQMS.Common.Controls.pas
end;

end.
