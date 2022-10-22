unit IQMS.WebVcl.TinyMCE;

interface

uses
  SysUtils, Classes, Controls, Forms, uniGUIBaseClasses,
  Windows, Graphics, ComCtrls, EncdDecd,System.UITypes,
  uniGUIClasses, uniMemo, uniGUITypes,uniFileUpload,uniGUIApplication,uniGUIServer;

type
  TIQWebTinyMCE = class(TUniMemo)
  private
    function GetText: string;
    { Private declarations }
  protected
    procedure Focused; virtual;
    procedure Blured; virtual;
    procedure Edited(Value:String); virtual;
    procedure SetText(S:String);
    procedure LoadCompleted; override;
    procedure JSEventHandler(AEventName: string; AParams: TUniStrings); override;
    { Protected declarations }
  public
    { Public declarations }
  published
  property OnMouseDown;
  Function Rtf2Html(strStream : TStringStream):String;
  property Text : string read GetText write SetText;
    { Published declarations }
  end;


type
  {$IFDEF RTL230_UP}
  [ComponentPlatformsAttribute(pidWin32 or pidWin64 or pidOSX32)]
  {$ENDIF RTL230_UP}
  TJvStrToHtml = class(TComponent)
  private
    FHtml: string;
    FValue: string;
    procedure SetHtml(const Value: string);
    procedure SetValue(const Value: string);
  public
    constructor Create(AOwner: TComponent); override;
    function TextToHtml(const Text: string): string;
    function HtmlToText(const Text: string): string;
  published
    property Text: string read FValue write SetValue;
    property Html: string read FHtml write SetHtml;
  end;

function StringToHtml(const Value: string): string;
function HtmlToString(const Value: string): string;
function CharToHtml(Ch: Char): string;

type
  {$IFDEF RTL230_UP}
  [ComponentPlatformsAttribute(pidWin32 or pidWin64 or pidOSX32)]
  {$ENDIF RTL230_UP}
  TJvRGBToHTML = class(TComponent)
  private
    FHTMLColor: string;
    FRGBColor: TColor;
    procedure SetRGBColor(const Value: TColor);
    procedure SetHTMLColor(const Value: string);
  public
    constructor Create(AOwner: TComponent); override;
  published
    property RGBColor: TColor read FRGBColor write SetRGBColor default clBlack;
    property HTMLColor: string read FHTMLColor write SetHTMLColor;
  end;

function RgbToHtml(Value: TColor): string;
function HtmlToRgb(const Value: string): TColor;


type
  TJvParaAttributesRec = record
    Alignment: TAlignment;
    Numbering: TNumberingStyle;
  end;

  TFontInfo = class(TPersistent)
  private
    FFontData: TFontData;
    FColor: TColor;
    FPixelsPerInch: Integer;
    FLink: Boolean;
    function GetSize: Integer;
    procedure SetSize(const Value: Integer);
  public
    constructor Create(APixelsPerInch: Integer);
    procedure Assign(Source: TPersistent); override;
    property Color: TColor read FColor write FColor;
    property Link: Boolean read FLink write FLink;

    property Size: Integer read GetSize write SetSize;
    property Height: Integer read FFontData.Height write FFontData.Height;
    property Pitch: TFontPitch read FFontData.Pitch write FFontData.Pitch;
    property Style: TFontStylesBase read FFontData.Style write FFontData.Style;
    property Charset: TFontCharset read FFontData.Charset write FFontData.Charset;
    property Name: TFontDataName read FFontData.Name write FFontData.Name;
  end;

  {$IFDEF RTL230_UP}
  [ComponentPlatformsAttribute(pidWin32 or pidWin64 or pidOSX32)]
  {$ENDIF RTL230_UP}
  TJvRichEditToHtml = class(TComponent)
  private
    FCToH: TJvRgbToHtml;
    FCharToH: TJvStrToHtml;
    FEndSection: string;
    FEndPara: string;
    FTitle: string;
    FFooter: TStrings;
    FHeader: TStrings;
    function AttToHtml(Value: TFontInfo): string;
    function ParaToHtml(Value: TJvParaAttributesRec): string; overload;
    procedure SetFooter(const Value: TStrings);
    procedure SetHeader(const Value: TStrings);
    function IsFooterStored: Boolean;
    function IsHeaderStored: Boolean;
    procedure WriteEmptyStrings(Writer: TWriter);
  protected
    procedure DefineProperties(Filer: TFiler); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ConvertToHtmlStrings(Input:TStringStream; Strings: TStrings);
  published
    property Title: string read FTitle write FTitle;
    property Header: TStrings read FHeader write SetHeader stored IsHeaderStored;
    property Footer: TStrings read FFooter write SetFooter stored IsFooterStored;
  end;


implementation

{ TIQWebTinyMCE }

function EncodeFile(const FileName: string): AnsiString;
var
  stream: TMemoryStream;
begin
  stream := TMemoryStream.Create;
  try
    stream.LoadFromFile(Filename);
    result := EncodeBase64(stream.Memory, stream.Size);
  finally
    stream.Free;
  end;
end;

procedure TIQWebTinyMCE.Blured;
begin

end;

procedure TIQWebTinyMCE.Edited(Value: String);
begin

end;

procedure TIQWebTinyMCE.Focused;
begin

end;

function TIQWebTinyMCE.GetText: string;
begin
  Result:=Lines.Text;
end;

procedure TIQWebTinyMCE.JSEventHandler(AEventName: string;
  AParams: TUniStrings);
var
  S : string;
  UniFileUpload1:TUniFileUpload;
