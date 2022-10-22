unit UD_DM;

interface

uses
  SysUtils, Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Comp.UI, FireDAC.Phys.Oracle;

type
  TUD_DataModule = class(TDataModule)
    FDPhysOracleDriverLink1: TFDPhysOracleDriverLink;
    FDConnection1: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    tblUD_Tables: TFDTable;
    tblUD_TablesID: TBCDField;
    tblUD_TablesTABLE_NAME: TStringField;
    tblUD_TablesFORM_CAPTION: TStringField;
    tblUD_TablesMENU_CAPTION: TStringField;
    tblUD_TablesSOURCE_ATTRIBUTE: TStringField;
    tblUD_TablesSOURCE: TStringField;
    tblUD_TablesIS_NATIVE: TStringField;
    tblUD_TablesAPP_NAME: TStringField;
    tblUD_TablesOWNER_NAME: TStringField;
    tblUD_Cols: TFDTable;
    tblUD_ColsID: TBCDField;
    tblUD_ColsUD_TABLES_ID: TBCDField;
    tblUD_ColsCOL_NAME: TStringField;
    tblUD_ColsCOL_LABEL: TStringField;
    tblUD_ColsCOL_TYPE: TStringField;
    tblUD_ColsSEQ: TBCDField;
    tblUD_ColsUSE_COMPONENT: TStringField;
    tblUD_ColsTAB_NAME: TStringField;
    tblUD_ColsCOL_KIND: TStringField;
    tblUD_ColsSQL_TEXT: TStringField;
    tblUD_ColsUD_GROUPBOX_ID: TBCDField;
    tblUD_ColsGROUPBOX_SEQ: TBCDField;
    tblUD_ColsLINKED_COL_NAME: TStringField;
    tblUD_ColsUD_COLS_PARENT_ID: TBCDField;
    tblUD_ColsPKLIST_FIELD_NAME: TStringField;
    tblUD_Tabs: TFDTable;
    tblUD_TabsID: TBCDField;
    tblUD_TabsUD_TABLES_ID: TBCDField;
    tblUD_TabsNAME: TStringField;
    tblUD_TabsCAPTION: TStringField;
    tblUD_TabsSEQ: TBCDField;
    tblUD_Groups: TFDTable;
    tblUD_GroupsID: TBCDField;
    tblUD_GroupsUD_TABSHEET_ID: TBCDField;
    tblUD_GroupsNAME: TStringField;
    tblUD_GroupsCAPTION: TStringField;
    tblUD_GroupsROW_NUM: TBCDField;
    tblUD_GroupsCOL_NUM: TBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}


end.
