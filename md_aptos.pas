unit md_aptos;

interface

uses
  Classes, SysUtils, Data.DB, FireDAC.Stan.Param,
  IWAppForm, IWApplication, IWColor, IWTypes, IWCompButton,
  IWCompListbox, IWCompEdit, IWVCLComponent, IWBaseLayoutComponent,
  IWBaseContainerLayout, IWContainerLayout, IWTemplateProcessorHTML,
  IWCompLabel, Vcl.Controls, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl,
  IWControl, IWHTMLControls, IWHTMLTag;

type
  TF_aptos = class(TIWAppForm)
    template_aptos: TIWTemplateProcessorHTML;
    ed_apto: TIWEdit;
    ed_id: TIWEdit;
    ed_buscar: TIWEdit;
    ed_descricao: TIWEdit;
    link_home: TIWLink;
    bt_incluir: TIWButton;
    bt_editar: TIWButton;
    bt_excluir: TIWButton;
    bt_ok: TIWButton;
    bt_cancelar: TIWButton;
    bt_buscar: TIWButton;
    bt_imprimir: TIWButton;
    ed_diaria: TIWEdit;
    ed_situacao: TIWComboBox;
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
    ed_tipo: TIWComboBox;

    procedure IWAppFormShow(Sender: TObject);
    procedure template_aptosUnknownTag(const AName: string; var VValue: string);

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
    procedure LoadComboBox_1;
    procedure LoadComboBox_2;

    procedure ed_tipoAsyncEnter(Sender: TObject; EventParams: TStringList);
    procedure ed_situacaoAsyncEnter(Sender: TObject; EventParams: TStringList);
    procedure ed_buscarHTMLTag(ASender: TObject; ATag: TIWHTMLTag);

    procedure bt_incluirAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure bt_editarAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure bt_excluirClick(Sender: TObject);
    procedure bt_buscarClick(Sender: TObject);
    procedure bt_okAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure bt_cancelarClick(Sender: TObject);

  private

  public

  end;

implementation

{$R *.dfm}

uses
  ServerController, UserSessionUnit,
  md_login, md_principal, md_feriados, md_tabeladeprecos, md_fornecedores, md_produtos, md_vendas, md_lancamentos,
  md_usuarios;

procedure TF_aptos.IWAppFormShow(Sender: TObject);
begin
  Label_1.Caption := USRNAME;
  UpdateAll;
end;

procedure TF_aptos.template_aptosUnknownTag(const AName: string;
  var VValue: string);
begin
  LoadComboBox_1;
  LoadComboBox_2;
  if AName = 'GRID_APTOS' then
  begin
    with UserSession do
    begin
      T_aptos.First;
      while not T_aptos.eof do
      begin
        VValue := VValue + '<tr>'+
        '<td>'+T_aptos.FieldByName('APTO').AsString+'</td>'+sLineBreak+
        '<td>'+T_aptos.FieldByName('TIPO').AsString+'</td>'+sLineBreak+
        '<td>'+T_aptos.FieldByName('DESCRICAO').AsString+'</td>'+sLineBreak+
        '<td>'+T_aptos.FieldByName('DIARIA').AsString+'</td>'+sLineBreak+
        '<td>'+T_aptos.FieldByName('SITUACAO').AsString+'</td>'+sLineBreak+
        '<td>'+
        '<a href="#" class="buttom" onclick="return getItemId('+T_aptos.FieldByName('ID').AsString+', ''editar'')"><img src="icons/931.bmp" width="32" alt="EDITAR" title="EDITAR"></a> '+
        '<a href="#" class="buttom" onclick="return getItemId('+T_aptos.FieldByName('ID').AsString+', ''excluir'')"><img src="icons/938.bmp" width="32" alt="EXCLUIR" title="EXCLUIR"></a>'+
        '</td>'+sLineBreak+'</tr>';
        T_aptos.Next;
      end;
    end;
  end;
end;

procedure TF_aptos.m_painelClick(Sender: TObject);
begin
  TF_principal.Create(WebApplication).Show;
end;

procedure TF_aptos.m_apartamentosClick(Sender: TObject);
begin
{  TF_aptos.Create(WebApplication).Show; }
end;

procedure TF_aptos.m_tabeladeprecosClick(Sender: TObject);
begin
  TF_tabeladeprecos.Create(WebApplication).Show;
end;