begin
  inherited;
  if AEventName = 'fileUpload' then
  begin
   try
    UniFileUpload1:=TUniFileUpload.Create(uniGUIApplication.UniApplication);
     if UniFileUpload1.Execute then
       begin
         if UniFileUpload1.CacheFile<>'' then
           begin
             S:=EncodeFile(UniFileUpload1.CacheFile);
             S:=StringReplace(S, #13#10, '', [rfReplaceAll]);
             UniSession.AddJS('tinyMCE.activeEditor.execCommand("mceInsertContent", true, "<img src=\"data:image/gif;base64,'+S+'\" />") ');
           end;
       end;
   finally
    UniFileUpload1.Free;
   end;
  end
  else if AEventName='focus' then
  begin
    Focused;
  end
  else if AEventName='blur' then
  begin
    Blured;
  end
  else if AEventName='edit' then
  begin
    Edited(AParams['text'].AsString);
  end;
end;

procedure TIQWebTinyMCE.LoadCompleted;
begin
  inherited;
   JSCallGlobal('Ext.Function.defer', [JSFunction('', 'tinyMCE.init({ '+
                'selector: ''#'+JSName+'_id-inputEl'', '+
                'paste_data_images: true,'+
                'auto_focus:false, '+
                   ' plugins: [ ''advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker'', '+
                              ' ''searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking'', '+
                              ' ''save table contextmenu directionality emoticons template paste textcolor'' '+
                              ' ],'+
                   ' toolbar: " insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link plusimage | print preview media fullpage | forecolor backcolor emoticons",'+
                   ' setup: function(ed) { '+
                   '   ed.on(''keyup'', function(e) { '+
                   '       '+JSName+'.setValue(ed.getContent({no_events: true})); '+
                   '   });  '+
                   '   ed.on(''change'', function(e) {  '+
                   '       '+JSName+'.setValue(ed.getContent({no_events: true})); '+
                   '    }); '+
                   '  ed.addButton(''plusimage'', {'+
                   ' icon: ''image'','+
                   ' tooltip: ''Insert/edit image'','+
                   ' onclick: function() {ajaxRequest('+JSName+',"fileUpload",{})}'+
                   ' });'+
                   ' } '+
                '  });') , 100  ]);

//                   ' file_browser_callback: function(field_name, url, type, win) { '+
//                     ' '+JSName+'_win=win; '+JSName+'_field_name=field_name; '+
//                     ' $(tinyMCE.activeEditor.windowManager.windows[0].getEl(0)).hide(); $(''#mce-modal-block'').hide();'+
//                     ' ajaxRequest('+JSName+',"fileUpload",{})'+
//                   ' },'+
//                'paste_preprocess: function(plugin, args) {  '+
//                '  console.log(args.content); args.content = args.content; '+
//                '},'+
end;

function TIQWebTinyMCE.Rtf2Html(strStream: TStringStream): String;
var
  aJvRichEditToHtml:TJvRichEditToHtml;
  s:TStringList;
begin
  try
    aJvRichEditToHtml:=TJvRichEditToHtml.Create(self);
    s:=TStringList.Create;
    aJvRichEditToHtml.ConvertToHtmlStrings(strStream,s);
    Result:=s.Text;
  finally
    s.Free;
    aJvRichEditToHtml.Free;
  end;
end;

procedure TIQWebTinyMCE.SetText(S: String);
begin
  Lines.Text:=S;
  JSCallGlobal('Ext.Function.defer', [JSFunction('', 'tinyMCE.execCommand("mceSetContent", false, '+JSName+'.value);') , 100  ]);
end;


type
  TJvHtmlCodeRec = record
    Ch: Word;
    Html: string;
  end;

const
  { References:
      http://www.w3.org/TR/REC-html40/charset.html#h-5.3
      http://www.w3.org/TR/REC-html40/sgml/entities.html#h-24.2.1
      http://www.w3.org/TR/REC-html40/sgml/entities.html#h-24.4.1
  }
  Conversions: array [0..240] of TJvHtmlCodeRec = (
    (Ch:   34; Html: '&quot;'),
    (Ch:   38; Html: '&amp;'),
    (Ch:   39; Html: '&apos;'),
    (Ch:   60; Html: '&lt;'),
    (Ch:   62; Html: '&gt;'),
    (Ch:  160; Html: '&nbsp;'),
    (Ch:  161; Html: '&iexcl;'),
    (Ch:  162; Html: '&cent;'),
    (Ch:  163; Html: '&pound;'),
    (Ch:  164; Html: '&curren;'),
    (Ch:  165; Html: '&yen;'),
    (Ch:  166; Html: '&brvbar;'),
    (Ch:  167; Html: '&sect;'),
    (Ch:  168; Html: '&uml;'),
    (Ch:  169; Html: '&copy;'),
    (Ch:  170; Html: '&ordf;'),
    (Ch:  171; Html: '&laquo;'),
    (Ch:  172; Html: '&not;'),
    (Ch:  173; Html: '&shy;'),
    (Ch:  174; Html: '&reg;'),
    (Ch:  175; Html: '&macr;'),
    (Ch:  176; Html: '&deg;'),
    (Ch:  177; Html: '&plusmn;'),
    (Ch:  178; Html: '&sup2;'),
    (Ch:  179; Html: '&sup3;'),
    (Ch:  180; Html: '&acute;'),
    (Ch:  181; Html: '&micro;'),
    (Ch:  182; Html: '&para;'),
    (Ch:  183; Html: '&middot;'),
    (Ch:  184; Html: '&cedil;'),
    (Ch:  185; Html: '&sup1;'),
    (Ch:  186; Html: '&ordm;'),
    (Ch:  187; Html: '&raquo;'),
    (Ch:  188; Html: '&frac14;'),
    (Ch:  189; Html: '&frac12;'),
    (Ch:  190; Html: '&frac34;'),
    (Ch:  191; Html: '&iquest;'),
    (Ch:  192; Html: '&Agrave;'),
    (Ch:  193; Html: '&Aacute;'),
    (Ch:  194; Html: '&Acirc;'),
    (Ch:  195; Html: '&Atilde;'),
    (Ch:  196; Html: '&Auml;'),
    (Ch:  197; Html: '&Aring;'),
    (Ch:  198; Html: '&AElig;'),
    (Ch:  199; Html: '&Ccedil;'),
    (Ch:  200; Html: '&Egrave;'),
    (Ch:  201; Html: '&Eacute;'),
    (Ch:  202; Html: '&Ecirc;'),
    (Ch:  203; Html: '&Euml;'),
    (Ch:  204; Html: '&Igrave;'),
    (Ch:  205; Html: '&Iacute;'),
    (Ch:  206; Html: '&Icirc;'),
    (Ch:  207; Html: '&Iuml;'),
    (Ch:  208; Html: '&ETH;'),
    (Ch:  209; Html: '&Ntilde;'),
    (Ch:  210; Html: '&Ograve;'),
    (Ch:  211; Html: '&Oacute;'),
    (Ch:  212; Html: '&Ocirc;'),
    (Ch:  213; Html: '&Otilde;'),
    (Ch:  214; Html: '&Ouml;'),
    (Ch:  215; Html: '&times;'),
    (Ch:  216; Html: '&Oslash;'),
    (Ch:  217; Html: '&Ugrave;'),
    (Ch:  218; Html: '&Uacute;'),
    (Ch:  219; Html: '&Ucirc;'),
    (Ch:  220; Html: '&Uuml;'),
    (Ch:  221; Html: '&Yacute;'),
    (Ch:  222; Html: '&THORN;'),
    (Ch:  223; Html: '&szlig;'),
    (Ch:  224; Html: '&agrave;'),
    (Ch:  225; Html: '&aacute;'),
    (Ch:  226; Html: '&acirc;'),
    (Ch:  227; Html: '&atilde;'),
    (Ch:  228; Html: '&auml;'),
    (Ch:  229; Html: '&aring;'),
    (Ch:  230; Html: '&aelig;'),
    (Ch:  231; Html: '&ccedil;'),
    (Ch:  232; Html: '&egrave;'),
    (Ch:  233; Html: '&eacute;'),
    (Ch:  234; Html: '&ecirc;'),
    (Ch:  235; Html: '&euml;'),
    (Ch:  236; Html: '&igrave;'),
    (Ch:  237; Html: '&iacute;'),
    (Ch:  238; Html: '&icirc;'),
    (Ch:  239; Html: '&iuml;'),
    (Ch:  240; Html: '&eth;'),
    (Ch:  241; Html: '&ntilde;'),
    (Ch:  242; Html: '&ograve;'),
    (Ch:  243; Html: '&oacute;'),
    (Ch:  244; Html: '&ocirc;'),
    (Ch:  245; Html: '&otilde;'),
    (Ch:  246; Html: '&ouml;'),
    (Ch:  247; Html: '&divide;'),
    (Ch:  248; Html: '&oslash;'),
    (Ch:  249; Html: '&ugrave;'),
    (Ch:  250; Html: '&uacute;'),
    (Ch:  251; Html: '&ucirc;'),
    (Ch:  252; Html: '&uuml;'),
    (Ch:  253; Html: '&yacute;'),
    (Ch:  254; Html: '&thorn;'),
    (Ch:  255; Html: '&yuml;'),
    (Ch:  338; Html: '&OElig;'),
    (Ch:  339; Html: '&oelig;'),
    (Ch:  352; Html: '&Scaron;'),
    (Ch:  353; Html: '&scaron;'),
    (Ch:  376; Html: '&Yuml;'),
    (Ch:  402; Html: '&fnof;'),
    (Ch:  710; Html: '&circ;'),
    (Ch:  732; Html: '&tilde;'),
    (Ch:  913; Html: '&Alpha;'),
    (Ch:  914; Html: '&Beta;'),
    (Ch:  915; Html: '&Gamma;'),
    (Ch:  916; Html: '&Delta;'),
    (Ch:  917; Html: '&Epsilon;'),
    (Ch:  918; Html: '&Zeta;'),
    (Ch:  919; Html: '&Eta;'),
    (Ch:  920; Html: '&Theta;'),
    (Ch:  921; Html: '&Iota;'),
    (Ch:  922; Html: '&Kappa;'),
    (Ch:  923; Html: '&Lambda;'),
    (Ch:  924; Html: '&Mu;'),
    (Ch:  925; Html: '&Nu;'),
    (Ch:  926; Html: '&Xi;'),
    (Ch:  927; Html: '&Omicron;'),
    (Ch:  928; Html: '&Pi;'),
    (Ch:  929; Html: '&Rho;'),
    (Ch:  931; Html: '&Sigma;'),
    (Ch:  932; Html: '&Tau;'),
    (Ch:  933; Html: '&Upsilon;'),
    (Ch:  934; Html: '&Phi;'),
    (Ch:  935; Html: '&Chi;'),
    (Ch:  936; Html: '&Psi;'),
    (Ch:  937; Html: '&Omega;'),
    (Ch:  945; Html: '&alpha;'),
    (Ch:  946; Html: '&beta;'),
    (Ch:  947; Html: '&gamma;'),
    (Ch:  948; Html: '&delta;'),
    (Ch:  949; Html: '&epsilon;'),
    (Ch:  950; Html: '&zeta;'),
    (Ch:  951; Html: '&eta;'),
    (Ch:  952; Html: '&theta;'),
    (Ch:  953; Html: '&iota;'),
    (Ch:  954; Html: '&kappa;'),
    (Ch:  955; Html: '&lambda;'),
    (Ch:  956; Html: '&mu;'),
    (Ch:  957; Html: '&nu;'),
    (Ch:  958; Html: '&xi;'),
    (Ch:  959; Html: '&omicron;'),
    (Ch:  960; Html: '&pi;'),
    (Ch:  961; Html: '&rho;'),
    (Ch:  962; Html: '&sigmaf;'),
    (Ch:  963; Html: '&sigma;'),
    (Ch:  964; Html: '&tau;'),
    (Ch:  965; Html: '&upsilon;'),
    (Ch:  966; Html: '&phi;'),
    (Ch:  967; Html: '&chi;'),
    (Ch:  968; Html: '&psi;'),
    (Ch:  969; Html: '&omega;'),
    (Ch:  977; Html: '&thetasym;'),
    (Ch:  978; Html: '&upsih;'),
    (Ch:  982; Html: '&piv;'),
    (Ch: 8194; Html: '&ensp;'),
    (Ch: 8195; Html: '&emsp;'),
    (Ch: 8201; Html: '&thinsp;'),
    (Ch: 8204; Html: '&zwnj;'),
    (Ch: 8205; Html: '&zwj;'),
    (Ch: 8206; Html: '&lrm;'),
    (Ch: 8207; Html: '&rlm;'),
    (Ch: 8211; Html: '&ndash;'),
    (Ch: 8212; Html: '&mdash;'),
    (Ch: 8216; Html: '&lsquo;'),
    (Ch: 8217; Html: '&rsquo;'),
    (Ch: 8218; Html: '&sbquo;'),
    (Ch: 8220; Html: '&ldquo;'),
    (Ch: 8221; Html: '&rdquo;'),
    (Ch: 8222; Html: '&bdquo;'),
    (Ch: 8224; Html: '&dagger;'),
    (Ch: 8225; Html: '&Dagger;'),
    (Ch: 8226; Html: '&bull;'),
    (Ch: 8230; Html: '&hellip;'),
    (Ch: 8240; Html: '&permil;'),
    (Ch: 8242; Html: '&prime;'),
    (Ch: 8243; Html: '&Prime;'),
    (Ch: 8249; Html: '&lsaquo;'),
    (Ch: 8250; Html: '&rsaquo;'),
    (Ch: 8254; Html: '&oline;'),
    (Ch: 8364; Html: '&euro;'),
    (Ch: 8482; Html: '&trade;'),
    (Ch: 8592; Html: '&larr;'),
    (Ch: 8593; Html: '&uarr;'),
    (Ch: 8594; Html: '&rarr;'),
    (Ch: 8595; Html: '&darr;'),
    (Ch: 8596; Html: '&harr;'),
    (Ch: 8629; Html: '&crarr;'),
    (Ch: 8704; Html: '&forall;'),
    (Ch: 8706; Html: '&part;'),
    (Ch: 8707; Html: '&exist;'),
    (Ch: 8709; Html: '&empty;'),
    (Ch: 8711; Html: '&nabla;'),
    (Ch: 8712; Html: '&isin;'),
    (Ch: 8713; Html: '&notin;'),
    (Ch: 8715; Html: '&ni;'),
    (Ch: 8719; Html: '&prod;'),
    (Ch: 8721; Html: '&sum;'),
    (Ch: 8722; Html: '&minus;'),
    (Ch: 8727; Html: '&lowast;'),
    (Ch: 8730; Html: '&radic;'),
    (Ch: 8733; Html: '&prop;'),
    (Ch: 8734; Html: '&infin;'),
    (Ch: 8736; Html: '&ang;'),
    (Ch: 8743; Html: '&and;'),
    (Ch: 8744; Html: '&or;'),
    (Ch: 8745; Html: '&cap;'),
    (Ch: 8746; Html: '&cup;'),
    (Ch: 8747; Html: '&int;'),
    (Ch: 8756; Html: '&there4;'),
    (Ch: 8764; Html: '&sim;'),
    (Ch: 8773; Html: '&cong;'),
    (Ch: 8776; Html: '&asymp;'),
    (Ch: 8800; Html: '&ne;'),
    (Ch: 8801; Html: '&equiv;'),
    (Ch: 8804; Html: '&le;'),
    (Ch: 8805; Html: '&ge;'),
    (Ch: 8834; Html: '&sub;'),
    (Ch: 8835; Html: '&sup;'),
    (Ch: 8836; Html: '&nsub;'),
    (Ch: 8838; Html: '&sube;'),
    (Ch: 8839; Html: '&supe;'),
    (Ch: 8853; Html: '&oplus;'),
    (Ch: 8855; Html: '&otimes;'),
    (Ch: 8869; Html: '&perp;'),
    (Ch: 8901; Html: '&sdot;'),
    (Ch: 8968; Html: '&lceil;'),
    (Ch: 8969; Html: '&rceil;'),
    (Ch: 8970; Html: '&lfloor;'),
    (Ch: 8971; Html: '&rfloor;'),
    (Ch: 9674; Html: '&loz;'),
    (Ch: 9824; Html: '&spades;'),
    (Ch: 9827; Html: '&clubs;'),
    (Ch: 9829; Html: '&hearts;'),
    (Ch: 9830; Html: '&diams;')
  );

var
  ConversionsHash: array of Word;

{$IFNDEF UNICODE}
const
  MB_ERR_INVALID_CHARS = 8;
{$ENDIF ~UNICODE}

{ TJvStrToHtml }

constructor TJvStrToHtml.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FValue := '';
  FHtml := '';
end;

function TJvStrToHtml.HtmlToText(const Text: string): string;
begin
  Result := HtmlToString(Text);
end;

procedure TJvStrToHtml.SetHtml(const Value: string);
begin
  FValue := HtmlToText(Value);
end;

procedure TJvStrToHtml.SetValue(const Value: string);
begin
  FHtml := TextToHtml(Value);
end;

function TJvStrToHtml.TextToHtml(const Text: string): string;
begin
  Result := StringToHtml(Text);
end;

function GetHtmlHash(const S: string): Word;
var
  I: Integer;
begin
  Result := Length(S);
  for I := 1 to Length(S) do
    Result := Word(Result + Ord(S[I]) shl (I mod 4));
end;

procedure InitConversionsHash;
var
  I: Integer;
begin
  SetLength(ConversionsHash, Length(Conversions));
  for I := 0 to High(ConversionsHash) do
    ConversionsHash[I] := GetHtmlHash(Conversions[I].Html);
end;

function StringToHtml(const Value: string): string;
const
  Nbsp = '&nbsp;';
var
  I, J: Integer;
  Len, AddLen, HtmlLen: Integer;
  P: PChar;
  Ch: Char;
  W: Word;
  Even: Boolean;
begin
  Len := Length(Value);
  // number of chars to add
  AddLen := 0;
  I := 1;
  while I <= Len do
  begin
    Ch := Value[I];
    if Ch = ' ' then
    begin
      Even := False;
      repeat
        if Even then
          Inc(AddLen, 5 {Length(Nbsp) - 1});
        Even := not Even;
        Inc(I);
      until (I > Len) or (Value[I] <> ' ');
      Continue;
    end
    else
    if (Ch >= #128) or not (AnsiChar(Ch) in ['A'..'Z', 'a'..'z', '0'..'9', '_']) then
    begin
      W := Word(Ch);
      {$IFNDEF UNICODE}
      if W >= 128 then
        if MultiByteToWideChar(CP_ACP, MB_ERR_INVALID_CHARS, @Ch, 1, PWideChar(@W), 1) = 0 then
          W := Word(Ch);
      {$ENDIF ~UNICODE}
      for J := Low(Conversions) to High(Conversions) do
        if W = Conversions[J].Ch then
        begin
          Inc(AddLen, Length(Conversions[J].Html) - 1);
          Break;
        end;
    end;
    Inc(I);
  end;

  if AddLen = 0 then
    Result := Value
  else
  begin
    SetLength(Result, Len + AddLen);
    P := Pointer(Result);
    I := 1;
    while I <= Len do
    begin
      Ch := Value[I];
      if Ch = ' ' then
      begin
        Even := False;
        repeat
          if Even then
          begin
            HtmlLen := 6 {Length(Nbsp)};
            Move(Nbsp[1], P[0], HtmlLen * SizeOf(Char));
            Inc(P, HtmlLen);
          end
          else
          begin
            P[0] := ' ';
            Inc(P);
          end;
          Even := not Even;
          Inc(I);
        until (I > Len) or (Value[I] <> ' ');
        Continue;
      end
      else
      if (Ch >= #128) or not (AnsiChar(Ch) in ['A'..'Z', 'a'..'z', '0'..'9', '_']) then
      begin
        W := Word(Ch);
        {$IFNDEF UNICODE}
        if W >= 128 then
          if MultiByteToWideChar(CP_ACP, MB_ERR_INVALID_CHARS, @Ch, 1, PWideChar(@W), 1) = 0 then
            W := Word(Ch);
        {$ENDIF ~UNICODE}
        for J := Low(Conversions) to High(Conversions) do
          if W = Conversions[J].Ch then
          begin
            HtmlLen := Length(Conversions[J].Html);
            Move(Conversions[J].Html[1], P[0], HtmlLen * SizeOf(Char)); // Conversions[].Html is a PChar
            Inc(P, HtmlLen);
            Ch := #0;
            Break;
          end;
      end;
      if Ch <> #0 then
      begin
        P[0] := Ch;
        Inc(P);
      end;
      Inc(I);
    end;
  end;
end;

function HtmlToString(const Value: string): string;
var
  I, Index, Len: Integer;
  Start, J: Integer;
  Ch: Char;
  W, Hash: Word;
  ReplStr: string;
begin
  if ConversionsHash = nil then
    InitConversionsHash;

  Len := Length(Value);
  SetLength(Result, Len); // worst case
  Index := 0;
  I := 1;
  while I <= Len do
  begin
    Ch := Value[I];
    // html entitiy
    if Ch = '&' then
    begin
      Start := I;
      Inc(I);
      while (I <= Len) and (Value[I] <> ';') and (I < Start + 20) do
        Inc(I);
      if Value[I] <> ';' then
        I := Start
      else
      begin
        Ch := #0;
        ReplStr := Copy(Value, Start, I - Start + 1);
        if ReplStr = '&nbsp;' then // special treatment for &nbsp
          Ch := ' '
        else
        begin
          Hash := GetHtmlHash(ReplStr);
          J := 0;
          while (J < Length(Conversions)) do
          begin
            while (J < Length(Conversions)) and (ConversionsHash[J] <> Hash) do
              Inc(J);
            if (J < Length(Conversions)) and (Conversions[J].Html = ReplStr) then
            begin
              W := Conversions[J].Ch;
              Ch := Char(W);
              {$IFNDEF UNICODE}
              if W >= 128 then
                if WideCharToMultiByte(CP_ACP, MB_ERR_INVALID_CHARS, @W, 1, PAnsiChar(@Ch), 1, nil, nil) = 0 then
                  Ch := Char(W);
              {$ENDIF ~UNICODE}
              Break;
            end;
            Inc(J);
          end;
        end;

        // if no conversion was found, it may actually be a number
        if Ch = #0 then
        begin
          ReplStr := Copy(ReplStr, 2, MaxInt);
          if ReplStr <> '' then
          begin
            if (ReplStr[1] = '#') and (Length(ReplStr) > 1) then
            begin
              Delete(ReplStr, 1, 1);
              if ReplStr[1] = 'x' then // hex value
                ReplStr[1] := '$'; // prepare for StrToInt
            end;
            if StrToIntDef(ReplStr, -1) <> -1 then
              Ch := Chr(StrToInt(ReplStr))
            else
            begin
              I := Start;
              Ch := Value[I];
            end;
          end;
        end;
      end;
    end;

    Inc(I);
    Inc(Index);
    Result[Index] := Ch;
  end;
  if Index <> Len then
    SetLength(Result, Index);
end;

function CharToHtml(Ch: Char): string;
var
  I: Integer;
  W: Word;
begin
  if (Ch >= #128) or not (AnsiChar(Ch) in ['A'..'Z', 'a'..'z', '0'..'9', '_']) then
  begin
    W := Word(Ch);
    {$IFNDEF UNICODE}
    if (W < 128) or (MultiByteToWideChar(CP_ACP, MB_ERR_INVALID_CHARS, @Ch, 1, PWideChar(@W), 1) <> 0) then
    {$ENDIF ~UNICODE}
    begin
      I := 0;
      while (I < Length(Conversions)) and (Conversions[I].Ch <> W) do
        Inc(I);
      if I < Length(Conversions) then
      begin
        Result := Conversions[I].Html;
        Exit;
      end;
    end;
  end;
  Result := Ch;
end;


function RgbToHtml(Value: TColor): string;
begin
  with TJvRGBToHTML.Create(nil) do
    try
      RGBColor := Value;
      Result := HTMLColor;
    finally
      Free;
    end;
end;

function HtmlToRgb(const Value: string): TColor;
begin
  with TJvRGBToHTML.Create(nil) do
    try
      HTMLColor := Value;
      Result := RGBColor;
    finally
      Free;
    end;
end;

constructor TJvRGBToHTML.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  RGBColor := clBlack;
end;

procedure TJvRGBToHTML.SetRGBColor(const Value: TColor);
var
  Clr: TColor;
begin
  FRGBColor := Value;
  Clr := ColorToRGB(Value);
  FHTMLColor := IntToHex(GetRValue(Clr), 2) + IntToHex(GetGValue(Clr), 2) + IntToHex(GetBValue(Clr), 2);
end;

procedure TJvRGBToHTML.SetHTMLColor(const Value: string);
var
  C: TColor;
  R, G, B: Byte;
begin
  try
    if Length(Value) = 6 then
    begin
      R := StrToInt('$' + Copy(Value, 1, 2));
      G := StrToInt('$' + Copy(Value, 3, 2));
      B := StrToInt('$' + Copy(Value, 5, 2));
      C := RGB(R, G, B);
      FRGBColor := C;
      FHTMLColor := Value;
    end;
  except
  end;
end;


const
  // (rom) needs renaming?
//  cHTMLHeadBegin = '<HTML>';
//  cHTMLBodyBegin = '<BODY>';
//  cHTMLBodyEnd = '</BODY>';
//  cHTMLEnd = '</HTML>';
//  cHTMLTitleFmt = '<TITLE>%s</TITLE>';

  cHTMLBR = '<BR>';
//  cHTMLFontColorBegin = '<FONT COLOR=#';
//  cHTMLSize = ' SIZE=';
//  cHTMLFace = ' FACE="';
  cHTMLFontEnd = '</SPAN>';

  cHTMLBoldBegin = '<B>';
  cHTMLBoldEnd = '</B>';

  cHTMLItalicBegin = '<I>';
  cHTMLItalicEnd = '</I>';

  cHTMLStrikeoutBegin = '<STRIKE>';
  cHTMLStrikeoutEnd = '</STRIKE>';

  cHTMLUnderlineBegin = '<U>';
  cHTMLUnderlineEnd = '</U>';

  cHTMLParaEnd = '</P>';
  cHTMLParaLeft = '<P ALIGN="LEFT">';
  cHTMLParaRight = '<P ALIGN="RIGHT">';
  cHTMLParaCenter = '<P ALIGN="CENTER">';

  cHTMLListBegin = '<LI>';
  cHTMLListEnd = '</LI>';

  cDefaultHeader: array[0..4] of string = (
    '<HTML>',
    '  <HEAD>',
    '    <TITLE><#TITLE></TITLE>',
    '  </HEAD>',
    '  <BODY>'
  );
  cDefaultFooter: array[0..1] of string = (
    '  </BODY>',
    '</HTML>'
  );

//=== { TFontInfo } ==========================================================

constructor TFontInfo.Create(APixelsPerInch: Integer);
begin
  inherited Create;
  FPixelsPerInch := APixelsPerInch;
end;

procedure TFontInfo.Assign(Source: TPersistent);
begin
  if Source is TTextAttributes then
  begin
    FFontData.Name := TFontDataName(TTextAttributes(Source).Name);
    FFontData.Height := TTextAttributes(Source).Height;
    FFontData.Pitch := TTextAttributes(Source).Pitch;
    FFontData.Style := TTextAttributes(Source).Style;
    FFontData.Charset := TTextAttributes(Source).Charset;
    FColor := TTextAttributes(Source).Color;
    FLink := False;
  end
  else
  if Source is TFontInfo then
  begin
    FFontData := TFontInfo(Source).FFontData;
    FColor := TFontInfo(Source).FColor;
    FLink := TFontInfo(Source).FLink;
  end
  else
    inherited Assign(Source);
end;

function TFontInfo.GetSize: Integer;
begin
  Result := -MulDiv(Height, 72, FPixelsPerInch);
end;

procedure TFontInfo.SetSize(const Value: Integer);
begin
  FFontData.Height := -MulDiv(Value, FPixelsPerInch, 72);
end;

//=== { TJvRichEditToHtml } ==================================================

constructor TJvRichEditToHtml.Create(AOwner: TComponent);
var
  I: Integer;
begin
  inherited Create(AOwner);
  FCToH := TJvRgbToHtml.Create(Self);
  FCharToH := TJvStrToHtml.Create(Self);
  FHeader := TStringList.Create;
  for I := 0 to High(cDefaultHeader) do
    FHeader.Add(cDefaultHeader[I]);
  FFooter := TStringList.Create;
  for I := 0 to High(cDefaultFooter) do
    FFooter.Add(cDefaultFooter[I]);
end;

destructor TJvRichEditToHtml.Destroy;
begin
  FCToH.Free;
  FCharToH.Free;
  FHeader.Free;
  FFooter.Free;
  inherited Destroy;
end;

function TJvRichEditToHtml.AttToHtml(Value: TFontInfo): string;
var
  Size: Integer;
begin
  FEndSection := cHTMLFontEnd;
  FCToH.RgbColor := Value.Color;

  Size := Abs(Value.Size);
  if Size = 0 then
    Size := 8;
  Result := Format('<SPAN style="color: #%s; font-size: %dpt; font-family: %s;">',
    [FCToH.HtmlColor, Size, Value.Name]);
  if fsBold in Value.Style then
  begin
    FEndSection := cHTMLBoldEnd + FEndSection;
    Result := Result + cHTMLBoldBegin;
  end;
  if fsItalic in Value.Style then
  begin
    FEndSection := cHTMLItalicEnd + FEndSection;
    Result := Result + cHTMLItalicBegin;
  end;
  if fsStrikeout in Value.Style then
  begin
    FEndSection := cHTMLStrikeoutEnd + FEndSection;
    Result := Result + cHTMLStrikeoutBegin;
  end;
  if fsUnderline in Value.Style then
  begin
    FEndSection := cHTMLUnderlineEnd + FEndSection;
    Result := Result + cHTMLUnderlineBegin;
  end;

//  if Value.Link then
//  begin
//    FEndSection := '</a>' + FEndSection;
//    Result := Result + '<a href="#">';
//  end;
end;

function Diff(One, Two: TFontInfo): Boolean;
begin
  Result := (One.Color <> Two.Color) or (One.Style <> Two.Style) or
    (One.Name <> Two.Name) or (One.Size <> Two.Size) or
    (One.Link <> Two.Link);
end;

function DiffPara(One, Two: TJvParaAttributesRec): Boolean;overload;
begin
  Result := (One.Alignment <> Two.Alignment) or (One.Numbering <> Two.Numbering);
end;


procedure TJvRichEditToHtml.ConvertToHtmlStrings(Input:TStringStream; Strings: TStrings);
var
  I, J: Integer;
  Datt, Att, CurrAt: TFontInfo;
  DPara, Para, CurrPara: TJvParaAttributesRec;
  St: TStringBuilder;
  FEnd: string;
  LOnChange: TNotifyEvent;
  LOnSelectionChange: TNotifyEvent;
  Text: string;
  Len: Integer;
  PreviousChar: Char;
  Value: TRichEdit;
begin
  Value:=TRichEdit.Create(nil);
  Value.ParentWindow:=Application.Handle;
  Value.Visible:=False;
  Input.SaveToFile('rtf2html.txt');
  Value.Lines.LoadFromFile('rtf2html.txt');
  Strings.BeginUpdate;
  try

    Strings.Clear;
    if Header.Count > 0 then
      Strings.Add(StringReplace(Header.Text, '<#TITLE>', Title, [rfReplaceAll]));
    Datt := TFontInfo.Create(Value.Font.PixelsPerInch);
    Att := TFontInfo.Create(Value.Font.PixelsPerInch);
    CurrAt := TFontInfo.Create(Value.Font.PixelsPerInch);

    DPara.Alignment := taLeftJustify;
    DPara.Numbering := ComCtrls.nsNone;
    CurrPara.Alignment := DPara.Alignment;
    CurrPara.Numbering := DPara.Numbering;
    Strings.Add(ParaToHtml(Para));

    Datt.Assign(Value.DefAttributes);
    Strings.Add(AttToHtml(Datt));

    CurrAt.Assign(Datt);
    Value.SelStart := 0;
    Value.SelectAll;
    Text := Value.SelText;
    Len := Length(Text);
    St := TStringBuilder.Create;
    try
      I := 1;
      Value.SelLength := 1;
      while I <= Len do
      begin
        // new line
        Value.SelStart := I - 1;
        Att.Assign(Value.SelAttributes);
        Para.Alignment := Value.Paragraph.Alignment;
        Para.Numbering := Value.Paragraph.Numbering;

        St.Length := 0;
        if DiffPara(Para, CurrPara) or (Para.Numbering = ComCtrls.nsBullet) then
        begin
          St.Append(FEndSection).Append(FEndPara);
          CurrPara.Alignment := Para.Alignment;
          CurrPara.Numbering := Para.Numbering;
          CurrAt.Assign(Att);
          St.Append(ParaToHtml(Para)).Append(AttToHtml(Att));
        end;

        J := I;
        PreviousChar := #0;
        while (J <= Len) and not CharInSet(Text[J], [#$A, #$B, #$D]) do { RICHEDIT uses #$B also for line breaking }
        begin
          Att.Assign(Value.SelAttributes);
          if Diff(Att, CurrAt) then
          begin
            St.Append(FEndSection);
            CurrAt.Assign(Att);
            St.Append(AttToHtml(Att));
            Value.SelStart := J;
          end
          else
          begin
            if (Text[J] = ' ') and (PreviousChar = ' ') then
              St.Append('&nbsp;')
            else
              St.Append(CharToHtml(Text[J]));
            PreviousChar := Text[J];
            Inc(J);
            Value.SelStart := J;
          end;
        end;
        if I = 1 then
          Strings.Add(St.ToString())
        else
          Strings.Add(cHTMLBR + St.ToString());
        I := J + 1;
      end;
    finally
      St.Free;
    end;
    Strings.Add(FEndSection);
    Strings.Add(FEndPara);

    Datt.Free;
    Att.Free;
    CurrAt.Free;

    Strings.Add(FEnd);
    Strings.AddStrings(Footer);
  finally
    FreeAndNil(Value);
    DeleteFile('rtf2html.txt');
    Strings.EndUpdate;
  end;
end;


function TJvRichEditToHtml.ParaToHtml(Value: TJvParaAttributesRec): string;
begin
  case Value.Alignment of
    taLeftJustify:
      Result := 'STYLE="text-align: left;"';
    taRightJustify:
      Result := 'STYLE="text-align: right;"';
    taCenter:
      Result := 'STYLE="text-align: center;"';
  end;
  if Value.Numbering = ComCtrls.nsBullet then
  begin
    Result := '<LI ' + Result + '>';
    FEndPara := '</LI>';
  end
  else
  begin
    Result := '<P ' + Result + '>';
    FEndPara := '</P>';
  end
end;

procedure TJvRichEditToHtml.SetFooter(const Value: TStrings);
begin
  if Value <> FFooter then
    FFooter.Assign(Value);
end;

procedure TJvRichEditToHtml.SetHeader(const Value: TStrings);
begin
  if Value <> FHeader then
    FHeader.Assign(Value);
end;

function TJvRichEditToHtml.IsFooterStored: Boolean;
var
  I: Integer;
begin
  Result := Footer.Count <> Length(cDefaultFooter);
  if not Result then
  begin
    Result := True;
    for I := 0 to High(cDefaultFooter) do
      if Footer[I] <> cDefaultFooter[I] then
        Exit;
    Result := False;
  end;
end;

function TJvRichEditToHtml.IsHeaderStored: Boolean;
var
  I: Integer;
begin
  Result := Header.Count <> Length(cDefaultHeader);
  if not Result then
  begin
    Result := True;
    for I := 0 to High(cDefaultHeader) do
      if Header[I] <> cDefaultHeader[I] then
        Exit;
    Result := False;
  end;
end;

procedure TJvRichEditToHtml.WriteEmptyStrings(Writer: TWriter);
begin
  Writer.WriteListBegin;
  Writer.WriteListEnd;
end;

procedure TJvRichEditToHtml.DefineProperties(Filer: TFiler);

  function DoWriteHeader: Boolean;
  begin
    Result := Header.Count = 0;
    if Result and (Filer.Ancestor <> nil) then
    begin
      Result := True;
      if Filer.Ancestor is TJvRichEditToHtml then
        Result := not Header.Equals(TJvRichEditToHtml(Filer.Ancestor).Header)
    end;
  end;

  function DoWriteFooter: Boolean;
  begin
    Result := Footer.Count = 0;
    if Result and (Filer.Ancestor <> nil) then
    begin
      Result := True;
      if Filer.Ancestor is TJvRichEditToHtml then
        Result := not Footer.Equals(TJvRichEditToHtml(Filer.Ancestor).Footer)
    end;
  end;

begin
  inherited DefineProperties(Filer);
  { Write empty Header/Footer to DFM because the default value differs from '' }
  if Filer is TWriter then
  begin
    Filer.DefineProperty('Header.Strings', nil, WriteEmptyStrings, DoWriteHeader);
    Filer.DefineProperty('Footer.Strings', nil, WriteEmptyStrings, DoWriteFooter);
  end;
end;


initialization
//  UniAddJSLibrary('http://cdn.tinymce.com/4/tinymce.min.js', True, [upoPlatformDesktop]);
  UniAddJSLibrary('/files/tinyMCE/tinymce.min.js', True, [upoPlatformDesktop]);

end.
