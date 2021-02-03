unit md_tabeladeprecos;

interface

uses
  Classes, SysUtils, Data.DB, FireDAC.Stan.Param,
  IWAppForm, IWApplication, IWColor, IWTypes, IWCompLabel,
  IWCompButton, Vcl.Controls, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWHTMLControls, IWCompRadioButton,
  IWCompListbox, IWCompEdit, IWVCLComponent, IWBaseLayoutComponent,
  IWBaseContainerLayout, IWContainerLayout, IWTemplateProcessorHTML, IWHTMLTag;

type
  TF_tabeladeprecos = class(TIWAppForm)
    link_home: TIWLink;
    bt_incluir: TIWButton;
    bt_editar: TIWButton;
    bt_excluir: TIWButton;
    bt_ok: TIWButton;
    bt_cancelar: TIWButton;
    bt_buscar: TIWButton;
    bt_imprimir: TIWButton;
    m_painel: TIWLink;
    m_aptos: TIWLink;
    m_feriados: TIWLink;
    m_tabeladeprecos: TIWLink;
    m_vendas: TIWLink;
    m_estoque: TIWLink;
    m_produtos: TIWLink;
    m_fornecedores: TIWLink;
    m_compras: TIWLink;
    m_financeiro: TIWLink;
    m_planodecontas: TIWLink;
    m_contasapagarreceber: TIWLink;
    m_lancamentos: TIWLink;
    m_relatorios: TIWLink;
    m_relatoriodeestoque: TIWLink;
    m_relatoriodevendas: TIWLink;
    m_relatoriofinanceiro: TIWLink;
    m_lavanderia: TIWLink;
    m_usuarios: TIWLink;
    m_suportetecnico: TIWLink;
    m_configuracoes: TIWLink;
    m_sair: TIWLink;
    link_usuario: TIWLink;
    link_sair: TIWLink;
    Label_1: TIWLabel;
    ed_pernoite: TIWEdit;
    ed_id: TIWEdit;
    ed_horaexced: TIWEdit;
    ed_buscar: TIWEdit;
    ed_descricao: TIWEdit;
    ed_hora: TIWEdit;
    ed_tipo: TIWComboBox;
    Tabela_A: TIWRadioButton;
    Tabela_B: TIWRadioButton;
    Tabela_C: TIWRadioButton;
    ed_p_entrada: TIWEdit;
    ed_p_saida: TIWEdit;
    ed_diaria: TIWEdit;
    ed_d_entrada: TIWEdit;
    ed_d_saida: TIWEdit;
    ed_promo2H: TIWEdit;
    ed_promo3H: TIWEdit;
    ed_i_hora: TIWEdit;
    ed_t_hora: TIWEdit;
    ed_24H: TIWEdit;
    ed_i_dia: TIWComboBox;
    ed_t_dia: TIWComboBox;
    template_tabeladeprecos: TIWTemplateProcessorHTML;

    procedure IWAppFormShow(Sender: TObject);
    procedure template_tabeladeprecosUnknownTag(const AName: string; var VValue: string);

    procedure m_painelClick(Sender: TObject);
    procedure m_apartamentosClick(Sender: TObject);
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

    procedure link_homeClick(Sender: TObject);
    procedure link_usuarioClick(Sender: TObject);
    procedure link_sairClick(Sender: TObject);

    procedure ClearFields();
    procedure SyncFields();
    procedure UpdateAll();
    procedure Search();
    procedure LoadCombobox;
    procedure ed_buscarHTMLTag(ASender: TObject; ATag: TIWHTMLTag);
    procedure ed_p_entradaHTMLTag(ASender: TObject; ATag: TIWHTMLTag);
    procedure ed_p_saidaHTMLTag(ASender: TObject; ATag: TIWHTMLTag);
    procedure ed_d_entradaHTMLTag(ASender: TObject; ATag: TIWHTMLTag);
    procedure ed_d_saidaHTMLTag(ASender: TObject; ATag: TIWHTMLTag);
    procedure ed_i_horaHTMLTag(ASender: TObject; ATag: TIWHTMLTag);
    procedure ed_t_horaHTMLTag(ASender: TObject; ATag: TIWHTMLTag);

    procedure bt_incluirAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure bt_editarAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure bt_excluirClick(Sender: TObject);
    procedure bt_buscarClick(Sender: TObject);
    procedure bt_okAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure bt_cancelarClick(Sender: TObject);
    procedure ed_tipoAsyncEnter(Sender: TObject; EventParams: TStringList);

  public

  end;

implementation

