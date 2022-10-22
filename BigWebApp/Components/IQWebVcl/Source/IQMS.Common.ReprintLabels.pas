unit IQMS.Common.ReprintLabels;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.WebVcl.CaptionPanel,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  vcl.wwdblook,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniSplitter,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel,
  uniComboBox,
  uniDBComboBox, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.Graphics;

type
  TFrmReprintLabels = class(TUniForm)
    CaptionPanel1: TIQWebCaptionPanel;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Panel4: TUniPanel;
    Panel5: TUniPanel;
    Splitter1: TUniSplitter;
    lblPrinter: TUniLabel;
    wwDBComboPrinter: TUniDBComboBox;
    Label5: TUniLabel;
    SrcLabels: TDataSource;
    QryLabels: TFDQuery;
    wwLabels: TUniDBLookupComboBox;
    QryLabelsID: TBCDField;
    QryLabelsLABEL_MENU_NAME: TStringField;
    QryLabelsLABEL_TYPE: TStringField;
    procedure wwLabelsChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FList: TStringList;
    FLM_Labels_ID: Integer;
    procedure InitForm;
    procedure CheckAssignPrinterName(APrinterName: string);
    procedure Reprint;
  public
    { Public declarations }
    class procedure DoShowModal( AOwner: TComponent; AList: TStringList );
    property List : TStringList read FList write FList;
  end;

var
  FrmReprintLabels: TFrmReprintLabels;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.PrintLabels.LMBase,
  IQMS.PrintLabels.LMShare,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
//  SerTrack,
  Vcl.Printers;

{ TFrmReprintLabels }

class procedure TFrmReprintLabels.DoShowModal(AOwner: TComponent; AList: TStringList);
begin
  with TFrmReprintLabels.Create(uniGUIApplication.UniApplication) do
   begin
     List:=AList;
     ShowModal;
   end;
end;

procedure TFrmReprintLabels.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
  IQRegStringScalarWrite(self, 'LM_Printer', wwDBComboPrinter.Text);
end;

procedure TFrmReprintLabels.InitForm;
var
  ALM_Labels_ID: Integer;
  I: Integer;
  S: string;
begin
  // label asdf
  ALM_Labels_ID:= SelectValueFmtAsInteger('select lm_labels_id             '+
                                                '  from master_label             '+
                                                ' where id in (%s)               '+
                                                '   and lm_labels_id is not null '+
                                                '   and rownum < 2               ',
                                                [ IQMS.Common.StringUtils.StringListToStr( FList, ',' ) ]);
  if (ALM_Labels_ID > 0) and QryLabels.Locate('id', ALM_Labels_ID, []) then
  begin
//    wwLabels.LookupValue:= QryLabels.FieldByName('ID').asString;
    wwLabels.Text:= QryLabels.FieldByName('LABEL_MENU_NAME').asString;
  end;

  // printer
  for I := 0 to Printer.Printers.Count - 1 do
    wwDBComboPrinter.Items.Add(Printer.Printers[I]);
  wwDBComboPrinter.ItemIndex := - 1;

  if IQRegStringScalarRead(self, 'LM_Printer', S) then
     CheckAssignPrinterName( S );
end;


procedure TFrmReprintLabels.CheckAssignPrinterName( APrinterName: string );
begin
  if (APrinterName > '') and (wwDBComboPrinter.Items.IndexOf(APrinterName) > - 1) then
    wwDBComboPrinter.ItemIndex:= wwDBComboPrinter.Items.IndexOf(APrinterName);
end;


procedure TFrmReprintLabels.wwLabelsChange(Sender: TObject);
begin
  FLM_Labels_ID:= QryLabels.FieldByName('id').asInteger;
end;


procedure TFrmReprintLabels.btnOKClick(Sender: TObject);
begin
  Reprint;
  ModalResult:= mrOK;
end;


procedure TFrmReprintLabels.Reprint;
var
  AWasAnyLabelPrinted: Boolean;
  APrintIntervalFlag: Boolean;
  I: Integer;
  AMaster_Label_ID: Real;
begin
  APrintIntervalFlag:= TFrmLM_Base.AssignSkipCheckMinimumPrintInterval( TRUE );
  AWasAnyLabelPrinted:= IsAnyLabelBeenPrinted;

  try
    IQMS.PrintLabels.LMShare.ForcedLM_Lables_ID:= FLM_Labels_ID;  // see IQLMBase

    for I:= 0 to FList.Count - 1 do
    begin
      AMaster_Label_ID:= StrToFloat(FList[ I ]);

//      TFrmTrackSer.ReprintLabel( AMaster_Label_ID, FALSE {AConfirmYN} );  {SerTrack.pas}

      // if this is the 1st label system wide to be printed then wait 3min to finish
      if IsAnyLabelBeenPrinted and not AWasAnyLabelPrinted then
      begin
        Sleep(3 * 1000);
        AWasAnyLabelPrinted:= TRUE;
      end;
      Application.ProcessMessages;
    end;

  finally
    IQMS.PrintLabels.LMShare.ForcedLM_Lables_ID:= 0;
    TFrmLM_Base.AssignSkipCheckMinimumPrintInterval( APrintIntervalFlag ); //reset back to how it was
  end;
end;




procedure TFrmReprintLabels.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self ]);
  InitForm;
end;

end.
