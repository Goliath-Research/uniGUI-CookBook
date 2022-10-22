unit pra_params;

{ ** History **

  04/17/2009
    Added this unit to PRA project.  Copied form from ..\Prod\ProdAdd.pas,
    and modified what displayed.  Randy requested that only "decimal" option
    be visible.

}

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.Wwdatsrc,
  Mask,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniEdit, uniDBEdit, Vcl.Controls;

type
  TFrmPRAParams = class(TUniForm)
    wwDataSource1: TDataSource;
    wwTable1: TFDTable;
    PnlMain: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    Label2: TUniLabel;
    wwDBSpinEdit1: TUniDBNumberEdit;
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    wwTable1PROD_REP_DECIMAL: TBCDField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoPRAParams;


implementation

{$R *.DFM}

uses
  IQMS.Common.RegFrm,
  IQMS.Common.Dialogs,
  IQMS.Common.HelpHook,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.DataLib;

procedure DoPRAParams;
begin
  with TFrmPRAParams.Create(UniGUIApplication.UniApplication) do
  begin
    ShowModal;
  end;
end;

procedure TFrmPRAParams.FormCreate(Sender: TObject);
begin
  IQRegFormRead(self, [ self ]);
  Reopen( wwTable1 );
end;

procedure TFrmPRAParams.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmPROD_REP{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmPRAParams.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= caFree;
  IQRegFormWrite(self, [ self ]);
end;

procedure TFrmPRAParams.btnOKClick(Sender: TObject);
var
  APrecision: Real;
begin
  APrecision:= SelectValueAsFloat('select prod_rep_decimal from params');
  if wwTable1.FieldByName('PROD_REP_DECIMAL').asInteger < 6 then
     IQConfirm('Reducing the decimal precision of the inventory usage calculations could '+
               'cause rounding variances in post inventory transactions ');
  wwTable1.CheckBrowseMode;

  if (APrecision <> wwTable1.FieldByName('PROD_REP_DECIMAL').asFloat) then
     ExecuteCommandFmt('insert into eventlog( event_time, userid, text, class ) values (sysdate, ''%s'', ''%s'', ''PROD REP'')',
                [ SecurityManager.UserName,
                Format('Production reporting decimal precision has been altered from %.0f to %0.f',  [ APrecision, wwTable1.FieldByName('PROD_REP_DECIMAL').asFloat ])]);
  Close;
end;

end.