{$R *.dfm}

uses
  ServerController, UserSessionUnit,
  md_login, md_principal, md_aptos, md_feriados, md_fornecedores, md_produtos, md_vendas, md_lancamentos,
  md_usuarios;

procedure TF_tabeladeprecos.IWAppFormShow(Sender: TObject);
begin
  Label_1.Caption := USRNAME;
  UpdateAll;
end;

procedure TF_tabeladeprecos.template_tabeladeprecosUnknownTag(const AName: string; var VValue: string);
begin
  if AName = 'GRID_TABELADEPRECOS' then
  begin
    with UserSession do
    begin
      T_tabeladeprecos.First;
      while not T_tabeladeprecos.eof do
      begin
        VValue := VValue + '<tr>'+
        '<td>'+T_tabeladeprecos.FieldByName('TIPO').AsString+'</td>'+sLineBreak+
        '<td>'+T_tabeladeprecos.FieldByName('DESCRICAO').AsString+'</td>'+sLineBreak+
        '<td>'+FloatToStrF(T_tabeladeprecos.FieldByName('HORA').Value,ffCurrency,10,2)+'</td>'+sLineBreak+
        '<td>'+FloatToStrF(T_tabeladeprecos.FieldByName('HORA_EXCED').Value,ffCurrency,10,2)+'</td>'+sLineBreak+
        '<td>'+FloatToStrF(T_tabeladeprecos.FieldByName('PERNOITE').Value,ffCurrency,10,2)+'</td>'+sLineBreak+
        '<td>'+FloatToStrF(T_tabeladeprecos.FieldByName('DIARIA').Value,ffCurrency,10,2)+'</td>'+sLineBreak+
        '<td>'+FloatToStrF(T_tabeladeprecos.FieldByName('PROMO_2H').Value,ffCurrency,10,2)+'</td>'+sLineBreak+
        '<td>'+FloatToStrF(T_tabeladeprecos.FieldByName('PROMO_3H').Value,ffCurrency,10,2)+'</td>'+sLineBreak+
        '<td>'+FloatToStrF(T_tabeladeprecos.FieldByName('24H').Value,ffCurrency,10,2)+'</td>'+sLineBreak+
        '<td>'+
        '<a href="#" class="buttom" onclick="return getItemId('+T_tabeladeprecos.FieldByName('ID').AsString+', ''editar'')"><img src="icons/931.bmp" width="32" alt="EDITAR" title="EDITAR"></a> '+
        '<a href="#" class="buttom" onclick="return getItemId('+T_tabeladeprecos.FieldByName('ID').AsString+', ''excluir'')"><img src="icons/938.bmp" width="32" alt="EXCLUIR" title="EXCLUIR"></a>'+
        '</td>'+sLineBreak+'</tr>';
        T_tabeladeprecos.Next;
      end;
    end;
  end;
end;

procedure TF_tabeladeprecos.m_painelClick(Sender: TObject);
begin
  TF_principal.Create(WebApplication).Show;
end;

procedure TF_tabeladeprecos.m_apartamentosClick(Sender: TObject);
begin
  TF_aptos.Create(WebApplication).Show;
end;

procedure TF_tabeladeprecos.m_tabeladeprecosClick(Sender: TObject);
begin
{  TF_tabeladeprecos.Create(WebApplication).Show; }
end;

procedure TF_tabeladeprecos.m_feriadosClick(Sender: TObject);
begin
  TF_feriados.Create(WebApplication).Show;
end;

procedure TF_tabeladeprecos.m_vendasClick(Sender: TObject);
begin
  TF_vendas.Create(WebApplication).Show;
end;

procedure TF_tabeladeprecos.m_estoqueClick(Sender: TObject);
begin
{ separador de linha }
end;

procedure TF_tabeladeprecos.m_produtosClick(Sender: TObject);
begin
  TF_produtos.Create(WebApplication).Show;
end;

procedure TF_tabeladeprecos.m_fornecedoresClick(Sender: TObject);
begin
  TF_fornecedores.Create(WebApplication).Show;
end;

procedure TF_tabeladeprecos.m_comprasClick(Sender: TObject);
begin
{  TF_compras.Create(WebApplication).Show; }
end;

procedure TF_tabeladeprecos.m_financeiroClick(Sender: TObject);
begin
{  separador de linha }
end;

procedure TF_tabeladeprecos.m_planodecontasClick(Sender: TObject);
begin
{  TF_contas.Create(WebApplication).Show; }
end;

