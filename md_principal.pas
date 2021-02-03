unit md_principal;

interface

uses
  Classes, SysUtils, Vcl.Controls, FireDAC.Stan.Param, Data.DB,
  IWAppForm, IWApplication, IWColor, IWTypes, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWCompLabel, IWHTMLControls, IWCompButton,
  IWBaseComponent, IWBaseHTMLComponent, IWBaseHTML40Component, IWCompExtCtrls,
  IWCompGrids, IWCompCalendar, IWCompListbox, IWCompEdit, IWHTMLTag;

type
  TF_principal = class(TIWAppForm)
    template_principal: TIWTemplateProcessorHTML;
    link_usuario: TIWLink;
    link_sair: TIWLink;
    m_usuarios: TIWLink;
    m_produtos: TIWLink;
    m_sair: TIWLink;
    m_fornecedores: TIWLink;
    Label_USUARIO: TIWLabel;
    m_financeiro: TIWLink;
    m_vendas: TIWLink;
    m_aptos: TIWLink;
    m_feriados: TIWLink;
    m_estoque: TIWLink;
    m_compras: TIWLink;
    m_planodecontas: TIWLink;
    m_lancamentos: TIWLink;
    m_configuracoes: TIWLink;
    m_painel: TIWLink;
    m_lavanderia: TIWLink;
    m_contasapagarreceber: TIWLink;
    m_tabeladeprecos: TIWLink;
    m_relatorios: TIWLink;
    m_relatoriodeestoque: TIWLink;
    m_relatoriodevendas: TIWLink;
    m_relatoriofinanceiro: TIWLink;
    m_suportetecnico: TIWLink;
    bt_entrada: TIWButton;
    bt_pedidos: TIWButton;
    bt_saida: TIWButton;
    bt_confirmaentrada: TIWButton;
    bt_cancelarentrada: TIWButton;
    Timer_DH: TIWTimer;
    Label_DATA: TIWLabel;
    Label_HORA: TIWLabel;
    Label_DIASEMANA: TIWLabel;
    dt_entrada: TIWEdit;
    ed_apto: TIWComboBox;
    ed_tipoapto: TIWEdit;
    ed_situacao: TIWEdit;
    hr_entrada: TIWEdit;
    rc_entrada: TIWEdit;
    ed_produto: TIWComboBox;
    ed_estoque: TIWEdit;
    ed_valorunitario: TIWEdit;
    ed_qtd: TIWEdit;
    ed_valortotal: TIWEdit;
    tipo_locacao: TIWComboBox;
    vr_entrada: TIWEdit;
    dt_saida: TIWEdit;
    hr_saida: TIWEdit;
    rc_saida: TIWEdit;
    vr_saida: TIWEdit;
    bt_confirmapedido: TIWButton;
    bt_cancelapedido: TIWButton;
    bt_confirmasaida: TIWButton;
    bt_cancelasaida: TIWButton;
    ed_data: TIWEdit;
    ed_hora: TIWEdit;

    procedure IWAppFormShow(Sender: TObject);
    procedure Timer_DHAsyncTimer(Sender: TObject; EventParams: TStringList);
    procedure template_principalUnknownTag(const AName: string; var VValue: string);
    procedure AtualizaMostradores();
    procedure UpdateAll;

    procedure clear_diaria;
    procedure clear_entrada;
    procedure clear_saida;
    procedure clear_pedido;
    procedure SyncFields_saida;
    procedure seleciona_apto(opcao: integer);
    procedure seleciona_produto;
    procedure info_apto;
    procedure info_produto;
    procedure totaliza_itens;

    procedure ed_aptoAsyncChange(Sender: TObject; EventParams: TStringList);
    procedure ed_produtoAsyncChange(Sender: TObject; EventParams: TStringList);
    procedure bt_confirmaentradaAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure bt_cancelarentradaClick(Sender: TObject);
    procedure bt_entradaAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure bt_saidaAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure bt_pedidosAsyncClick(Sender: TObject; EventParams: TStringList);

    procedure m_painelClick(Sender: TObject);
    procedure m_aptosClick(Sender: TObject);
    procedure m_feriadosClick(Sender: TObject);
    procedure m_tabeladeprecosClick(Sender: TObject);
    procedure m_vendasClick(Sender: TObject);
    procedure m_estoqueClick(Sender: TObject);
    procedure m_produtosClick(Sender: TObject);
    procedure m_fornecedoresClick(Sender: TObject);
    procedure m_comprasClick(Sender: TObject);
    procedure m_financeiroClick(Sender: TObject);
    procedure m_planodecontasClick(Sender: TObject);
    procedure m_contasapagarreceberClick(Sender: TObject);
    procedure m_lancamentosClick(Sender: TObject);
    procedure m_relatoriosClick(Sender: TObject);
    procedure m_relatoriodeestoqueClick(Sender: TObject);
    procedure m_relatoriodevendasClick(Sender: TObject);
    procedure m_relatoriofinanceiroClick(Sender: TObject);
    procedure m_lavanderiaClick(Sender: TObject);
    procedure m_usuariosClick(Sender: TObject);
    procedure m_suportetecnicoClick(Sender: TObject);
    procedure m_configuracoesClick(Sender: TObject);

    procedure link_usuarioClick(Sender: TObject);
    procedure link_sairClick(Sender: TObject);
    procedure bt_confirmapedidoClick(Sender: TObject);

  public

  end;

