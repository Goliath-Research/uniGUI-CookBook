unit IQMS.Common.InvalidObjectsWarning;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.WebVcl.Search,
  Data.DB,
  IQMS.WebVcl.CaptionPanel,
  FireDAC.Comp.Client,
  FireDAC.Phys,
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
  Vcl.Controls,
  Vcl.Graphics,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniStatusBar,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel, IQUniGrid, uniGUIFrame, Vcl.ExtCtrls;

type
  TFrmInvalidObjectWarning = class(TUniForm)
    pnlWarning: TUniPanel;
    CaptionPanel1: TIQWebCaptionPanel;
    btnDetails: TUniButton;
    btnOK: TUniButton;
    pnlDetails: TUniPanel;
    Label1: TUniLabel;
    DataSource1: TDataSource;
    Query1: TFDQuery;
    Query1OBJECT_NAME: TStringField;
    Query1OBJECT_TYPE: TStringField;
    IQSearch1: TIQUniGridControl;
    Bevel2: TUniPanel;
    Query1ORIGIN: TStringField;
    Query1STATUS: TStringField;
    Panel1: TUniPanel;
    btnResolveDependency: TUniButton;
    StatusBar1: TUniStatusBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnDetailsClick(Sender: TObject);
    procedure btnResolveDependencyClick(Sender: TObject);
  private
    FPanelDetailsHeight: Integer;
    procedure AdjustFormHeight;
    procedure CompileObjects;
    procedure ValidateEnableConstraints( ASelectText, AMessageText, AAlterText: string);
  public
    class procedure DoShow;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;

{ TFrmInvalidObjectWarning }

class procedure TFrmInvalidObjectWarning.DoShow;
begin
  if SelectValueAsFloat('select count(*) '+
            '  from ( select 1 from all_objects where owner = ''IQMS''                                                            '+
            '            and object_type in ( ''PROCEDURE'', ''FUNCTION'', ''VIEW'', ''PACKAGE'', ''PACKAGE BODY'', ''TRIGGER'' ) '+
            '            and status = ''INVALID'' and rownum < 2                                                                  '+
            '          UNION ALL                                                                                                  '+
            '         select 1 from user_constraints where status = ''DISABLED'' and rownum < 2                                   '+
            '          UNION ALL                                                                                                  '+
            '         select 1 from user_constraints where validated = ''NOT VALIDATED'' and constraint_type <> ''V'' and rownum < 2)' ) = 0 then
     EXIT;

  self.Create(uniGUIApplication.UniApplication).Show;
end;

procedure TFrmInvalidObjectWarning.FormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self ]);
  IQSetTablesActiveEx(TRUE, self, '' {Default Msg}); // iqlib

  FPanelDetailsHeight:= pnlDetails.Height;
  AdjustFormHeight;
end;

procedure TFrmInvalidObjectWarning.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmInvalidObjectWarning.btnOKClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmInvalidObjectWarning.btnDetailsClick(Sender: TObject);
begin
  if pnlDetails.Visible then
     FPanelDetailsHeight:= pnlDetails.Height;

  pnlDetails.Visible:= not pnlDetails.Visible;
  AdjustFormHeight;
end;

procedure TFrmInvalidObjectWarning.AdjustFormHeight;
begin
  if not pnlDetails.Visible then
     self.ClientHeight:= pnlWarning.Height
  else
     self.ClientHeight:= pnlWarning.Height + FPanelDetailsHeight;
end;

procedure TFrmInvalidObjectWarning.btnResolveDependencyClick(Sender: TObject);
begin
  CompileObjects;
  ValidateEnableConstraints( 'select constraint_name, table_name from user_constraints where validated = ''NOT VALIDATED'' and constraint_type <> ''V''',
                             'Validating %s',
                             'alter table %s enable validate constraint %s' );

  ValidateEnableConstraints( 'select constraint_name, table_name from user_constraints where status = ''DISABLED''',
                             'Enabling %s',
                             'alter table %s enable constraint %s' );
end;

procedure TFrmInvalidObjectWarning.CompileObjects;
var
  AQry1, AQry2    :TFDQuery;
  APrevCount      :Integer;
  AUnableToResolve:Boolean;
  S               : string;
begin
  try
    AQry1:= TFDQuery.Create(self);
    AQry1.ConnectionName := 'IQFD';
    AQry1.SQL.Add(       'select object_name, object_type' );
    AQry1.SQL.Add(       '  from  all_objects' );
    AQry1.SQL.Add(Format(' where owner = ''%s'' ', [ 'IQMS' ]));
    AQry1.SQL.Add(       '   and object_type in ( ''PROCEDURE'', ''FUNCTION'', ''VIEW'', ''PACKAGE'', ''PACKAGE BODY'', ''TRIGGER'' )' );
    AQry1.SQL.Add(       '   and status = ''INVALID'' ');

    AQry2:= TFDQuery.Create(self);
    AQry2.ConnectionName := 'IQFD';

    APrevCount:= 0;
    AUnableToResolve:= FALSE;

    repeat
      Application.ProcessMessages;
      Reopen(AQry1);

      while not AQry1.Eof do
      begin
        AQry2.Close;
        AQry2.SQL.Clear;

        StatusBar1.Panels[0].Text:= Format('Compiling %s', [ AQry1.FieldByName('object_name').asString ]);
        Application.ProcessMessages;

        if AQry1.FieldByName('object_type').asString = 'PACKAGE BODY' then
           AQry2.SQL.Add( Format('alter package %s compile body', [ AQry1.FieldByName('object_name').asString ] ))
        else
           AQry2.SQL.Add( Format('alter %s %s compile', [ AQry1.FieldByName('object_type').asString, AQry1.FieldByName('object_name').asString ] ));

        AQry2.ExecSQL;

        AQry1.Next;
      end;

      if (APrevCount > 0) and ( APrevCount = AQry1.RecordCount ) then
         AUnableToResolve:= TRUE;

      APrevCount:= AQry1.RecordCount;
    until (AQry1.RecordCount = 0) or (AUnableToResolve);

    StatusBar1.Panels[0].Text:= '';

    if AUnableToResolve then
       raise Exception.Create('Unable to resolve dependencies.');

  finally
    Reopen(Query1);
    AQry1.Free;
    AQry2.Free;
  end;
end;


procedure TFrmInvalidObjectWarning.ValidateEnableConstraints( ASelectText, AMessageText, AAlterText: string);
var
  AQry1, AQry2    :TFDQuery;
begin
  try
    AQry1:= TFDQuery.Create(self);
    AQry1.ConnectionName := 'IQFD';
    AQry1.SQL.Add( ASelectText );
    Reopen(AQry1);

    AQry2:= TFDQuery.Create(self);
    AQry2.ConnectionName := 'IQFD';

    while not AQry1.Eof do
    begin
      Application.ProcessMessages;
      AQry2.Close;
      AQry2.SQL.Clear;

      StatusBar1.Panels[0].Text:= Format( AMessageText, [ AQry1.FieldByName('constraint_name').asString ]);
      Application.ProcessMessages;

      AQry2.SQL.Add( Format( AAlterText, [ AQry1.FieldByName('table_name').asString, AQry1.FieldByName('constraint_name').asString ]));
      AQry2.ExecSQL;

      AQry1.Next;
    end;

    StatusBar1.Panels[0].Text:= '';

  finally
    Reopen(Query1);
    AQry1.Free;
    AQry2.Free;
  end;
end;


end.