procedure TF_tabeladeprecos.m_contasapagarreceberClick(Sender: TObject);
begin
{  TF_contasapagarreceber.Create(WebApplication).Show; }
end;

procedure TF_tabeladeprecos.m_lancamentosClick(Sender: TObject);
begin
  TF_lancamentos.Create(WebApplication).Show;
end;

procedure TF_tabeladeprecos.m_relatoriosClick(Sender: TObject);
begin
{ separador de linha }
end;

procedure TF_tabeladeprecos.m_relatoriodeestoqueClick(Sender: TObject);
begin
{  TF_relatoriodeestoque.Create(WebApplication).Show; }
end;

procedure TF_tabeladeprecos.m_relatoriodevendasClick(Sender: TObject);
begin
{  TF_relatoriodevendas.Create(WebApplication).Show; }
end;

procedure TF_tabeladeprecos.m_relatoriofinanceiroClick(Sender: TObject);
begin
{  TF_relatoriofinanceiro.Create(WebApplication).Show; }
end;

procedure TF_tabeladeprecos.m_lavanderiaClick(Sender: TObject);
begin
{  TF_lavanderia.Create(WebApplication).Show; }
end;

procedure TF_tabeladeprecos.m_usuariosClick(Sender: TObject);
begin
  TF_usuarios.Create(WebApplication).Show;
end;

procedure TF_tabeladeprecos.m_suportetecnicoClick(Sender: TObject);
begin
{  TF_suportetecnico.Create(WebApplication).Show; }
end;

procedure TF_tabeladeprecos.m_configuracoesClick(Sender: TObject);
begin
{  TF_configuracoes.Create(WebApplication).Show; }
end;

procedure TF_tabeladeprecos.link_homeClick(Sender: TObject);
begin
  TF_principal.Create(WebApplication).Show;
end;

procedure TF_tabeladeprecos.link_usuarioClick(Sender: TObject);
begin
  TF_usuarios.Create(WebApplication).Show;
end;

procedure TF_tabeladeprecos.link_sairClick(Sender: TObject);
begin
  TF_login.Create(WebApplication).Show;
end;

{ ... }

procedure TF_tabeladeprecos.ClearFields;
begin
  ed_tipo.ItemIndex := 0;
  ed_descricao.Text := '';
  Tabela_A.Checked := True;
  ed_i_dia.ItemIndex := 0;
  ed_i_hora.Text := '00:00';
  ed_t_dia.ItemIndex := 6;
  ed_t_hora.Text := '23:59';
  ed_hora.Text := '';
  ed_horaexced.Text := '';
  ed_promo2H.Text := '';
  ed_promo3H.Text := '';
  ed_pernoite.Text := '';
  ed_p_entrada.Text := '19:00';
  ed_p_saida.Text := '12:00';
  ed_diaria.Text := '';
  ed_d_entrada.Text := '07:00';
  ed_d_saida.Text := '17:00';
  ed_24H.Text := '';
end;

procedure TF_tabeladeprecos.SyncFields;
begin
  with UserSession do
  begin
    T_tabeladeprecos.FieldByName('ID_TIPO').Value := ed_tipo.ItemIndex+1;
    T_tabeladeprecos.FieldByName('DESCRICAO').Value := ed_descricao.Text;
    if Tabela_A.Checked then T_tabeladeprecos.FieldByName('TABELA').Value := 'A';
    if Tabela_B.Checked then T_tabeladeprecos.FieldByName('TABELA').Value := 'B';
    if Tabela_C.Checked then T_tabeladeprecos.FieldByName('TABELA').Value := 'C';
    T_tabeladeprecos.FieldByName('I_DIA').Value  := ed_i_dia.ItemIndex+1;
    T_tabeladeprecos.FieldByName('I_HORA').Value  := ed_i_hora.Text;
    T_tabeladeprecos.FieldByName('T_DIA').Value  := ed_t_dia.ItemIndex+1;
    T_tabeladeprecos.FieldByName('T_HORA').Value  := ed_t_hora.Text;
    T_tabeladeprecos.FieldByName('HORA').Value := ed_hora.Text;
    T_tabeladeprecos.FieldByName('HORA_EXCED').Value  := ed_horaexced.Text;
    T_tabeladeprecos.FieldByName('PROMO_2H').Value  := ed_promo2H.Text;
    T_tabeladeprecos.FieldByName('PROMO_3H').Value  := ed_promo3H.Text;
    T_tabeladeprecos.FieldByName('PERNOITE').Value  := ed_pernoite.Text;
    T_tabeladeprecos.FieldByName('P_ENTRADA').Value  := ed_p_entrada.Text;
    T_tabeladeprecos.FieldByName('P_SAIDA').Value  := ed_p_saida.Text;
    T_tabeladeprecos.FieldByName('DIARIA').Value  := ed_diaria.Text;
    T_tabeladeprecos.FieldByName('D_ENTRADA').Value  := ed_d_entrada.Text;
    T_tabeladeprecos.FieldByName('D_SAIDA').Value  := ed_d_saida.Text;
    T_tabeladeprecos.FieldByName('24H').Value  := ed_24H.Text;
  end;