const
	dia_semana: array[1..9] of string = (
  'Domingo','Segunda-feira','Terça-feira',  'Quarta-feira','Quinta-feira','Sexta-feira',
  'Sábado','Feriado: ','Véspera de Feriado: ');

var
  FormattedDT: string;
  id_apto: integer;
  id_produto, id_pedido,
  diaria,linha,chv: string;
  valor_un, valor_total, total_vendas: double;
  estq_atual,qtd: integer;

  MyTXT: TextFile;

implementation

{$R *.dfm}

uses
  ServerController, UserSessionUnit,
  md_login, md_aptos, md_feriados, md_tabeladeprecos, md_fornecedores, md_produtos, md_vendas, md_lancamentos,
  md_usuarios;

procedure TF_principal.IWAppFormShow(Sender: TObject);
begin
  if USRLEVEL = '0' then Label_USUARIO.Caption := USRNAME+' (Acesso Limitado)' else
  if USRLEVEL = '1' then Label_USUARIO.Caption := USRNAME+' (Acesso Operacional)' else
  if USRLEVEL = '3' then Label_USUARIO.Caption := USRNAME+' (Acesso Restrito)' else
  if USRLEVEL = '7' then Label_USUARIO.Caption := USRNAME+' (Acesso Gerencial)' else
  if USRLEVEL = '9' then Label_USUARIO.Caption := USRNAME+' (Acesso Administrativo)';
  AtualizaMostradores;
  UpdateAll;
end;

procedure TF_principal.Timer_DHAsyncTimer(Sender: TObject; EventParams: TStringList);
begin
	DateTimeToString(FormattedDT, 'dd/mm/yyyy hh:nn:ss', Now);
  Label_DATA.Caption := copy(formattedDT,1,10);
  Label_HORA.Caption := copy(formattedDT,12,8);
  if Label_HORA.Caption = '00:00:00' then AtualizaMostradores;
end;

procedure TF_principal.totaliza_itens;
begin
  qtd := StrToInt(ed_qtd.Text); valor_total := qtd * valor_un;
  ed_valortotal.Text := FloatToStr(valor_total);
end;

procedure TF_principal.AtualizaMostradores;
begin
	with UserSession do
  begin
    if T_feriados.Locate('DATA',DateToStr(date+1), []) then
    Label_DIASEMANA.Caption := dia_semana[9]+' '+T_feriados.FieldByName('DESCRICAO').Value else
    if T_feriados.Locate('DATA',DateToStr(date), []) then
    Label_DIASEMANA.Caption := dia_semana[8]+' '+T_feriados.FieldByName('DESCRICAO').Value else
    Label_DIASEMANA.Caption := dia_semana[DayOfWeek(date)];
  end;
	DateTimeToString(FormattedDT, 'dd/mm/yyyy hh:nn:ss', Now);
  Label_DATA.Caption := copy(formattedDT,1,10);
  Label_HORA.Caption := copy(formattedDT,12,8);
end;

procedure TF_principal.UpdateAll;
begin
  with UserSession do
  begin
    T_aptos.Close;
    T_aptos.SQL.Clear;
    T_aptos.SQL.Add('SELECT * FROM t_aptos ORDER BY ID ASC ');
    T_aptos.Open();
  end;
end;

procedure TF_principal.template_principalUnknownTag(const AName: string; var VValue: string);
var
  ctd: integer;
  linha: string;
