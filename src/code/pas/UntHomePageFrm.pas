unit UntHomePageFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  THomePageFrm = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HomePageFrm: THomePageFrm;

implementation

uses UntMainFrm;

{$R *.dfm}

procedure THomePageFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if CoverFrm<>nil then
    CoverFrm.Close ;
end;

end.
