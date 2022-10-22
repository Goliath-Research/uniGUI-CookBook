unit IQCore.DM;

interface

uses
  System.SysUtils, System.Classes, System.Actions, Vcl.ActnList, Vcl.Menus,
  Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  MainModule;

type
  TIQCore_DM = class(TDataModule)
    MainMenu1: TMainMenu;
    IQPickTreeNode: TFDTable;
    IQPickTreeNodeID: TBCDField;
    IQPickTreeNodeTEXT: TStringField;
    QryPickTreeNodes: TFDQuery;
    QryPickTreeNodesID: TBCDField;
    QryPickTreeNodesTEXT: TStringField;
    QryPickTreeNodesLEVEL: TFMTBCDField;
    IQPickTree: TFDTable;
    IQPickTreeID: TBCDField;
    IQPickTreeNAME: TStringField;
    IQPickTreeLEVELS: TBCDField;
    IQField: TFDTable;
    IQPickList: TFDTable;
    IQPickListID: TBCDField;
    IQPickListNAME: TStringField;
    IQPickListItem: TFDTable;
    IQPickListItemID: TBCDField;
    IQPickListItemTEXT: TStringField;
    IQPickListItemSEQ: TBCDField;
    IQPickListItemPICKLIST_ID: TBCDField;
    IQPickTreeNodeSEQ: TBCDField;
    IQDataSet: TFDTable;
    IQDataSetID: TBCDField;
    IQDataSetNAME: TStringField;
    dsIQDataSet: TDataSource;
    IQDataSetMASTERDATASET_ID: TBCDField;
    IQDataSetKEYFIELD_ID: TBCDField;
    IQDataSetDETAILFIELD_ID: TBCDField;
    IQPickTreeNodePARENT_ID: TBCDField;
    IQDataSetTABLENAME: TStringField;
    IQDataSetSQLQUERY: TStringField;
    IQDataSetDATAMODULE_ID: TBCDField;
    IQDataModule: TFDTable;
    IQDataModuleID: TBCDField;
    IQDataModuleNAME: TStringField;
    IQPickDataSet: TFDTable;
    IQPickDataSetID: TBCDField;
    IQPickDataSetNAME: TStringField;
    IQForm: TFDTable;
    IQFormID: TBCDField;
    IQFormNAME: TStringField;
    IQFormPARENT_ID: TBCDField;
    IQFormDesign: TFDTable;
    dsIQPickList: TDataSource;
    QryPickListItem: TFDQuery;
    QryPickListItemID: TBCDField;
    QryPickListItemTEXT: TStringField;
    QryPickListItemSEQ: TBCDField;
    QryPickListItemPICKLIST_ID: TBCDField;
    QryPickListItems: TFDQuery;
    QryPickListItemsID: TBCDField;
    QryPickListItemsTEXT: TStringField;
    QryPickListItemsSEQ: TBCDField;
    IQPickLists: TFDQuery;
    IQPickListsID: TBCDField;
    IQPickListsNAME: TStringField;
    IQPickListsROWID: TStringField;
    dsPickLists: TDataSource;
    IQPickTrees: TFDQuery;
    IQModule: TFDTable;
    BCDField2: TBCDField;
    StringField3: TStringField;
    IQDataModuleMODULE_ID: TBCDField;
    IQFormMODULE_ID: TBCDField;
    IQFieldID: TBCDField;
    IQFieldNAME: TStringField;
    IQFieldDISPLAYLABEL: TStringField;
    IQFieldDISPLAYWIDTH: TBCDField;
    IQFieldFIELDSIZE: TBCDField;
    IQFieldPRECISION: TBCDField;
    IQFieldFIXEDCHAR: TStringField;
    IQFieldDATATYPE: TBCDField;
    IQFieldFIELDTYPE: TBCDField;
    IQFieldFIELDTYPEID: TBCDField;
    IQFieldEDITOR_ID: TBCDField;
    IQFieldDATASET_ID: TBCDField;
    IQPickTreePICKTREENODE_ID: TBCDField;
    IQPickDataSetDATASET_ID: TBCDField;
    IQPickDataSetLISTFIELD_ID: TBCDField;
    IQPickTreesID: TBCDField;
    IQPickTreesNAME: TStringField;
    IQPickTreesLEVELS: TBCDField;
    IQPickTreesPICKTREENODE_ID: TBCDField;
    IQPickTreesROWID: TStringField;
    IQFormDesignID: TBCDField;
    IQFormDesignNAME: TStringField;
    IQFormDesignFORM_ID: TBCDField;
    IQFormDesignDFM: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function IQCore_DM: TIQCore_DM;

implementation

uses
  UniGUIVars, uniGUIMainModule;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function IQCore_DM: TIQCore_DM;
begin
  Result := TIQCore_DM(UniMainModule.GetModuleInstance(TIQCore_DM));
end;

initialization
  RegisterModuleClass(TIQCore_DM);

end.