begin
  ctd := 0; linha := '';
  if AName = 'MAPA_DE_OCUPACAO' then
  with UserSession do
  begin
    T_aptos.First;
    while not T_aptos.eof do
    begin
      ctd := ctd + 1;

      if ctd = 1 then
      begin
        VValue := VValue+'<div class="row">'+sLineBreak; // abre linha
      end;

      case T_aptos.FieldByName('ID_SITUACAO').Value of
      0:linha := 'class="col-sm bg-success rounded mt-2 ml-2"'; // livre
      1,2,3,4,5,
      6:linha := 'class="col-sm bg-danger rounded mt-2 ml-2"'; // ocupado
      7:linha := 'class="col-sm bg-warning rounded mt-2 ml-2"'; // em arrumação
      8:linha := 'class="col-sm bg-secondary rounded mt-2 ml-2"'; // manutenção
      9:linha := 'class="col-sm bg-warning rounded mt-2 ml-2"'; // reservado
      end;

      VValue := VValue+
      '<div '+linha+'><p><span style="font-size: 24px;">'+
      T_aptos.FieldByName('APTO').AsString+'</span><br>'+
      T_aptos.FieldByName('TIPO').AsString+'<br>'+
      T_aptos.FieldByName('DIARIA').AsString+'<br><hr><strong>'+
      T_aptos.FieldByName('SITUACAO').AsString+'</strong></p></div>'+
      sLineBreak;

      if ctd = 6 then
      begin
        VValue := VValue + '</div>'+sLineBreak;// fecha linha
        ctd := 0;
      end;

      T_aptos.Next;
    end;

    if (ctd > 1) and (ctd < 6) then
    begin
      repeat
        VValue := VValue+
        '<div class="col-sm rounded mt-2 ml-2">'+
        '<p>&nbsp;</p>'+
        '<p>&nbsp;</p>'+
        '<p>&nbsp;</p>'+
        '<p>&nbsp;</p>'+
        '</div>'+sLineBreak;
        ctd := ctd + 1;
      until ctd = 7;
      VValue := VValue + '</div>'+sLineBreak; // fecha linha
    end;
  end;
end;

procedure TF_principal.clear_diaria;
begin
  tipo_locacao.ItemIndex := 0;
  ed_apto.ItemIndex := 0;
end;

procedure TF_principal.clear_entrada;
begin
	DateTimeToString(FormattedDT, 'dd/mm/yyyy hh:nn:ss', Now);
  dt_entrada.Text := copy(formattedDT,1,10);
  hr_entrada.Text := copy(formattedDT,12,8);
  rc_entrada.Text := USRNAME;
  vr_entrada.Text := '0';
end;

procedure TF_principal.clear_saida;
begin
	DateTimeToString(FormattedDT, 'dd/mm/yyyy hh:nn:ss', Now);
  dt_saida.Text := copy(formattedDT,1,10);
  hr_saida.Text := copy(formattedDT,12,8);
  rc_saida.Text := USRNAME;
  vr_saida.Text := '0';
end;

procedure TF_principal.clear_pedido;
begin
//qtd := 1; estq_atual := 0; valor_un := 0; valor_total := 0;
  ed_data.Text := DateToStr(Date);
  ed_hora.Text := TimeToStr(Time);
  ed_apto.ItemIndex := 0;
  ed_produto.ItemIndex := 0;
  ed_qtd.Text := '1';
  ed_valortotal.Text   := '0,00';
end;

procedure TF_principal.ed_aptoAsyncChange(Sender: TObject;
  EventParams: TStringList);
begin
  info_apto;
end;

procedure TF_principal.ed_produtoAsyncChange(Sender: TObject;
  EventParams: TStringList);
begin
  info_produto;
end;

procedure TF_principal.SyncFields_saida;
begin
	DateTimeToString(FormattedDT, 'dd/mm/yyyy hh:nn:ss', Now);
  dt_saida.Text := copy(formattedDT,1,10);
  dt_saida.Text := copy(formattedDT,12,8);
  with UserSession do
  begin
    T_diarias.FieldByName('ID_SAIDA').Value := T_saidas.FieldByName('ID').Value;
    T_diarias.FieldByName('CHV').Value := 'F';
    { ... }
    T_saidas.FieldByName('ID_DIARIA').Value   := T_diarias.FieldByName('ID').Value;
    T_saidas.FieldByName('DT_SAIDA').AsString := dt_saida.Text;
    T_saidas.FieldByName('HR_SAIDA').AsString := dt_saida.Text;
    T_saidas.FieldByName('RC_SAIDA').AsString := USR_ID;
    T_saidas.FieldByName('VR_SAIDA').AsString := vr_saida.Text;
  end;
