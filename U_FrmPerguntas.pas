unit U_FrmPerguntas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Imaging.jpeg, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, Math,
  FireDAC.Comp.Client;

type
  TfrmJogo = class(TForm)
    imgFundo: TImage;
    GroupBox2: TGroupBox;
    GroupBox1: TGroupBox;
    ProgressBar1: TProgressBar;
    lbTempo: TLabel;
    lbQAcertos: TLabel;
    lbQErros: TLabel;
    edAcertos: TEdit;
    edErros: TEdit;
    rdgPergunta: TRadioGroup;
    btAvancar: TButton;
    tempo1: TTimer;
    FDDataPerguntas: TFDConnection;
    FDTransPerguntas: TFDTransaction;
    FDTabelaPerguntas: TFDTable;
    FDTabelaPerguntasPER_COD: TIntegerField;
    FDTabelaPerguntasPER_QUEST: TStringField;
    FDTabelaPerguntasPER_RESP0: TStringField;
    FDTabelaPerguntasPER_RESP1: TStringField;
    FDTabelaPerguntasPER_RESP2: TStringField;
    FDTabelaPerguntasPER_RESP3: TStringField;
    FDTabelaPerguntasPER_RESPCERTA: TIntegerField;
    FDTransaction1: TFDTransaction;
    FDQuery1: TFDQuery;
    FDTransaction2: TFDTransaction;
    FDQuery2: TFDQuery;
    FDQuery1NOME: TStringField;
    FDQuery1DATA_NASCIMENTO: TDateField;
    FDQuery2ID_PONTUACAO: TIntegerField;
    FDQuery2PONTOS: TIntegerField;
    FDQuery2DATA: TDateField;
    FDQuery2ID_JOGADOR: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tempo1Timer(Sender: TObject);
    procedure Limpar;
    procedure Perguntas;
    procedure btAvancarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmJogo: TfrmJogo;
  idJogador, idPontuacao, numpergunta, contagem, acerto, erro, totalAcertos: integer;
  hora: ttime;
  nome : String;
  dataNasc : tdate;

implementation

{$R *.dfm}

uses U_FrmTelaResultado;



procedure TfrmJogo.btAvancarClick(Sender: TObject);
begin
   numpergunta:= numpergunta+1;
   tempo1.Enabled:=false;
  if rdgPergunta.ItemIndex = FDTabelaPerguntasPER_RESPCERTA.Value then
  begin
    inc(acerto);
    ShowMessage('você acertou!!');
    end
    else
    begin
    inc(erro);
    ShowMessage('você errou!!');
    end;

     rdgPergunta.Enabled:=false;
     edAcertos.Text:=IntToStr(acerto);
     edErros.Text:=IntToStr(erro);
     limpar;
     Perguntas;
end;

procedure TfrmJogo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FDTabelaPerguntas.Close;
  Application.Terminate; //Se o usuário fechar, o jogo é automaticamente encerrado
end;

procedure TfrmJogo.FormShow(Sender: TObject);
begin
  acerto:=0;
  erro:=0;
  edAcertos.Text:=IntToStr(acerto);
  edErros.Text:=IntToStr(erro);
  FDTabelaPerguntas.Open();
  numpergunta:=1;
  Perguntas;
end;

procedure TfrmJogo.Limpar;
begin
  rdgPergunta.Items.Clear;
  rdgPergunta.ItemIndex:=-1;
  rdgPergunta.Caption:='';

end;

procedure TfrmJogo.Perguntas;
begin
   hora:=StrTotime('00:00:00');
   ProgressBar1.Position:=0;
   tempo1.Enabled:=true;
   rdgPergunta.Enabled:=true;
   contagem:=1;



   if numpergunta <= FDTabelaPerguntas.RecordCount then
   begin
      FDTabelaPerguntas.Locate('per_cod',numpergunta, []);
   end else begin

     totalAcertos := acerto;
     frmTelaResultado.ShowModal;



     FDQuery1.Open;
     FDQuery1.Insert;
     FDQuery1.FieldByName('NOME').AsString := nome;
     FDQuery1.FieldByName('DATA_NASCIMENTO').AsDateTime := dataNasc;
     FDQuery1.Post;
     FDQuery1.Close;

     FDQuery2.Open;
     FDQuery2.Insert;
     FDQuery2.FieldByName('PONTOS').AsInteger := totalAcertos;
     FDQuery2.FieldByName('DATA').AsDateTime := date;
     FDQuery2.Post;
     FDQuery2.Close;

   end;


   rdgPergunta.Caption:= FDTabelaPerguntasPER_QUEST.Value;
   rdgPergunta.Items.Add(FDTabelaPerguntasPER_RESP0.Value);
   rdgPergunta.Items.Add(FDTabelaPerguntasPER_RESP1.Value);
   rdgPergunta.Items.Add(FDTabelaPerguntasPER_RESP2.Value);
   rdgPergunta.Items.Add(FDTabelaPerguntasPER_RESP3.Value);

   


end;

procedure TfrmJogo.tempo1Timer(Sender: TObject);
begin
  ProgressBar1.Position:=ProgressBar1.Position +3;
  hora:=hora+ StrToTime('00:00:01');
  lbTempo.Caption:=TimeToStr(hora);

  if contagem= 30 then
  begin
    tempo1.Enabled:=false;
    ShowMessage('Tempo Esgotado!');
    Application.Terminate;
  end;
  inc(contagem);

end;

end.