end;

procedure TF_tabeladeprecos.UpdateAll;
begin
  with UserSession do
  begin
    T_tabeladeprecos.Active := False;
    T_tabeladeprecos.Active := True;
    T_tabeladeprecos.SQL.Clear;
    T_tabeladeprecos.SQL.Add('SELECT * FROM t_tabeladeprecos ORDER BY ID_TIPO ASC ');
//  'SELECT TP.ID, TP.ID_TIPO, T.TIPO, TP.DESCRICAO, TP.TABELA, TP.HORA, TP.HORA_EXCED, TP.PERNOITE, TP.P_ENTRADA, TP.P_SAIDA, '+
//  'TP.DIARIA, TP.D_ENTRADA, TP.D_SAIDA, TP.PROMO_2H, TP.PROMO_3H, TP.24H, TP.I_DIA, TP.I_HORA, TP.T_DIA, TP.T_HORA FROM t_tabeladeprecos AS TP '+
//  'INNER JOIN T_TIPOS AS T ON T.ID = TP.ID_TIPO '+
//  'ORDER BY TP.ID_TIPO ASC ');
    T_tabeladeprecos.Open();
  end;
end;

procedure TF_tabeladeprecos.Search;
begin
  with UserSession do
  begin
    T_tabeladeprecos.Close;
    T_tabeladeprecos.Active := True;
    T_tabeladeprecos.SQL.Clear;
    T_tabeladeprecos.SQL.Add('SELECT * FROM t_tabeladeprecos WHERE DESCRICAO LIKE :CHV ORDER BY ID_TIPO ASC ');
//  'SELECT TP.ID, TP.ID_TIPO, T.TIPO, TP.DESCRICAO, TP.TABELA, TP.HORA, TP.HORA_EXCED, TP.PERNOITE, TP.P_ENTRADA, TP.P_SAIDA, '+
//  'TP.DIARIA, TP.D_ENTRADA, TP.D_SAIDA, TP.PROMO_2H, TP.PROMO_3H, TP.24H, TP.I_DIA, TP.I_HORA, TP.T_DIA, TP.T_HORA FROM t_tabeladeprecos AS TP '+
//  'INNER JOIN T_TIPOS AS T ON T.ID = TP.ID_TIPO '+
//  'WHERE P.DESCRICAO LIKE :CHV '+
//  'ORDER BY P.ID_TIPO ASC ');
    T_tabeladeprecos.ParamByName('CHV').Value := '%'+ed_buscar.Text+'%';
    T_tabeladeprecos.Open();
		if T_tabeladeprecos.IsEmpty then WebApplication.ShowMessage('Descrição não encontrados');
  end;
end;

procedure TF_tabeladeprecos.ed_buscarHTMLTag(ASender: TObject; ATag: TIWHTMLTag);
begin
  ATag.AddStringParam('placeholder','Descrição');
end;

procedure TF_tabeladeprecos.ed_d_entradaHTMLTag(ASender: TObject;
  ATag: TIWHTMLTag);
begin
  ATag.AddStringParam('type','time');
end;

procedure TF_tabeladeprecos.ed_d_saidaHTMLTag(ASender: TObject;
  ATag: TIWHTMLTag);
begin
  ATag.AddStringParam('type','time');
end;

procedure TF_tabeladeprecos.ed_i_horaHTMLTag(ASender: TObject;
  ATag: TIWHTMLTag);
begin
  ATag.AddStringParam('type','time');
end;

procedure TF_tabeladeprecos.ed_p_entradaHTMLTag(ASender: TObject;
  ATag: TIWHTMLTag);
begin
  ATag.AddStringParam('type','time');
end;

procedure TF_tabeladeprecos.ed_p_saidaHTMLTag(ASender: TObject;
  ATag: TIWHTMLTag);
begin
  ATag.AddStringParam('type','time');
end;

procedure TF_tabeladeprecos.ed_t_horaHTMLTag(ASender: TObject;
  ATag: TIWHTMLTag);
begin
  ATag.AddStringParam('type','time');
