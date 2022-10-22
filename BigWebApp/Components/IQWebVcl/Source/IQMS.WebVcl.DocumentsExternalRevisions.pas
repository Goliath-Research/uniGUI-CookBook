unit IQMS.WebVcl.DocumentsExternalRevisions;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Data.DB,
//  Vcl.Wwdatsrc,
  Vcl.Menus,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,UniDBGrid,
  uniMainMenu, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQUniGrid, uniGUIFrame, Vcl.Controls;

type
  TFrmIQExtDocRevisions = class(TUniForm)
    wwQryDocRev: TFDQuery;
    wwQryDocRevID: TBCDField;
    wwQryDocRevEXTERNAL_DOC_ID: TBCDField;
    wwQryDocRevFILENAME: TStringField;
    wwQryDocRevREVISION: TStringField;
    wwQryDocRevEFFECT_DATE: TDateTimeField;
    wwQryDocRevDEACTIVE_DATE: TDateTimeField;
    wwQryDocRevDOC_REPOSITORY_ID: TBCDField;
    wwSrcDocRev: TDataSource;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    DBNavigator1: TUniDBNavigator;
    wwDBGrid1: TIQUniGridControl;
    pnlDateOfInterest: TUniPanel;
    Shape1: TUniPanel;
    PopupMenu1: TUniPopupMenu;
    Execute1: TUniMenuItem;
    Print1: TUniMenuItem;
    wwQryDocRevSTATE: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wwQryDocRevBeforeOpen(DataSet: TDataSet);
    procedure Execute1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure wwDBGrid1DBGridDrawColumnCell(Sender: TObject; ACol,
      ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
  private
    { Private declarations }
    FExternal_Doc_ID: Real;
    FDateOfInterest: TDateTime;
    FClosestToDateOfInterest: TdateTime;
    procedure ExecuteDocumentRevision(ADoc_Revision_ID: Real; AVerb: string);
    function FindClosestToDateOfInterest(ADateOfInterest: TDateTime): TDateTime;
  public
    { Public declarations }
    constructor Create(AExternal_Doc_ID: Real; ADateOfInterest: TDateTime );
    class procedure DoShowModal(AExternal_Doc_ID: Real; ADateOfInterest: TDateTime = 0);
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous,
  IQMS.WebVcl.DocumentsExternal;

{ TFrmIQExtDocReleases }

class procedure TFrmIQExtDocRevisions.DoShowModal(AExternal_Doc_ID: Real; ADateOfInterest: TDateTime = 0);
begin
  with self.Create( AExternal_Doc_ID, ADateOfInterest ) do
  begin
    ShowModal;
  end;
end;

constructor TFrmIQExtDocRevisions.Create(AExternal_Doc_ID: Real; ADateOfInterest: TDateTime );
begin
  FExternal_Doc_ID:= AExternal_Doc_ID;
  FDateOfInterest := ADateOfInterest;
  FClosestToDateOfInterest:= FindClosestToDateOfInterest( FDateOfInterest );

  inherited Create( uniGUIApplication.UniApplication );

  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self, wwDBGrid1 ]);

  Caption:= Format('%s Revisions', [ SelectValueByID('descrip', 'external_doc', FExternal_Doc_ID) ]);
  pnlDateOfInterest.Visible:= FDateOfInterest > 0;
end;

procedure TFrmIQExtDocRevisions.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBGrid1 ]);
end;

procedure TFrmIQExtDocRevisions.wwDBGrid1DBGridDrawColumnCell(Sender: TObject;
  ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  if (FClosestToDateOfInterest > 0) and ( wwQryDocRevEFFECT_DATE.asDateTime = FClosestToDateOfInterest ) then
     Attribs.Font.Color:= clBlue;
end;

procedure TFrmIQExtDocRevisions.wwQryDocRevBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'id', FExternal_Doc_ID);
end;

procedure TFrmIQExtDocRevisions.Execute1Click(Sender: TObject);
begin
  ExecuteDocumentRevision( wwQryDocRevID.asFloat, 'open' );
end;

procedure TFrmIQExtDocRevisions.Print1Click(Sender: TObject);
begin
  ExecuteDocumentRevision( wwQryDocRevID.asFloat, 'print' );
end;

procedure TFrmIQExtDocRevisions.ExecuteDocumentRevision( ADoc_Revision_ID: Real; AVerb: string );
begin
  if (ADoc_Revision_ID > 0) and (Owner is TIQWebExtDoc) then
     TIQWebExtDoc(Owner).ExecuteDocumentRevision( FExternal_Doc_ID, ADoc_Revision_ID, AVerb );

end;

function TFrmIQExtDocRevisions.FindClosestToDateOfInterest( ADateOfInterest: TDateTime ): TDateTime;
begin
  if ADateOfInterest = 0 then
     EXIT (0);

  Result := SelectValueFmt('select effect_date                                                                                         '+
                    '  from doc_revision                                                                                        '+
                    ' where external_doc_id = %f                                                                                '+
                    '   and trunc(effect_date) <= to_date(''%s'', ''mm/dd/yyyy'')                                               '+
                    '   and (hist = ''Y''                                                                                       '+
                    '        or                                                                                                 '+
                    '        nvl(hist,''N'') = ''N'' and ''RELEASED'' = (select upper(status) from external_doc where id = %f)) '+
                    '  order by effect_date desc                                                                                ',
                    [ FExternal_Doc_ID,
                      FormatDateTime('mm/dd/yyyy', ADateOfInterest),
                      FExternal_Doc_ID ]);
end;


end.
