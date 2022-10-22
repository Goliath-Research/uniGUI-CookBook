unit webdirect_settings;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Mask,
  Vcl.Buttons,
  wwcheckbox,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniDBCheckBox,
  uniEdit,
  uniDBEdit,
  uniButton,
  uniBitBtn,
  uniPanel,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.Controls;

type
  TFrmWebDirectSettings = class(TUniForm)
    pnlMain: TUniPanel;
    Panel2: TUniPanel;
    bbtnOK: TUniBitBtn;
    bbtnCancel: TUniBitBtn;
    tblWebDriectParams: TFDTable;
    edUDCartMessage: TUniDBEdit;
    srcWebDirectParams: TDataSource;
    tblWebDriectParamsID: TBCDField;
    tblWebDriectParamsUD_CART_MESSAGE: TStringField;
    lblUDCartMessage: TUniLabel;
    tblWebDriectParamsRELEASES_REQD: TStringField;
    wwCheckBox1: TUniDBCheckBox;
    grpCustomerSet: TUniGroupBox;
    GroupBox1: TUniGroupBox;
    lblVendUD: TUniLabel;
    DBEdit1: TUniDBEdit;
    tblWebDriectParamsUD_LOGIN_MESSAGE: TStringField;
    dbchkEnforeSellingMult: TUniDBCheckBox;
    tblWebDriectParamsENFORCE_SELLMULTIPLES_OF: TStringField;
    tblWebDriectParamsUD_FREIGHT_MESSAGE: TStringField;
    lblOverrideFreightMsg: TUniLabel;
    dbeChkOutFreightMsg: TUniDBEdit;
    grpEmpPortalSettings: TUniGroupBox;
    Label1: TUniLabel;
    dbeEmpAutoShutTime: TUniDBEdit;
    tblWebDriectParamsEMP_AUTO_SHUT_TIME: TBCDField;
    tblWebDriectParamsWATERFALL_BREAKS_HIDDEN: TStringField;
    tblWebDriectParamsWATERFALL_MIN_LT_MULT: TStringField;
    tblWebDriectParamsWATERFALL_ALWAYS_SHOW_MULT: TStringField;
    dbeChkWaterfallBreaksHidden: TUniDBCheckBox;
    dbeChkWaterfallMinLtMult: TUniDBCheckBox;
    dbeChkWaterfallMaxBreakLtMin: TUniDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure tblWebDriectParamsBeforePost(DataSet: TDataSet);
    procedure bbtnOKClick(Sender: TObject);
    procedure bbtnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure dbeChkWaterfallBreaksHiddenClick(Sender: TObject);
  private
    procedure SetControls;
    { Private declarations }
  public
    { Public declarations }
    class procedure DoWebDirectSettings;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm,
  iqsys_rscstr;

class procedure TFrmWebDirectSettings.DoWebDirectSettings;
begin
  with self.Create(UniGUIApplication.UniApplication) do
    ShowModal;
end;

procedure TFrmWebDirectSettings.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
end;

procedure TFrmWebDirectSettings.FormCreate(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  if tblWebDriectParams.RecordCount = 0 then
    tblWebDriectParams.Insert;
  IQRegFormRead( self, [self]);
end;

procedure TFrmWebDirectSettings.FormShow(Sender: TObject);
begin
  with dbeEmpAutoShutTime do begin
    Hint:=
       iqsys_rscstr.cTXT0000131; (* 'This will ensure all users are logged out of the Employee portal after the
                                     specified number of seconds (minimum 60). This will override the user''s Auto Shut Off
                                     time if it is lower.'; *)
    ShowHint:= True;
  end;
  SetControls;
end;

procedure TFrmWebDirectSettings.SetControls;
begin
  dbeChkWaterfallMinLtMult.Enabled := dbeChkWaterfallBreaksHidden.Checked;
  dbeChkWaterfallMaxBreakLtMin.Enabled := dbeChkWaterfallBreaksHidden.Checked;
end;

procedure TFrmWebDirectSettings.tblWebDriectParamsBeforePost(
  DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet );

  if ( ( tblWebDriectParamsEMP_AUTO_SHUT_TIME.asFloat < 60 ) and
       ( tblWebDriectParamsEMP_AUTO_SHUT_TIME.asFloat <> 0 ) )
  then
    //'Invalid Employee Portal auto logout time specified. .  The entered value must be zero (unlimited) or greater than or equal to 60.';
    raise Exception.Create(cTXT0000130);

end;

procedure TFrmWebDirectSettings.bbtnOKClick(Sender: TObject);
begin
  if (tblWebDriectParams.State in [dsEdit, dsInsert]) then
     tblWebDriectParams.Post;
end;

procedure TFrmWebDirectSettings.dbeChkWaterfallBreaksHiddenClick(
  Sender: TObject);
begin
  if (tblWebDriectParams.State in [dsEdit, dsInsert]) then
    if (not dbeChkWaterfallBreaksHidden.Checked) then
    begin
      tblWebDriectParamsWATERFALL_MIN_LT_MULT.AsString := 'N';
      tblWebDriectParamsWATERFALL_ALWAYS_SHOW_MULT.AsString := 'N';
    end;

  SetControls;
end;

procedure TFrmWebDirectSettings.bbtnCancelClick(Sender: TObject);
begin
  if (tblWebDriectParams.State in [dsEdit, dsInsert]) then
     if IQWarningYN(iqsys_rscstr.cTXT0000010 {'Save changes before exit?'}) then
       begin
         tblWebDriectParams.CheckBrowseMode;
       end
     else
       begin
         if (tblWebDriectParams.State in [dsEdit, dsInsert]) then
            tblWebDriectParams.Cancel;
       end;
  Close;
end;

end.