end;

procedure TF_principal.seleciona_apto(opcao: integer);
begin
  with UserSession do
  begin
    T_aptos.Close;
    T_aptos.SQL.Clear;
    case opcao of
    1:T_aptos.SQL.Add('SELECT * FROM t_aptos WHERE ID_SITUACAO = 0 ORDER BY APTO ASC '); // APTOS LIVRES
    2:T_aptos.SQL.Add('SELECT * FROM t_aptos WHERE ID_SITUACAO BETWEEN 1 AND 6 ORDER BY APTO ASC '); // APTOS OCUPADOS (EM USO)
    3:T_aptos.SQL.Add('SELECT * FROM t_aptos WHERE ID_SITUACAO BETWEEN 8 AND 9 ORDER BY APTO ASC '); // APTOS EM MANUTENÇÃO OU RESERVADOS
    4:T_aptos.SQL.Add('SELECT * FROM t_aptos WHERE ID_SITUACAO = 7 ORDER BY APTO ASC '); // APTOS EM ARRUMAÇÃO
    end;

    T_aptos.Open();
    ed_apto.Items.Clear;
    while not T_aptos.Eof do
    begin
      ed_apto.Items.AddObject(T_aptos.FieldByName('APTO').AsString, TObject(T_aptos.FieldByName('ID').AsInteger));
      T_aptos.Next;
    end;
  end;
  ed_apto.ItemIndex := 0;
end;

procedure TF_principal.seleciona_produto;
begin
  with UserSession do
  begin
    T_produtos.Close;
    T_produtos.SQL.Clear;
    T_produtos.SQL.Add('SELECT * FROM t_produtos ORDER BY PRODUTO ASC ');
    T_produtos.Open();
    ed_produto.Items.Clear;
    while not T_produtos.Eof do
    begin
      ed_produto.Items.AddObject(T_produtos.FieldByName('PRODUTO').AsString, TObject(T_produtos.FieldByName('ID').AsInteger));
      T_produtos.Next;
    end;
  end;
  ed_produto.ItemIndex := 0;
end;

procedure TF_principal.info_apto;
begin
  with UserSession do
  begin
    T_aptos.Close;
    T_aptos.SQL.Clear;
    T_aptos.SQL.Add('SELECT * FROM t_aptos WHERE APTO = :CHV ');
    T_aptos.ParamByName('CHV').Value := ed_apto.Text;
    T_aptos.Open();
    if not T_aptos.IsEmpty then
    begin
      id_apto := T_aptos.FieldByName('ID').Value;
      ed_tipoapto.Text := T_aptos.FieldByName('TIPO').Value;
      case T_aptos.FieldByName('ID_SITUACAO').Value of
      0:ed_situacao.Text := 'LIVRE';
      1:ed_situacao.Text := 'HORA';
      2:ed_situacao.Text := 'PERNOITE';
      3:ed_situacao.Text := 'DIÁRIA';
      4:ed_situacao.Text := 'PROMO 02 HORAS';
      5:ed_situacao.Text := 'PROMO 03 HORAS';
      6:ed_situacao.Text := 'DIÁRIA 24 HORAS';
      7:ed_situacao.Text := 'MANUTENÇÃO';
      8:ed_situacao.Text := 'EM ARRUMAÇÃO';
      9:ed_situacao.Text := 'RESERVADO';
      end;
    end;
  end;
end;

procedure TF_principal.info_produto;
begin
  with UserSession do
  begin
    T_produtos.Close;
    T_produtos.SQL.Clear;
    T_produtos.SQL.Add('SELECT * FROM t_produtos WHERE PRODUTO = :CHV ');
    T_produtos.ParamByName('CHV').Value := ed_produto.Text;
    T_produtos.Open();
    if not T_produtos.IsEmpty then
    begin
      id_produto := T_produtos.FieldByName('ID').AsString;
      estq_atual := T_produtos.FieldByName('ESTQ_ATUAL').AsInteger; ed_estoque.Text := IntToStr(estq_atual);
      valor_un   := T_produtos.FieldByName('VALOR').Value; ed_valorunitario.Text := FloatToStr(valor_un);
    end;
  end;
end;

