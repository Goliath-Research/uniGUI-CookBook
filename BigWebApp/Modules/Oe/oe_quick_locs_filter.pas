unit oe_quick_locs_filter;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  oe_quick_ship_locs,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton;

type
  TFrmOeQuickLocsFilter = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Panel3: TUniPanel;
    chkExcludeInTransit: TUniCheckBox;
    chkExcludeHardAlloc: TUniCheckBox;
    chkExcludeExpired: TUniCheckBox;
    chkExcludeNonAlloc: TUniCheckBox;
    chkExcludeNonConform: TUniCheckBox;
    chkExcludeVMI: TUniCheckBox;
    chkExcludeMTO: TUniCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
  private
    FFilter: TDisplayFilter;
    { Private declarations }
    procedure SaveTo(var AFilter: TDisplayFilter);
    procedure LoadFrom(AFilter: TDisplayFilter);
    procedure SetFilter(const Value: TDisplayFilter);
  public
    { Public declarations }
    class function DoShowModal(var AFilter: TDisplayFilter): Boolean;
    property Filter: TDisplayFilter read FFilter write SetFilter;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.RegFrm;

{ TFrmOeQuickLocsFilter }

class function TFrmOeQuickLocsFilter.DoShowModal(var AFilter: TDisplayFilter): Boolean;
var
  LFrmOeQuickLocsFilter : TFrmOeQuickLocsFilter;
begin
  LFrmOeQuickLocsFilter := TFrmOeQuickLocsFilter.Create(uniGUIApplication.UniApplication);
  LFrmOeQuickLocsFilter.Filter := AFilter;
  Result:= LFrmOeQuickLocsFilter.ShowModal = mrOK;
  if Result then
     LFrmOeQuickLocsFilter.SaveTo( AFilter );
end;

procedure TFrmOeQuickLocsFilter.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmOeQuickLocsFilter.SaveTo( var AFilter: TDisplayFilter );
begin
  AFilter.exclude_in_transit   := chkExcludeInTransit.Checked;
  AFilter.exclude_hard_alloc   := chkExcludeHardAlloc.Checked;
  AFilter.exclude_expired      := chkExcludeExpired.Checked;
  AFilter.exclude_non_allocate := chkExcludeNonAlloc.Checked;
  AFilter.exclude_non_conform  := chkExcludeNonConform.Checked;
  AFilter.exclude_vmi          := chkExcludeVMI.Checked;
  AFilter.exclude_make_to_order:= chkExcludeMTO.Checked;
end;

procedure TFrmOeQuickLocsFilter.SetFilter(const Value: TDisplayFilter);
begin
  FFilter := Value;
end;

procedure TFrmOeQuickLocsFilter.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self ]);
  LoadFrom( FFilter );
end;

procedure TFrmOeQuickLocsFilter.LoadFrom( AFilter: TDisplayFilter );
begin
  chkExcludeInTransit.Checked := AFilter.exclude_in_transit;
  chkExcludeHardAlloc.Checked := AFilter.exclude_hard_alloc;
  chkExcludeExpired.Checked   := AFilter.exclude_expired;
  chkExcludeNonAlloc.Checked  := AFilter.exclude_non_allocate;
  chkExcludeNonConform.Checked:= AFilter.exclude_non_conform;
  chkExcludeVMI.Checked       := AFilter.exclude_vmi;
  chkExcludeMTO.Checked       := AFilter.exclude_make_to_order;
end;

end.
