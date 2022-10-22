unit pm_classfilter;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  Vcl.Buttons,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication, IQUniGrid, uniGUIFrame;

type
  { TFrmPMClassFilter }
  TFrmPMClassFilter = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
    SrcClassList: TDataSource;
    QryClassList: TFDQuery;
    QryClassListID: TBCDField;
    QryClassListCLASS: TStringField;
    QryClassListDESCRIP: TStringField;
    Grid: TIQUniGridControl;
    btnNone: TUniBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNoneClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
    FClass: String; // set by buttons
  public
    { Public declarations }
  end;

  function SetPMClassFilter(var AClass: String): Boolean;
  function SelectPMClass(var AClass: String): Boolean;

  procedure ApplyClassFilter(const ADataSet: TDataSet);

//var
//  FrmPMClassFilter: TFrmPMClassFilter;

implementation

{$R *.dfm}

uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  pm_settings,
  pm_rscstr;

function SetPMClassFilter(var AClass: String): Boolean;
var
  LFrmPMClassFilter : TFrmPMClassFilter;
begin
  LFrmPMClassFilter := TFrmPMClassFilter.Create(UniGUIApplication.UniApplication);
  LFrmPMClassFilter.QryClassList.Locate('CLASS', AClass, []);
  Result := LFrmPMClassFilter.ShowModal = mrOk;
  if Result then
    AClass := LFrmPMClassFilter.FClass;
end;

function SelectPMClass(var AClass: String): Boolean;
var
  LFrmPMClassFilter : TFrmPMClassFilter;
begin
  LFrmPMClassFilter := TFrmPMClassFilter.Create(UniGUIApplication.UniApplication);
   LFrmPMClassFilter.btnNone.Visible := FALSE;
   LFrmPMClassFilter.btnOk.Caption := pm_rscstr.cTXT0000199; // 'Select'
   LFrmPMClassFilter.QryClassList.Locate('CLASS', AClass, []);
   Result := LFrmPMClassFilter.ShowModal = mrOk;
   if Result then
      AClass := LFrmPMClassFilter.FClass;
end;

procedure ApplyClassFilter(const ADataSet: TDataSet);
begin
  // Checks ...
  if (ADataSet = NIL) then Exit;
  CheckIQPMSettingsCreated;

  // Apply filtering
  with ADataSet do
   try
     DisableControls;
     Filter := '';
     IQAssignEPlantFilter(ADataSet); // IQLib

     if IQPMSettings.ClassFilter = '' then Exit;

     if Trim(Filter) > '' then
        Filter := Format( '%s AND CLASS = ''%s''', [Filter, IQPMSettings.ClassFilter] )
     else
        Filter   := Format( 'CLASS = ''%s''', [IQPMSettings.ClassFilter] );

     Filtered := (Trim(Filter) > ''); // iqstring

   finally
     EnableControls;
   end;
end;

{ TFrmPMClassFilter }

procedure TFrmPMClassFilter.FormCreate(Sender: TObject);
begin
  ReOpen(QryClassList);
{ TODO -oGPatil -cWebConvert : Incompatible types: 'TForm' and 'TFrmPMClassFilter'
  CenterForm(Self); // IQMS.Common.Controls.pas  }
  IQRegFormRead(Self, [Self, Grid]); //IQMS.Common.RegFrm.pas
end;

procedure TFrmPMClassFilter.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(Self, [Self, Grid]);
end;

procedure TFrmPMClassFilter.btnNoneClick(Sender: TObject);
begin
  FClass := '';
end;

procedure TFrmPMClassFilter.btnOkClick(Sender: TObject);
begin
  FClass := QryClassListCLASS.AsString;
  ModalResult := mrOk; // for calls from other controls
end;

end.
