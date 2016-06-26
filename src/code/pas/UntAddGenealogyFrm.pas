unit UntAddGenealogyFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uMlSkinNCCtrlBase, uMlSkinNCButton, uMlStdCtrl, uMlSkinForm,
  uMlSkinNCLabel, uMlSkinAlphaForm, uMlSkinEdit, GR32_Image_ml,
  uMlSkinCtrls, uMlSkinPanel, uMlSkinLabel, uMlCustomButton,
  uMlSkinColorButton, ABSMain,uMlSkinMessageBox, uMlSkinPasswordEdit;

type
  TAddGenealogyFrm = class(TForm)
    MlSkinForm1: TMlSkinForm;
    MlSkinSystemButton1: TMlSkinSystemButton;
    MlSkinSystemButton2: TMlSkinSystemButton;
    MlSkinNCLabel1: TMlSkinNCLabel;
    MlSkinLabel1: TMlSkinLabel;
    MlSkinEdit1: TMlSkinEdit;
    MlSkinColorButton1: TMlSkinColorButton;
    db: TABSDatabase;
    MlSkinLabel2: TMlSkinLabel;
    MlSkinLabel3: TMlSkinLabel;
    edtPsw: TMlSkinPasswordEdit;
    edtPswConfirm: TMlSkinPasswordEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MlSkinColorButton1Click(Sender: TObject);
  private
    function isPswValid():Boolean;
  public
    { Public declarations }
  end;

var
  AddGenealogyFrm: TAddGenealogyFrm;

implementation

uses UntMainFrm;

{$R *.dfm}

procedure TAddGenealogyFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if CoverFrm<>nil then
    CoverFrm.Close ;
end;

function TAddGenealogyFrm.isPswValid: Boolean;
begin
  if edtPsw.Text<>edtPswConfirm.Text then
  begin
    Result := False ;
    MlMessageBox('错误', '两次输入的密码不一致', biError, []);
  end else
  begin
    Result := True ;
  end;
end;

procedure TAddGenealogyFrm.MlSkinColorButton1Click(Sender: TObject);
const
  DBName = 'DB\GL.abs';
begin
  if not isPswValid then
  begin
    Exit ;
  end;
  with db do
  begin
    Close;
    DatabaseFileName := ExtractFilePath(Application.ExeName)+DBName;
    DatabaseName := 'GL' ;
    Password := edtPsw.Text;
    CreateDatabase;
    MlMessageBox('成功', '族谱创建成功', biInformation, []);
    Self.Close ;
  end;
end;

end.
