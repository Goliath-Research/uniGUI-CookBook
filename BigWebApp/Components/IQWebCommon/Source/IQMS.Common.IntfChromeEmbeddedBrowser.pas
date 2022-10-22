unit IQMS.ChromeEmbeddedBrowser;

interface

type
  IChromeEmbeddedBrowser = interface
    ['{CFD89445-DE3A-4D65-8B16-E830B6F816DC}']
    procedure Show(
      AURL: string;
      AHelpFileName: string = '';
      AHelpContext: string = '';
      AShowCloseButton: Boolean = False;
      AShowMaximized: Boolean = False);
    procedure ShowDialog(
      AURL: string;
      AHelpFileName: string = '';
      AHelpContext: string = '';
      AShowCloseButton: Boolean = False;
      AShowMaximized: Boolean = False);
  end;

implementation

end.
