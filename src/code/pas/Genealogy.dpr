program Genealogy;

uses
  Forms,
  UntMainFrm in 'UntMainFrm.pas' {CoverFrm},
  UntHomePageFrm in 'UntHomePageFrm.pas' {HomePageFrm},
  UntAddGenealogyFrm in 'UntAddGenealogyFrm.pas' {AddGenealogyFrm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TCoverFrm, CoverFrm);
  Application.CreateForm(THomePageFrm, HomePageFrm);
  Application.CreateForm(TAddGenealogyFrm, AddGenealogyFrm);
  Application.Run;
end.
