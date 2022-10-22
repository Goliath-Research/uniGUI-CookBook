unit shipman_code_finder;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Forms,
  Vcl.Buttons,
  Vcl.Menus,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniButton,
  uniBitBtn,
  uniMemo,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, uniMainMenu, Vcl.Controls;

type
  TFrmShipManCodeFinder = class(TUniForm)
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    Panel4: TUniPanel;
    memCountryCode: TUniMemo;
    memNotFound: TUniMemo;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Panel5: TUniPanel;
    Panel6: TUniPanel;
    Panel7: TUniPanel;
    memCountryName: TUniMemo;
    Panel8: TUniPanel;
    Label3: TUniLabel;
    Splitter2: TUniSplitter;
    BitBtn1: TUniBitBtn;
    Panel9: TUniPanel;
    Label4: TUniLabel;
    chkFull: TUniCheckBox;
    Panel10: TUniPanel;
    lblNameCount: TUniLabel;
    Panel11: TUniPanel;
    lblCodeCount: TUniLabel;
    Panel12: TUniPanel;
    lblNotFoundCount: TUniLabel;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Close1: TUniMenuItem;
    Debug1: TUniMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure memCountryNameChange(Sender: TObject);
    procedure memCountryCodeChange(Sender: TObject);
    procedure memNotFoundChange(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure Debug1Click(Sender: TObject);
  private
    { Private declarations }
    procedure ProcessExec;
  public
    { Public declarations }
  end;

var
  FrmShipManCodeFinder: TFrmShipManCodeFinder;

implementation

{$R *.dfm}

uses
  IQMS.Common.EditMemoStr,
  IQMS.Common.DataLib,
  shipman_region;

procedure TFrmShipManCodeFinder.FormCreate(Sender: TObject);
begin
  // clear memos
  memCountryName.Clear;
  memCountryCode.Clear;
  memNotFound.Clear;
end;

procedure TFrmShipManCodeFinder.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmShipManCodeFinder.BitBtn1Click(Sender: TObject);
begin
  ProcessExec;
end;

procedure TFrmShipManCodeFinder.ProcessExec;
  // ---------------------------------------------------------------------------
  function _iq_CountryCodeFor(ACountryName: String): String;
  begin
    Result := SelectValueStrParam('select chr2 from v_country_codes where country = :COUNTRY',['COUNTRY'],[UpperCase(ACountryName)]);
  end;
  // ---------------------------------------------------------------------------
var
   i: Integer;
   ACode,
   ACountry,
   AText: String;
begin
   try
      memCountryCode.Lines.BeginUpdate;
      memNotFound.Lines.BeginUpdate;

      memCountryCode.Clear;
      memNotFound.Clear;
      for i := 0 to memCountryName.Lines.Count - 1 do
         begin
           ACode := '';
           ACountry := Trim(memCountryName.Lines.Strings[i]);
           ACode := _iq_CountryCodeFor(ACountry); // shipman_region.CountryCodeFor(ACountry);
           AText := ACode;
           if chkFull.Checked then
              AText := Format('''%s'', // %s', [ACode, ACountry]);

           if ACode > '' then
              memCountryCode.Lines.Add(AText)
           else
              memNotFound.Lines.Add(ACountry);
         end;
   finally
      memCountryCode.Lines.EndUpdate;
      memNotFound.Lines.EndUpdate;
   end;

   // position  cursor
   memCountryCode.SelStart := memCountryCode.Perform(EM_LINEINDEX, 0, 0);
   memCountryCode.Perform(EM_SCROLLCARET, 0, 0);

   memNotFound.SelStart := memCountryCode.Perform(EM_LINEINDEX, 0, 0);
   memNotFound.Perform(EM_SCROLLCARET, 0, 0);

end;

procedure TFrmShipManCodeFinder.memCountryNameChange(Sender: TObject);
begin
  lblNameCount.Caption := Format('Item Count: %d',[memCountryName.Lines.Count]);
end;

procedure TFrmShipManCodeFinder.memCountryCodeChange(Sender: TObject);
begin
  lblCodeCount.Caption := Format('Item Count: %d',[memCountryCode.Lines.Count]);
end;

procedure TFrmShipManCodeFinder.memNotFoundChange(Sender: TObject);
begin
  lblNotFoundCount.Caption := Format('Item Count: %d',[memNotFound.Lines.Count]);
end;

procedure TFrmShipManCodeFinder.Close1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmShipManCodeFinder.Debug1Click(Sender: TObject);
  // ---------------------------------------------------------------------------
  function _iq_CountryCodeFor(ACountryName: String): String;
  begin
    Result := SelectValueStrParam('select chr2 from v_country_codes where country = :COUNTRY',['COUNTRY'],[UpperCase(ACountryName)]);
  end;
var
   i: Integer;
   schr2, schr3, sdigit3,
   ACode,
   ACountry,
   AText: String;
   ALines: TStringList;
   A: Variant;


  // ---------------------------------------------------------------------------
  procedure _AddItem(ACountryName, AChr2: String; AChr3: String = ''; ADigit3: String = '');
  begin
    if not Assigned(ALines) then Exit;
    // select 'AF' as chr2, 'AFG' as chr3, '004' as digit3, 'AFGHANISTAN' as country from dual
    ALines.Add(Format('select ''%s'' as chr2, ''%s'' as chr3, ''%s'' as digit3, ''%s'' as country from dual',
      [AChr2, AChr3, ADigit3, ACountryName]));
    ALines.Add('union');
  end;
  // ---------------------------------------------------------------------------

begin

  try
     ALines := TStringList.Create;
     //ALines.Sorted := TRUE;
     //ALines.Duplicates := dupIgnore;


     //for i := Low(CountryCodes) to High(CountryCodes) do
     for i := 0 to memCountryName.Lines.Count - 1 do
      begin
        A := SelectValueArrayFmt('SELECT a.chr2, a.chr3, a.digit3, a.country FROM v_country_codes a where a.chr2 = ''%s'' ',
          [memCountryName.Lines.Strings[i]]);
        if System.Variants.VarArrayDimCount(A) > 0 then
           begin
             {schr2   := A[0];
             schr3   := A[1];
             sdigit3 := A[2];
             ACountry := A[3];}

             // select 'AF' as chr2, 'AFG' as chr3, '004' as digit3, 'AFGHANISTAN' as country from dual
             _AddItem(A[3], A[0], A[1], A[2]);

           end;
      end;
(*
     // Add country names that have the same code
     // These country names may display as text; the country code may be
     // used to lookup the useable country name
     _AddItem('Canary Islands', 'ES');
     _AddItem('Channel Islands', 'GB');
     _AddItem('England', 'GB');
     _AddItem('Great Britain', 'GB');
     _AddItem('Northern Ireland', 'GB');
     _AddItem('United Kingdom', 'GB');
     _AddItem('Scotland', 'GB');
     _AddItem('Wales', 'GB');
     _AddItem('Grand Cayman', 'KY');
     _AddItem('Rota', 'MP');
     _AddItem('Saipan', 'MP');
     _AddItem('Tinian', 'MP');
     _AddItem('Holland', 'NL');
     _AddItem('Tahiti', 'PF');
     _AddItem('Union Island', 'VC');
     _AddItem('Great Thatch Island', 'VG');
     _AddItem('Great Tobago Islands', 'VG');
     _AddItem('Jost Van Dyke Islands', 'VG');
     _AddItem('Norman Island', 'VG');
     _AddItem('Tortola Island', 'VG');
     _AddItem('St. Croix Island', 'VI');
     _AddItem('St. John', 'VI');
     _AddItem('St. Thomas', 'VI');
*)
     IQMS.Common.EditMemoStr.DoViewMemoStr(Self, ALines.Text);

  finally
    ALines.Free;
  end;


end;

end.
