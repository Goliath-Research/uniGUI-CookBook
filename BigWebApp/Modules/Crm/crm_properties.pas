unit crm_properties;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.wwDataInspector,
  Vcl.Wwdatsrc,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPageControl,
  uniMemo,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniStatusBar,
  Vcl.Grids;

const // How to display
  DISPLAY_BY_DATASET = 0; // Just show the data in the dataset
  DISPLAY_BY_TAG = 1; // Show only fields that have a Tag value greater than 0
  DISPLAY_BY_VISIBLE = 2; // Only show fields that are visible

type
  TFrmCRMProperties = class(TUniForm)
    pcMain: TUniPageControl;
    TabGeneral: TUniTabSheet;
    TabComment: TUniTabSheet;
    StatusBar: TUniStatusBar;
    Panel1: TUniPanel;
    DataInspector: TwwDataInspector;
    PnlComment: TUniPanel;
    memComment: TUniMemo;
  private
    { Private declarations }
  public
    { Public declarations }
//    constructor Create(AOwner: TComponent; ADataSource: TDataSource;
//      AComment: String;
//      ACaption: String; AReadOnly: Boolean; AHowToDisplay: Integer);
    // for AHowToDisplay, see constants above
    procedure SetStatus(S: String);
  end;

//procedure DoProperties(AOwner: TComponent; ADataSource: TDataSource;
//  AComment: String = ''; AReadOnly: Boolean = TRUE;
//  AHowToDisplay: Integer = DISPLAY_BY_DATASET;
//  ACaption: String = '');

implementation

{$R *.DFM}

{ TFrmCRMProperties }
{
procedure DoProperties(AOwner: TComponent; ADataSource: TDataSource;
  AComment: String = ''; AReadOnly: Boolean = TRUE;
  AHowToDisplay: Integer = DISPLAY_BY_DATASET;
  ACaption: String = '');
begin
  with TFrmCRMProperties.Create(AOwner, ADataSource, AComment, ACaption,
    AReadOnly, AHowToDisplay) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

constructor TFrmCRMProperties.Create(AOwner: TComponent;
  ADataSource: TDataSource; AComment, ACaption: String; AReadOnly: Boolean;
  AHowToDisplay: Integer);
var
  i: Integer;
begin
  // Check for possible error conditions
  if ADataSource.DataSet = NIL then
    raise Exception.Create('DataSet property for the DataSource is NIL.');
  // Create the form
  inherited Create(AOwner);
  // Update the controls
  if Trim(ACaption) > '' then
    Caption := ACaption;

  // Read only
  DataInspector.ReadOnly := AReadOnly;
  // Open the dataset
  if not ADataSource.DataSet.Active then
    ADataSource.DataSet.Open;

  case AHowToDisplay of
    DISPLAY_BY_DATASET: // Just assign the dataset as provided
      begin
        DataInspector.DataSource := ADataSource;
      end;
    DISPLAY_BY_TAG: // Only show items that have a Tag value greater than 0
      begin
        for i := 0 to ADataSource.DataSet.FieldCount - 1 do
          if ADataSource.DataSet.Fields[i].Tag > 0 then
            with DataInspector.Items.Add do
              begin
                Caption := ADataSource.DataSet.Fields[i].DisplayName;
                DisplayText := ADataSource.DataSet.Fields[i].AsString;
              end;
      end;
    DISPLAY_BY_VISIBLE: // Show only fields that are visible
      begin
        for i := 0 to ADataSource.DataSet.FieldCount - 1 do
          if ADataSource.DataSet.Fields[i].Visible then
            with DataInspector.Items.Add do
              begin
                Caption := ADataSource.DataSet.Fields[i].DisplayName;
                DisplayText := ADataSource.DataSet.Fields[i].AsString;
              end;
      end;
  end;

  // Comment text
  memComment.Text := AComment;
  with TabComment do
    begin
      TabVisible := AComment > '';
      Visible := AComment > '';
    end;
  // Default page
  pcMain.ActivePageIndex := 0;
end;
}
procedure TFrmCRMProperties.SetStatus(S: String);
begin
//  StatusBar.SimpleText := S;
  StatusBar.Update;
end;

end.
