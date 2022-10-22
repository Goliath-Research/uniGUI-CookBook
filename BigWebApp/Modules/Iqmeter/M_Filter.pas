unit M_Filter;

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
  ExtCtrls,
  StdCtrls,
  ComCtrls,
  M_Type,
  Db,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel,
  uniPageControl, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniComboBox, uniDBComboBox;

type
  TFrmM_Filter = class(TUniForm)
    Panel1: TUniPanel;
    PageControl1: TUniPageControl;
    tabOverall: TUniTabSheet;
    Label6: TUniLabel;
    lookupMfgTypeOverAll: TUniDBLookupComboBox;
    tabEPlant: TUniTabSheet;
    Label9: TUniLabel;
    lookupEPlant: TUniDBLookupComboBox;
    tabMfgCell: TUniTabSheet;
    tabWorkCenter: TUniTabSheet;
    Bevel1: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    lookupMfgCell: TUniDBLookupComboBox;
    Label3: TUniLabel;
    lookupWorkCenter: TUniDBLookupComboBox;
    QryMfgType: TFDQuery;
    QryMfgTypeMFGTYPE: TStringField;
    QryMfgTypeDESCRIP: TStringField;
    lookupMfgTypeEPlant: TUniDBLookupComboBox;
    QryMfgCell: TFDQuery;
    QryMfgCellMFGCELL: TStringField;
    QryMfgCellDESCRIP: TStringField;
    QryMfgCellMFGTYPE: TStringField;
    QryWorkCenter: TFDQuery;
    QryWorkCenterID: TBCDField;
    QryWorkCenterEQNO: TStringField;
    QryWorkCenterCNTR_TYPE: TStringField;
    QryWorkCenterMFGCELL: TStringField;
    QryWorkCenterMFG_TYPE: TStringField;
    QryWorkCenterEPLANT_ID: TBCDField;
    QryEPlant: TFDQuery;
    QryEPlantID: TBCDField;
    QryEPlantNAME: TStringField;
    QryMfgCellEPLANT_ID: TBCDField;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FFilter: TMeterFilter;
    procedure InitVars;
    procedure SetFilter(const Value: TMeterFilter);
  public
    { Public declarations }
    class function DoShowModal( var AFilter: TMeterFilter ): Boolean;
    property Filter: TMeterFilter write SetFilter;
  end;


implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous;

class function TFrmM_Filter.DoShowModal( var AFilter: TMeterFilter ): Boolean;
Var
  LFrmM_Filter : TFrmM_Filter;
begin
    LFrmM_Filter := TFrmM_Filter.create(UniGUIApplication.UniApplication);
  with LFrmM_Filter do
  begin
    Result:= ShowModal = mrOK;
    if Result then
    begin
      AFilter.Mode          := FFilter.Mode;
      AFilter.MfgType       := FFilter.MfgType;
      AFilter.MfgCell       := FFilter.MfgCell;
      AFilter.EPlant_ID     := FFilter.EPlant_ID;
      AFilter.Work_Center_ID:= FFilter.Work_Center_ID;
    end;
  end;
end;

procedure TFrmM_Filter.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self ]);
  Action:= caFree;
end;


procedure TFrmM_Filter.InitVars;
begin
  case FFilter.Mode of
    mfOvervall:
      begin
      { TODO -ohphadke :
        Dependency :
        LookupValue unknown }
        //lookupMfgTypeOverAll.LookupValue:= FFilter.MfgType;
        //lookupMfgTypeOverAll.PerformSearch;
        QryMfgType.Locate('mfgtype', FFilter.MfgType, []);
        FFilter.MfgCell       := '';
        FFilter.EPlant_ID     := 0;
        FFilter.Work_Center_ID:= 0;
      end;
    mfEPlant:
      begin
        //lookupMfgTypeEPlant.LookupValue:= FFilter.MfgType;
        //lookupMfgTypeEPlant.PerformSearch;
        QryMfgType.Locate('mfgtype', FFilter.MfgType, []);

        //lookupEPlant.LookupValue:= SelectValueByID('name', 'eplant', FFilter.EPlant_ID );
        //lookupEPlant.PerformSearch;
        QryEPlant.Locate('id', FFilter.EPlant_ID, []);

        FFilter.MfgCell       := '';
        FFilter.Work_Center_ID:= 0;
      end;
    mfMfgCell:
      begin
        //lookupMfgCell.LookupValue:= FFilter.MfgCell;
        //lookupMfgTypeEPlant.PerformSearch;
        QryMfgCell.Locate('mfgcell', FFilter.MfgCell, []);

        FFilter.MfgType       := '';
        FFilter.EPlant_ID     := 0;
        FFilter.Work_Center_ID:= 0;
      end;
    mfWorkCenter:
      begin
        //lookupWorkCenter.LookupValue:= SelectValueByID('eqno', 'work_center', FFilter.work_center_id );
        //lookupWorkCenter.PerformSearch;
        QryWorkCenter.Locate('id', FFilter.work_center_id , []);
        FFilter.MfgType       := '';
        FFilter.MfgCell       := '';
        FFilter.EPlant_ID     := 0;
      end;
  end;
end;

procedure TFrmM_Filter.SetFilter(const Value: TMeterFilter);
begin
  FFilter := Value;
end;

procedure TFrmM_Filter.UniFormCreate(Sender: TObject);
begin

  IQSetTablesActive(TRUE, self);
  IQRegFormRead(self, [ self ]);
  PageControl1.ActivePageIndex:= Ord( FFilter.Mode );
  InitVars;
end;

procedure TFrmM_Filter.btnOKClick(Sender: TObject);
begin
  FFilter.Mode:= TMeterFilterMode( PageControl1.ActivePageIndex );

  case FFilter.Mode of
    mfOvervall:
      begin
//        IQAssert( lookupMfgTypeOverAll.LookupValue > '', 'MfgType must be specified' );
//        FFilter.MfgType:= lookupMfgTypeOverAll.LookupValue ;
      end;
    mfEPlant:
      begin
//        IQAssert( lookupMfgTypeEPlant.LookupValue > '', 'MfgType must be specified' );
//        FFilter.MfgType:= lookupMfgTypeEPlant.LookupValue ;

//        IQAssert( lookupEPlant.LookupValue > '', 'EPlant must be specified' );
//        FFilter.EPlant_ID:= QryEPlantID.asFloat;
      end;
    mfMfgCell:
      begin
//        IQAssert( lookupMfgCell.LookupValue > '', 'MfgCell must be specified' );
//        FFilter.MfgCell:= lookupMfgCell.LookupValue;
      end;
    mfWorkCenter:
      begin
//        IQAssert( lookupWorkCenter.LookupValue > '', 'WorkCenter must be specified' );
//        FFilter.work_center_id:= QryWorkCenterID.asFloat;
      end;
  end;

  ModalResult:= mrOK;
end;



end.