procedure TF_aptos.m_feriadosClick(Sender: TObject);
begin
  TF_feriados.Create(WebApplication).Show;
end;

procedure TF_aptos.m_vendasClick(Sender: TObject);
begin
  TF_vendas.Create(WebApplication).Show;
end;

procedure TF_aptos.m_estoqueClick(Sender: TObject);
begin
{ separador de linha }
end;

procedure TF_aptos.m_produtosClick(Sender: TObject);
begin
  TF_produtos.Create(WebApplication).Show;
end;

procedure TF_aptos.m_fornecedoresClick(Sender: TObject);
begin
  TF_fornecedores.Create(WebApplication).Show;
end;

procedure TF_aptos.m_comprasClick(Sender: TObject);
begin
{  TF_compras.Create(WebApplication).Show; }
end;

procedure TF_aptos.m_financeiroClick(Sender: TObject);
begin
{  separador de linha }
end;

procedure TF_aptos.m_planodecontasClick(Sender: TObject);
begin
{  TF_contas.Create(WebApplication).Show; }
end;

procedure TF_aptos.m_contasapagarreceberClick(Sender: TObject);
begin
{  TF_contasapagarreceber.Create(WebApplication).Show; }
end;

procedure TF_aptos.m_lancamentosClick(Sender: TObject);
begin
  TF_lancamentos.Create(WebApplication).Show;
end;

procedure TF_aptos.m_relatoriosClick(Sender: TObject);
begin
{ separador de linha }
end;

procedure TF_aptos.m_relatoriodeestoqueClick(Sender: TObject);
begin
{  TF_relatoriodeestoque.Create(WebApplication).Show; }
end;

procedure TF_aptos.m_relatoriodevendasClick(Sender: TObject);
begin
{  TF_relatoriodevendas.Create(WebApplication).Show; }
end;

procedure TF_aptos.m_relatoriofinanceiroClick(Sender: TObject);
begin
{  TF_relatoriofinanceiro.Create(WebApplication).Show; }
end;

procedure TF_aptos.m_lavanderiaClick(Sender: TObject);
begin
{  TF_lavanderia.Create(WebApplication).Show; }
end;

procedure TF_aptos.m_usuariosClick(Sender: TObject);
begin
  TF_usuarios.Create(WebApplication).Show;
end;

procedure TF_aptos.m_suportetecnicoClick(Sender: TObject);
begin
{  TF_suportetecnico.Create(WebApplication).Show; }
end;

procedure TF_aptos.m_configuracoesClick(Sender: TObject);
begin
{  TF_configuracoes.Create(WebApplication).Show; }
end;

procedure TF_aptos.link_homeClick(Sender: TObject);
begin
  TF_principal.Create(WebApplication).Show;
end;

procedure TF_aptos.link_usuarioClick(Sender: TObject);
begin
  TF_usuarios.Create(WebApplication).Show;
end;

procedure TF_aptos.link_sairClick(Sender: TObject);
begin
  TF_login.Create(WebApplication).Show;
end;

{ ... }

procedure TF_aptos.ClearFields;
begin
  ed_apto.Text := '';
  ed_tipo.ItemIndex := 0;
  ed_descricao.Text := '';
  ed_diaria.Text := '';
  ed_situacao.ItemIndex := 7;
end;

procedure TF_aptos.SyncFields;
begin
  with UserSession do
  begin
    T_aptos.FieldByName('APTO').Value := ed_apto.Text;
    T_aptos.FieldByName('ID_TIPO').Value := Integer(ed_tipo.Items.Objects[ed_tipo.ItemIndex]);
    T_aptos.FieldByName('DESCRICAO').Value := ed_descricao.Text;
    T_aptos.FieldByName('DIARIA').Value := ed_diaria.Text;
    T_aptos.FieldByName('ID_SITUACAO').Value := Integer(ed_situacao.Items.Objects[ed_situacao.ItemIndex]);
  end;
end;

procedure TF_aptos.UpdateAll;
begin
  with UserSession do
  begin
    T_aptos.Active := False;
    T_aptos.Active := True;
    T_aptos.SQL.Clear;
    T_aptos.SQL.Add(
    'SELECT A.ID, A.APTO, A.DESCRICAO, A.DIARIA, A.ID_TIPO, T.TIPO, A.ID_SITUACAO, S.SITUACAO FROM t_aptos AS A '+
    'INNER JOIN t_tipos AS T ON A.ID_TIPO = T.ID '+
    'INNER JOIN t_situacao AS S ON A.ID_SITUACAO = S.ID '+
    'ORDER BY A.APTO ASC ');
    T_aptos.Open();
  end;
