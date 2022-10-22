unit ForeConfirmCopy;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  IQMS.WebVcl.Search,
  ExtCtrls,
  ForeShare,
  DB,
  FireDAC.Comp.Client,
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
  FireDAC.Comp.DataSet,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniRadioButton,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel, IQUniGrid, uniGUIFrame, uniImage;

type
  TFrmConfirmCopy = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    Bevel1: TUniPanel;
    IQSearchShipTo: TIQUniGridControl;
    Bevel2: TUniPanel;
    Panel4: TUniPanel;
    rbtnShipOne: TUniRadioButton;
    rbtnShipAny: TUniRadioButton;
    Label3: TUniLabel;
    Bevel3: TUniPanel;
    SrcShipTo: TDataSource;
    QryShipTo: TFDQuery;
    QryShipToCUSTNO: TStringField;
    QryShipToSHIP_TO_ID: TBCDField;
    QryShipToATTN: TStringField;
    QryShipToADDR1: TStringField;
    QryShipToCITY: TStringField;
    QryShipToSTATE: TStringField;
    QryShipToCOUNTRY: TStringField;
    QryShipToZIP: TStringField;
    QryShipToPHONE_NUMBER: TStringField;
    QryShipToPRIME_CONTACT: TStringField;
    Panel5: TUniPanel;
    lblHeader: TUniLabel;
    Splitter1: TUniSplitter;
    Panel6: TUniPanel;
    Image1: TUniImage;
    Panel7: TUniPanel;
    chkDelete: TUniCheckBox;
    pnlBottomBtns: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure QryShipToBeforeOpen(DataSet: TDataSet);
    procedure rbtnShipOneClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FCopyPasteParams: TCopyPasteParams;
    procedure SetCopyPasteParams(const Value: TCopyPasteParams);
  public
    { Public declarations }
    class function DoShowModal( var ACopyPasteParams: TCopyPasteParams ): Boolean;
    property CopyPasteParams: TCopyPasteParams write SetCopyPasteParams;
  end;



implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Controls;

{ TFrmConfirmCopy }

class function TFrmConfirmCopy.DoShowModal( var ACopyPasteParams: TCopyPasteParams): Boolean;
var
  FrmConfirmCopy: TFrmConfirmCopy;
begin
  FrmConfirmCopy := TFrmConfirmCopy.Create( uniGUIApplication.UniApplication );
  FrmConfirmCopy.CopyPasteParams := ACopyPasteParams;
  with FrmConfirmCopy do
  begin
    Result:= ShowModal = mrOK;
    if Result then
    begin
      if rbtnShipAny.Checked then
         FCopyPasteParams.Ship_To_ID:= -1
      else
         FCopyPasteParams.Ship_To_ID:= QryShipToSHIP_TO_ID.asFloat;

      if chkDelete.Checked then
         FCopyPasteParams.Delete_Src:= 'Y'
      else
         FCopyPasteParams.Delete_Src:= 'N';
    end
  end;
end;

procedure TFrmConfirmCopy.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self ]);
  IQEnableControl( IQSearchShipTo, rbtnShipOne.Checked );
end;

procedure TFrmConfirmCopy.UniFormShow(Sender: TObject);
begin

  {Caption}
  lblHeader.Caption:= Format( 'About to paste %s forecast data starting %s.'#13'Any existing forecast for %s will be overwritten.',
                              [ SelectValueByID('rtrim(itemno)', 'arinvt', FCopyPasteParams.Arinvt_ID_Src ),
                                DateToStr( FCopyPasteParams.CutOffDate ),
                                SelectValueByID( 'rtrim(itemno)', 'arinvt', FCopyPasteParams.Arinvt_ID_Trg )]);
  IQSetTablesActive( TRUE, self );
end;

procedure TFrmConfirmCopy.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmConfirmCopy.btnOKClick(Sender: TObject);
begin
  {Validate}
  if rbtnShipOne.Checked then
     IQAssert( not( QryShipTo.Eof and QryShipTo.Bof ), 'No Ship To was selected' );
  ModalResult:= mrOK;
end;

procedure TFrmConfirmCopy.QryShipToBeforeOpen(DataSet: TDataSet);
begin
//  with DataSet as TFDQuery do
//  begin
//    ParamByName('arinvt_id').asFloat      := FCopyPasteParams.Arinvt_ID_Src;
//    ParamByName('cut_off_date').asDateTime:= FCopyPasteParams.CutOffDate;
//    ParamByName('fore_head_id').asFloat   := FCopyPasteParams.Fore_Head_ID;
//  end;
  AssignQueryParamValue(DataSet, 'arinvt_id'   , FCopyPasteParams.Arinvt_ID_Src);
  AssignQueryParamValue(DataSet, 'cut_off_date', FCopyPasteParams.CutOffDate);
  AssignQueryParamValue(DataSet, 'fore_head_id', FCopyPasteParams.Fore_Head_ID);
end;

procedure TFrmConfirmCopy.rbtnShipOneClick(Sender: TObject);
begin
  IQEnableControl( IQSearchShipTo, rbtnShipOne.Checked );
end;

procedure TFrmConfirmCopy.SetCopyPasteParams(const Value: TCopyPasteParams);
begin
  FCopyPasteParams := Value;
end;

end.
