unit U_FrmTelaResultado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmTelaResultado = class(TForm)
    Panel1: TPanel;
    lbResultado: TLabel;
    Label1: TLabel;
    btJogarNovamente: TButton;
    btVerPlacar: TButton;
    btSair: TButton;
    procedure btSairClick(Sender: TObject);
    procedure btVerPlacarClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTelaResultado: TfrmTelaResultado;

implementation

{$R *.dfm}

uses U_FrmPerguntas, U_FrmMenu, U_Placar;

procedure TfrmTelaResultado.btSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmTelaResultado.btVerPlacarClick(Sender: TObject);
begin
  U_FrmPlacar.ShowModal;
end;
end.