end;

procedure TF_aptos.Search;
begin
  with UserSession do
  begin
    T_aptos.Close;
    T_aptos.Active := True;
    T_aptos.SQL.Clear;
    T_aptos.SQL.Add(
    'SELECT A.ID, A.APTO, A.DESCRICAO, A.DIARIA, A.ID_TIPO, T.TIPO, A.ID_SITUACAO, S.SITUACAO FROM t_aptos AS A '+
    'INNER JOIN t_tipos AS T ON A.ID_TIPO = T.ID '+
    'INNER JOIN t_situacao AS S ON A.ID_SITUACAO = S.ID '+
    'WHERE A.DESCRICAO LIKE :CHV '+
    'ORDER BY A.APTO ASC ');
    T_aptos.ParamByName('CHV').Value := '%'+ed_buscar.Text+'%';
    T_aptos.Open();
		if T_aptos.IsEmpty then WebApplication.ShowMessage('Dados não encontrados!');
  end;
end;

procedure TF_aptos.LoadComboBox_1;
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

procedure TF_aptos.LoadComboBox_2;
begin
  with UserSession do
  begin
    T_situacao.Close;
    T_situacao.Active := True;
    ed_situacao.Items.Clear;
    while not T_situacao.Eof do
    begin
      ed_situacao.Items.AddObject(T_situacao.FieldByName('SITUACAO').AsString, TObject(T_situacao.FieldByName('ID').AsInteger));
      T_situacao.Next;
    end;
  end;
  ed_situacao.ItemIndex := 0;
end;

procedure TF_aptos.ed_tipoAsyncEnter(Sender: TObject; EventParams: TStringList);
begin
//  LoadComboBox_1;
end;

procedure TF_aptos.ed_situacaoAsyncEnter(Sender: TObject; EventParams: TStringList);
begin
//  LoadComboBox_2;
end;

procedure TF_aptos.ed_buscarHTMLTag(ASender: TObject; ATag: TIWHTMLTag);
begin
  ATag.AddStringParam('placeholder','Descrição');
end;

{ ... }

procedure TF_aptos.bt_incluirAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  LoadComboBox_1;
  LoadComboBox_2;
  ClearFields;
  UserSession.T_aptos.Insert;
  WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#EDITAR_DADOS'').modal(''show'');');
end;

procedure TF_aptos.bt_editarAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  LoadComboBox_1;
  LoadComboBox_2;
  with UserSession do
  begin
    T_aptos.Locate('ID', ed_id.Text, []);
    T_aptos.Edit;
    ed_id.Text := T_aptos.FieldByName('ID').Value;
    ed_apto.Text := T_aptos.FieldByName('APTO').Value;
    ed_tipo.Items[0] := T_aptos.FieldByName('TIPO').Value;
    ed_descricao.Text := T_aptos.FieldByName('DESCRICAO').Value;
    ed_diaria.Text := T_aptos.FieldByName('DIARIA').Value;
    ed_situacao.Items[0] := T_aptos.FieldByName('SITUACAO').Value;
  end;
  WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#EDITAR_DADOS'').modal(''show'');');
end;

procedure TF_aptos.bt_excluirClick(Sender: TObject);
begin
  with UserSession do
  begin
    T_aptos.Locate('ID', ed_id.Text, []);
    T_aptos.Delete;
  end;
  UpdateAll;
end;

procedure TF_aptos.bt_buscarClick(Sender: TObject);
begin
  Search;
end;

procedure TF_aptos.bt_okAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  if Trim(ed_apto.Text) = '' then
  begin
    WebApplication.ShowMessage('Favor preencher o campo APTO!');
    ed_apto.SetFocus;
    exit;
  end;
  SyncFields;
  UserSession.T_aptos.Post;
  ClearFields;
  UpdateAll;
  WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#EDITAR_DADOS'').modal(''hide'');');
  WebApplication.CallBackResponse.AddJavaScriptToExecute('location.reload()');
end;

procedure TF_aptos.bt_cancelarClick(Sender: TObject);
begin
  WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#EDITAR_DADOS'').modal(''hide'');');
end;

end.
