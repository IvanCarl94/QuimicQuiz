program ProjQuimicQuiz;

uses
  Vcl.Forms,
  U_FrmPerguntas in 'U_FrmPerguntas.pas' {frmJogo},
  U_FrmMenu in 'U_FrmMenu.pas' {frmPrincipal},
  U_FrmTelaResultado in 'U_FrmTelaResultado.pas' {frmTelaResultado},
  Vcl.Themes,
  Vcl.Styles,
  U_Placar in 'U_Placar.pas' {U_FrmPlacar};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'QuimicQuiz';
  TStyleManager.TrySetStyle('Aqua Light Slate');
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmJogo, frmJogo);
  Application.CreateForm(TfrmTelaResultado, frmTelaResultado);
  Application.CreateForm(TU_FrmPlacar, U_FrmPlacar);
  Application.Run;
end.
