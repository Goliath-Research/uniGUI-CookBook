unit color_group;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  Mask,
  Vcl.Wwdatsrc,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.Controls, Vcl.StdCtrls, Vcl.ExtCtrls,
  IQUniGrid, uniGUIFrame;

type
  TFrmColorGroup = class(TUniForm)
    wwDataSource1: TDataSource;
    wwTable1: TFDTable;
    wwDBGrid1: TIQUniGridControl;
    wwDBComboDlgColorCode: TUniEdit;
    wwTable1ID: TBCDField;
    wwTable1CODE: TBCDField;
    wwTable1DESCRIP: TStringField;
    wwTable1DispColor: TStringField;
    ColorBoxDummy: TColorBox;
    ColorDialog1: TColorDialog;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wwTable1BeforePost(DataSet: TDataSet);
    procedure wwDBComboDlgColorCodeCustomDlg(Sender: TObject);

    { TODO -oSanketG -cWC : Need to revisit ,
    [dcc32 Error] color_group.pas(51): E2003 Undeclared identifier: 'TGridDrawState'}
    {procedure wwDBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);}
    procedure wwTable1CalcFields(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure wwTable1NewRecord(DataSet: TDataSet);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure DoShow;
  end;



implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.HelpHook,
  iqsys_rscstr;

class procedure TFrmColorGroup.DoShow;
var
  FrmColorGroup: TFrmColorGroup;
begin
  FrmColorGroup := self.Create(uniGUIApplication.uniApplication);
  FrmColorGroup.Show;
end;

procedure TFrmColorGroup.FormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self, wwDBGrid1 ]);
end;

procedure TFrmColorGroup.UniFormShow(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
end;

procedure TFrmColorGroup.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBGrid1 ]);
end;


procedure TFrmColorGroup.wwTable1BeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet );
end;

procedure TFrmColorGroup.wwDBComboDlgColorCodeCustomDlg(Sender: TObject);
begin
  (*with ColorDialog1 do
  begin
    if not (wwTable1CODE.IsNull) then
    begin
      Color:= wwTable1CODE.asInteger;
      if wwTable1DispColor.asString = iqsys_rscstr.cTXT0000063{'Custom'} then
         CustomColors.Text:= Format(iqsys_rscstr.cTXT0000064{'ColorA=%.8x'},
          [ wwTable1CODE.asInteger ]);
    end;

    if Execute then
    begin
      wwTable1.Edit;
      wwTable1CODE.AsFloat:= ColorToRGB( Color );
    end;
  end;  *)
end;

(*procedure TFrmColorGroup.wwDBGrid1DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
var
  LRect: TRect;
  XRect: TRect;
  LBackground: TColor;

  function ColorToBorderColor(AColor: TColor): TColor;
  type
    TColorQuad = record
      Red,
      Green,
      Blue,
      Alpha: Byte;
    end;
  begin
    if (TColorQuad(AColor).Red > 192) or
       (TColorQuad(AColor).Green > 192) or
       (TColorQuad(AColor).Blue > 192) then
      Result := clBlack
   else if gdSelected in State then
      Result := clWhite
    else
      Result := AColor;
  end;

begin
  if wwTable1CODE.IsNull or (Field <> wwTable1DispColor) then
     EXIT;

  with wwDBGrid1.Canvas do
  begin
    {blank cell}
    FillRect(Rect);
    LBackground:= Brush.Color;

    {prepare color square}
    LRect:= Rect;
    LRect.Right:= LRect.Bottom - LRect.Top + LRect.Left;
    InflateRect(LRect, -1, -1);

    {color the square + frame}
    Brush.Color:= wwTable1CODE.asInteger;
    FillRect(LRect);
    Brush.Color := ColorToBorderColor(ColorToRGB(Brush.Color));
    FrameRect(LRect);

    {restore brush}
    Brush.Color := LBackground;
    XRect:= Rect;
    XRect.Left := LRect.Right + 5;

    {output text}
    TextRect( XRect,
              XRect.Left,
              XRect.Top + (XRect.Bottom - XRect.Top - TextHeight( wwTable1DispColor.asString )) div 2,
              wwTable1DispColor.asString);
  end;
end;*)

procedure TFrmColorGroup.wwTable1NewRecord(DataSet: TDataSet);
begin
  wwTable1ID.Clear;
end;

procedure TFrmColorGroup.wwTable1CalcFields(DataSet: TDataSet);
var
  I: Integer;
begin
  if wwTable1CODE.IsNull then EXIT;

  I:= -1;
  {with ColorBoxDummy do
    I:= Items.IndexOfObject( TObject( TColor( wwTable1CODE.asInteger )));}

 if I > -1 then
    wwTable1DispColor.asString:= ColorBoxDummy.Items[ I ]
 else
    wwTable1DispColor.asString:= iqsys_rscstr.cTXT0000063; // 'Custom'
end;

procedure TFrmColorGroup.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmSETUP{CHM}, iqhtmSETUPch4{HTM} );  {IQMS.Common.HelpHook.pas}
end;

end.
