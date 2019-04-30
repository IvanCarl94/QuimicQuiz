unit U_FrmMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Menus, Vcl.ExtCtrls,
  Vcl.Imaging.GIFImg;

type
  TfrmPrincipal = class(TForm)
    Panel1: TPanel;
    MainMenu1: TMainMenu;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btPlacar: TButton;
    Aquivo1: TMenuItem;
    Cadastrar1: TMenuItem;
    Perguntas1: TMenuItem;
    Consultar1: TMenuItem;
    Perguntas2: TMenuItem;
    Jogadores1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    btJogar: TButton;
    btSair: TButton;
    Image1: TImage;
    edNome: TEdit;
    maskDataNasc: TMaskEdit;
    procedure Sair1Click(Sender: TObject);
    procedure btJogarClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btPlacarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses U_FrmPerguntas, U_Placar;

procedure TfrmPrincipal.btJogarClick(Sender: TObject);
begin
  nome := edNome.Text;
  dataNasc := StrToDate(maskDataNasc.Text);

  frmJogo.ShowModal;
end;

procedure TfrmPrincipal.btPlacarClick(Sender: TObject);
begin
  U_FrmPlacar.ShowModal;
end;

procedure TfrmPrincipal.btSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
   TGIFImage(image1.Picture.Graphic).Animate := True;


end;

procedure TfrmPrincipal.Sair1Click(Sender: TObject);
begin
  Close;
end;

end.