end;

procedure TF_tabeladeprecos.LoadCombobox;
begin
  with UserSession do
  begin
    T_tipos.Close;
    T_tipos.Active := True;
    ed_tipo.Items.Clear;
    while not T_tipos.Eof do
    begin
      ed_tipo.Items.AddObject(T_tipos.FieldByName('TIPO').AsString, TObject(T_tipos.FieldByName('ID').AsInteger));
      T_tipos.Next;
    end;
  end;
  ed_tipo.ItemIndex := 0;
end;

procedure TF_tabeladeprecos.ed_tipoAsyncEnter(Sender: TObject;
  EventParams: TStringList);
begin
  LoadCombobox;
end;

{ ... }

procedure TF_tabeladeprecos.bt_incluirAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  LoadCombobox;
  ClearFields;
  UserSession.T_tabeladeprecos.Insert;
  WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#EDITAR_DADOS'').modal(''show'');');
end;

procedure TF_tabeladeprecos.bt_editarAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  LoadCombobox;
  with UserSession do
  begin
    T_tabeladeprecos.Locate('ID', ed_id.Text, []);
    T_tabeladeprecos.Edit;
    ed_id.Text := T_tabeladeprecos.FieldByName('ID').Value;
    ed_tipo.ItemIndex := T_tabeladeprecos.FieldByName('ID_TIPO').AsInteger-1;
    ed_descricao.Text := T_tabeladeprecos.FieldByName('DESCRICAO').Value;
    if T_tabeladeprecos.FieldByName('TABELA').Value = 'A' then Tabela_A.Checked := True;
    if T_tabeladeprecos.FieldByName('TABELA').Value = 'B' then Tabela_B.Checked  := True;
    if T_tabeladeprecos.FieldByName('TABELA').Value = 'C' then Tabela_C.Checked := True;
    ed_i_dia.ItemIndex := T_tabeladeprecos.FieldByName('I_DIA').AsInteger-1;
    ed_i_hora.Text := T_tabeladeprecos.FieldByName('I_HORA').Value;
    ed_t_dia.ItemIndex := T_tabeladeprecos.FieldByName('T_DIA').AsInteger-1;
    ed_t_hora.Text := T_tabeladeprecos.FieldByName('T_HORA').Value;
    ed_hora.Text := T_tabeladeprecos.FieldByName('HORA').Value;
    ed_horaexced.Text := T_tabeladeprecos.FieldByName('HORA_EXCED').Value;
    ed_promo2H.Text := T_tabeladeprecos.FieldByName('PROMO_2H').Value;
    ed_promo3H.Text := T_tabeladeprecos.FieldByName('PROMO_3H').Value;
    ed_pernoite.Text := T_tabeladeprecos.FieldByName('PERNOITE').Value;
    ed_p_entrada.Text := T_tabeladeprecos.FieldByName('P_ENTRADA').Value;
    ed_p_saida.Text := T_tabeladeprecos.FieldByName('P_SAIDA').Value;
    ed_diaria.Text := T_tabeladeprecos.FieldByName('DIARIA').Value;
    ed_d_entrada.Text := T_tabeladeprecos.FieldByName('D_ENTRADA').Value;
    ed_d_saida.Text := T_tabeladeprecos.FieldByName('D_SAIDA').Value;
    ed_24H.Text := T_tabeladeprecos.FieldByName('24H').Value;
  end;
  WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#EDITAR_DADOS'').modal(''show'');');
end;

procedure TF_tabeladeprecos.bt_excluirClick(Sender: TObject);
begin
  with UserSession do
  begin
    T_tabeladeprecos.Locate('ID', ed_id.Text, []);
    T_tabeladeprecos.Delete;
  end;
  UpdateAll;
end;

procedure TF_tabeladeprecos.bt_buscarClick(Sender: TObject);
begin
  Search;
end;

procedure TF_tabeladeprecos.bt_okAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  if Trim(ed_descricao.Text) = '' then
  begin
    WebApplication.ShowMessage('Favor preencher o campo DESCRIÇÃO!');
    ed_descricao.SetFocus;
    exit;
  end;
  SyncFields;
  UserSession.T_tabeladeprecos.Post;
  ClearFields;
  UpdateAll;
  WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#EDITAR_DADOS'').modal(''hide'');');
  WebApplication.CallBackResponse.AddJavaScriptToExecute('location.reload()');
end;

procedure TF_tabeladeprecos.bt_cancelarClick(Sender: TObject);
begin
  WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#EDITAR_DADOS'').modal(''hide'');');
end;

end.