procedure TF_principal.bt_entradaAsyncClick(Sender: TObject; EventParams: TStringList);
begin
  seleciona_apto(1); // seleciona aptos livres
  clear_diaria; clear_entrada; info_apto;
  WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#ABRIR_CONTA'').modal(''show'');');
  tipo_locacao.SetFocus;
end;

procedure TF_principal.bt_confirmaentradaAsyncClick(Sender: TObject; EventParams: TStringList);
begin
  with UserSession do
  begin
    if T_aptos.FieldByName('ID_SITUACAO').Value <> 0 then
    begin
      WebApplication.ShowMessage('Atenção! Apto indisponível no momento!');
      ed_apto.SetFocus;
      exit;
    end;
    T_diarias.Insert;
    T_diarias.FieldByName('ID_APTO').Value := Integer(ed_apto.Items.Objects[ed_apto.ItemIndex]);
    T_diarias.FieldByName('TIPO_LOCACAO').Value := tipo_locacao.ItemIndex;
    T_diarias.FieldByName('CHV').Value := 'A';
    DateTimeToString(FormattedDT, 'dd/mm/yyyy hh:nn:ss', Now);
    dt_entrada.Text := copy(formattedDT,1,10);
    hr_entrada.Text := copy(formattedDT,12,8);
    T_entradas.Insert;
    T_entradas.FieldByName('ID_DIARIA').Value     := 0;
    T_entradas.FieldByName('DT_ENTRADA').AsString := dt_entrada.Text;
    T_entradas.FieldByName('HR_ENTRADA').AsString := hr_entrada.Text;
    T_entradas.FieldByName('RC_ENTRADA').AsString := USR_ID;
    T_entradas.FieldByName('VR_ENTRADA').AsString := vr_entrada.Text;
    T_entradas.Post;
    T_diarias.FieldByName('ID_ENTRADA').Value := T_entradas.FieldByName('ID').Value;
    T_diarias.FieldByName('ID_SAIDA').Value := 0;
    T_diarias.Post;
    T_entradas.Edit;
    T_entradas.FieldByName('ID_DIARIA').Value := T_diarias.FieldByName('ID').Value;
    T_entradas.Post;

    if T_aptos.Locate('ID', T_diarias.FieldByName('ID_APTO').Value, []) then
    begin
      T_aptos.Edit;
      case tipo_locacao.ItemIndex of
      0:T_aptos.FieldByName('ID_SITUACAO').Value := 1;
      1:T_aptos.FieldByName('ID_SITUACAO').Value := 2;
      2:T_aptos.FieldByName('ID_SITUACAO').Value := 3;
      3:T_aptos.FieldByName('ID_SITUACAO').Value := 4;
      4:T_aptos.FieldByName('ID_SITUACAO').Value := 5;
      5:T_aptos.FieldByName('ID_SITUACAO').Value := 6;
      6:T_aptos.FieldByName('ID_SITUACAO').Value := 9;
      end;
      diaria := T_diarias.FieldByName('ID').AsString;  diaria := Insert_L(diaria,6,'0');
      T_aptos.FieldByName('DIARIA').Value := diaria;
      T_aptos.Post;
    end;
  end;
  UpdateAll;
  WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#ABRIR_CONTA'').modal(''hide'');');
  WebApplication.CallBackResponse.AddJavaScriptToExecute('location.reload()');
end;

procedure TF_principal.bt_confirmapedidoClick(Sender: TObject);
begin
  totaliza_itens;
  ed_data.Text := DateToStr(Date);
  ed_hora.Text := TimeToStr(Time);
  with UserSession do
  begin
    T_pedidos.FieldByName('ID_DIARIA').Value := T_diarias.FieldByName('ID').Value;
    T_pedidos.FieldByName('DATA').AsString := ed_data.Text;
    T_pedidos.FieldByName('HORA').AsString := ed_hora.Text;
    T_pedidos.FieldByName('ID_PRODUTO').Value := Integer(ed_produto.Items.Objects[ed_produto.ItemIndex]);
    T_pedidos.FieldByName('QTD').Value := Integer(ed_qtd.Text);
    T_pedidos.FieldByName('VALOR_TOTAL').Value := ed_valortotal.Text;
    T_pedidos.FieldByName('CHV').AsString := 'A';
    T_pedidos.Post;

    T_produtos.Close;
    T_produtos.SQL.Clear;
    T_produtos.SQL.Add('UPDATE t_produtos SET ESTQ_ATUAL = :ESTQ_ATUAL WHERE ID = :ID_PRODUTO ');
    T_produtos.ParamByName('ESTQ_ATUAL').Value := estq_atual - StrToInt(ed_qtd.Text);
    T_produtos.ParamByName('ID_PRODUTO').Value := id_produto;
    T_produtos.ExecSQL;
    clear_pedido;
    UpdateAll;
  end;
