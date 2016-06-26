unit UntMainFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GR32_Image_ml, uMlSkinCtrls, uMlSkinPanel, uMlSkinPng,
  uMlStdCtrl, uMlSkinForm, uMlSkinNCCtrlBase, uMlSkinNCButton, pngimage_ml,
  uMlSkinNCImage, uMlSkinNCLabel, uMlSkinLabel;

type
  TCoverFrm = class(TForm)
    MlSkinPanel1: TMlSkinPanel;
    MlSkinForm1: TMlSkinForm;
    MlSkinSystemButton1: TMlSkinSystemButton;
    MlSkinSystemButton2: TMlSkinSystemButton;
    MlSkinNCImage1: TMlSkinNCImage;
    MlSkinNCLabel1: TMlSkinNCLabel;
    MlSkinLabel1: TMlSkinLabel;
    procedure MlSkinLabel1Click(Sender: TObject);
  private
    function isGenealogyNull():Boolean;
  public
    { Public declarations }
  end;

var
  CoverFrm: TCoverFrm;

implementation

uses UntHomePageFrm, UntAddGenealogyFrm;

{$R *.dfm}

function TCoverFrm.isGenealogyNull: Boolean;
const
  DBName = 'DB\GL.abs';
begin
  Result := False ;
  if FileExists(ExtractFilePath(Application.ExeName)+DBName) then
    Result := True ;
end;

procedure TCoverFrm.MlSkinLabel1Click(Sender: TObject);
begin
  if not isGenealogyNull then
    AddGenealogyFrm.Show
  else
    HomePageFrm.Show;
  Hide;
end;

end.

