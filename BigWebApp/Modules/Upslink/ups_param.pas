unit ups_param;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Buttons,
  Data.DB,
  Vcl.Wwdatsrc,
  Mask,
  Vcl.wwdbedit,
  Vcl.Wwdotdot,
  Vcl.Wwdbcomb,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniPageControl,
  uniLabel,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniEdit,
  uniDBEdit,
  uniMultiItem,
  uniComboBox, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniFileUpload;

type
  TFrmUPSParam = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    pcMain: TUniPageControl;
    TabUPS: TUniTabSheet;
    btnOK: TUniBitBtn;
    btnCancel: TUniBitBtn;
    SrcIQSYS: TDataSource;
    TblIQSYS: TFDTable;
    TblIQSYSUPS_HANDLING: TBCDField;
    TabFedEx: TUniTabSheet;
    TabGeneral: TUniTabSheet;
    lblHandling: TUniLabel;
    dbeHandling: TUniDBEdit;
    GroupBox1: TUniGroupBox;
    Label1: TUniLabel;
    cmbUPSRefColumn: TUniComboBox;
    GroupBox4: TUniGroupBox;
    Label3: TUniLabel;
    cmbFedExRef: TUniComboBox;
    GroupBox2: TUniGroupBox;
    Label2: TUniLabel;
    edtUPSDatabase: TUniEdit;
    sbtnBrowseDB: TUniSpeedButton;
    Label5: TUniLabel;
    wwDBEdit1: TUniDBEdit;
    TblIQSYSUPS_HANDLING_FLAT: TFMTBCDField;
    TblIQSYSID: TBCDField;
    UniFileUpload1: TUniFileUpload;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure DoSelectUPSDatabase(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFileUpload1Completed(Sender: TObject; AStream: TFileStream);
  private
    { Private declarations }
    procedure DoOnShowHint(var HintStr: string; var CanShow: Boolean;
      var HintInfo: THintInfo);
  public
    { Public declarations }
  end;

function DoUPSLinkParams(var ARequireRestart: Boolean): Boolean;


implementation

{$R *.DFM}


uses
  IQMS.Common.RegFrm,
//  ups_settings,
  upslink_rscstr;

function DoUPSLinkParams(var ARequireRestart: Boolean): Boolean;
var
  FrmUPSParam : TFrmUPSParam;
begin
  FrmUPSParam := TFrmUPSParam.Create(UniApplication);
  with FrmUPSParam do
    begin
      pcMain.ActivePageIndex := 0;

      // Handling percentage
      TblIQSYS.Open;
      dbeHandling.Enabled := not (TblIQSYS.BOF and TblIQSYS.EOF);
      lblHandling.Enabled := not (TblIQSYS.BOF and TblIQSYS.EOF);

      // Reference column
//      cmbUPSRefColumn.ItemIndex := ApplicationSettings.UPSRefColumn;
      // cmbUPSVersion.ItemIndex := ApplicationSettings.UPSVersion;
//      edtUPSDatabase.Text := ApplicationSettings.UPSDatabase;
//      cmbFedExRef.ItemIndex := ApplicationSettings.FedExRefColumn;
      Result := (ShowModal = mrOk);
      ARequireRestart := Result;
    end;
end;
procedure TFrmUPSParam.UniFileUpload1Completed(Sender: TObject;
  AStream: TFileStream);
begin
  edtUPSDatabase.Text := AStream.FileName;
end;

procedure TFrmUPSParam.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead(Self, [Self]);
end;

procedure TFrmUPSParam.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(Self, [Self]);
end;

procedure TFrmUPSParam.btnOKClick(Sender: TObject);
begin
  if (TblIQSYS.State in [dsEdit, dsInsert]) then
    TblIQSYS.Post;

//  ApplicationSettings.UPSRefColumn := cmbUPSRefColumn.ItemIndex;
//  ApplicationSettings.UPSDatabase := edtUPSDatabase.Text;
//  ApplicationSettings.FedExRefColumn := cmbFedExRef.ItemIndex;
end;

procedure TFrmUPSParam.DoOnShowHint(var HintStr: string;
  var CanShow: Boolean; var HintInfo: THintInfo);
begin
  with HintInfo do
    begin
      if (HintControl = lblHandling) then
        // 'Percentage of shipping charge to apply to shipments.'#13 +
        // 'Value will be added to the imported shipping charge when applied to Shipment.';
        HintStr := upslink_rscstr.cTXT0000023;
    end;
end;

procedure TFrmUPSParam.DoSelectUPSDatabase(Sender: TObject);
begin
  UniFileUpload1.Execute;
end;

end.