end;

procedure TF_principal.bt_cancelarentradaClick(Sender: TObject);
begin
  WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#ABRIR_CONTA'').modal(''hide'');');
end;

procedure TF_principal.bt_saidaAsyncClick(Sender: TObject; EventParams: TStringList);
begin
  WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#FECHAR_CONTA'').modal(''show'');');
end;

procedure TF_principal.bt_pedidosAsyncClick(Sender: TObject; EventParams: TStringList);
begin
  seleciona_apto(2); // seleciona aptos em uso (hora, pernoite, diária, promo 2h, promo 3h, 24h)
  seleciona_produto;
  clear_pedido; info_produto;
  UserSession.T_pedidos.Insert;
  WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#LANCAR_PEDIDOS'').modal(''show'');');
  ed_produto.SetFocus;
end;

{ ... }

procedure TF_principal.m_painelClick(Sender: TObject);
begin
{  TF_menu.Create(WebApplication).Show; }
end;

procedure TF_principal.m_aptosClick(Sender: TObject);
begin
  TF_aptos.Create(WebApplication).Show;
end;

procedure TF_principal.m_tabeladeprecosClick(Sender: TObject);
begin
  TF_tabeladeprecos.Create(WebApplication).Show;
end;

procedure TF_principal.m_feriadosClick(Sender: TObject);
begin
  TF_feriados.Create(WebApplication).Show;
end;

procedure TF_principal.m_vendasClick(Sender: TObject);
begin
  TF_vendas.Create(WebApplication).Show;
end;

procedure TF_principal.m_estoqueClick(Sender: TObject);
begin
{ separador de linha }
end;

procedure TF_principal.m_produtosClick(Sender: TObject);
begin
  TF_produtos.Create(WebApplication).Show;
end;

procedure TF_principal.m_fornecedoresClick(Sender: TObject);
begin
  TF_fornecedores.Create(WebApplication).Show;
end;

procedure TF_principal.m_comprasClick(Sender: TObject);
begin
{  TF_compras.Create(WebApplication).Show; }
end;

procedure TF_principal.m_financeiroClick(Sender: TObject);
begin
{  separador de linha }
end;

procedure TF_principal.m_planodecontasClick(Sender: TObject);
begin
{  TF_contas.Create(WebApplication).Show; }
end;

procedure TF_principal.m_contasapagarreceberClick(Sender: TObject);
begin
{  TF_contasapagarreceber.Create(WebApplication).Show; }
end;

procedure TF_principal.m_lancamentosClick(Sender: TObject);
begin
  TF_lancamentos.Create(WebApplication).Show;
end;

procedure TF_principal.m_relatoriosClick(Sender: TObject);
begin
{ separador de linha }
end;

procedure TF_principal.m_relatoriodeestoqueClick(Sender: TObject);
begin
{  TF_relatoriodeestoque.Create(WebApplication).Show; }
end;

procedure TF_principal.m_relatoriodevendasClick(Sender: TObject);
begin
{  TF_relatoriodevendas.Create(WebApplication).Show; }
end;

procedure TF_principal.m_relatoriofinanceiroClick(Sender: TObject);
begin
{  TF_relatoriofinanceiro.Create(WebApplication).Show; }
end;

procedure TF_principal.m_lavanderiaClick(Sender: TObject);
begin
{  TF_lavanderia.Create(WebApplication).Show; }
end;

procedure TF_principal.m_usuariosClick(Sender: TObject);
begin
  TF_usuarios.Create(WebApplication).Show;
end;

procedure TF_principal.m_suportetecnicoClick(Sender: TObject);
begin
{  TF_suportetecnico.Create(WebApplication).Show; }
end;

procedure TF_principal.m_configuracoesClick(Sender: TObject);
begin
{  TF_configuracoes.Create(WebApplication).Show; }
end;

procedure TF_principal.link_usuarioClick(Sender: TObject);
begin
  TF_usuarios.Create(WebApplication).Show;
end;

procedure TF_principal.link_sairClick(Sender: TObject);
begin
  TF_login.Create(WebApplication).Show;
end;

end.
