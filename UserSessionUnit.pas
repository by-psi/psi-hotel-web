unit UserSessionUnit;

{
  This is a DataModule where you can add components or declare fields that are specific to
  ONE user. Instead of creating global variables, it is better to use this datamodule. You can then
  access the it using UserSession.
}
interface

uses
  IWUserSessionBase, SysUtils, Classes, IniFiles,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TF_session = class(TIWUserSessionBase)
    T_vendas: TFDQuery;
    T_itensdevenda: TFDQuery;
    T_login: TFDQuery;
    T_loginID: TFDAutoIncField;
    T_loginNOME: TStringField;
    T_loginFUNCAO: TStringField;
    T_loginUSUARIO: TStringField;
    T_loginSENHA: TStringField;
    T_loginNIVEL: TIntegerField;
    T_usuarios: TFDQuery;
    FDAutoIncField1: TFDAutoIncField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    IntegerField1: TIntegerField;
    T_produtos: TFDQuery;
    T_fornecedores: TFDQuery;
    T_fornecedoresID: TFDAutoIncField;
    T_fornecedoresFORNECEDOR: TStringField;
    T_fornecedoresEMAIL: TStringField;
    T_fornecedoresTELEFONE: TStringField;
    T_lancamentos: TFDQuery;
    T_contas: TFDQuery;
    T_contasID: TFDAutoIncField;
    T_contasCONTA: TStringField;
    T_contasSALDO: TFloatField;
    T_contasDC: TStringField;
    T_vendasID: TFDAutoIncField;
    T_vendasID_USUARIO: TIntegerField;
    T_vendasDATA: TDateField;
    T_vendasCHV: TStringField;
    T_itensdevendaID: TFDAutoIncField;
    T_itensdevendaID_VENDA: TIntegerField;
    T_itensdevendaID_PRODUTO: TIntegerField;
    T_itensdevendaQTD: TIntegerField;
    T_itensdevendaVALOR_UN: TFloatField;
    T_itensdevendaVALOR_TOTAL: TFloatField;
    T_itensdevendaID_USUARIO: TIntegerField;
    T_vendasUSUARIO: TStringField;
    T_itensdevendaPRODUTO: TStringField;
    T_itensdevendaUSUARIO: TStringField;
    T_vendasVALOR_TOTAL: TFloatField;
    DriverLink_1: TFDPhysMySQLDriverLink;
    query_1: TFDQuery;
    Connection_1: TFDConnection;
    T_aptos: TFDQuery;
    T_tipos: TFDQuery;
    T_tiposID: TFDAutoIncField;
    T_tiposTIPO: TStringField;
    T_situacao: TFDQuery;
    T_situacaoID: TFDAutoIncField;
    T_situacaoSITUACAO: TStringField;
    T_feriados: TFDQuery;
    T_feriadosID: TFDAutoIncField;
    T_feriadosDATA: TDateField;
    T_feriadosDESCRICAO: TStringField;
    T_tabeladeprecos: TFDQuery;
    T_tabeladeprecosID: TFDAutoIncField;
    T_tabeladeprecosID_TIPO: TIntegerField;
    T_tabeladeprecosDESCRICAO: TStringField;
    T_tabeladeprecosTABELA: TStringField;
    T_tabeladeprecosHORA: TFloatField;
    T_tabeladeprecosHORA_EXCED: TFloatField;
    T_tabeladeprecosPERNOITE: TFloatField;
    T_tabeladeprecosP_ENTRADA: TTimeField;
    T_tabeladeprecosP_SAIDA: TTimeField;
    T_tabeladeprecosDIARIA: TFloatField;
    T_tabeladeprecosD_ENTRADA: TTimeField;
    T_tabeladeprecosD_SAIDA: TTimeField;
    T_tabeladeprecosPROMO_2H: TFloatField;
    T_tabeladeprecosPROMO_3H: TFloatField;
    T_tabeladeprecosFloatField24H: TFloatField;
    T_tabeladeprecosI_HORA: TTimeField;
    T_tabeladeprecosT_HORA: TTimeField;
    T_tabeladeprecosTIPO: TStringField;
    T_tabeladeprecosI_DIA: TIntegerField;
    T_tabeladeprecosT_DIA: TIntegerField;
    T_lancamentosID: TFDAutoIncField;
    T_lancamentosDATA: TDateField;
    T_lancamentosHISTORICO: TStringField;
    T_lancamentosVALOR: TFloatField;
    T_lancamentosTIPO: TStringField;
    T_lancamentosID_USUARIO: TIntegerField;
    T_lancamentosID_CONTA: TIntegerField;
    T_lancamentosUSUARIO: TStringField;
    T_lancamentosCONTA: TStringField;
    T_diarias: TFDQuery;
    T_produtosID: TFDAutoIncField;
    T_produtosPRODUTO: TStringField;
    T_produtosIMAGEM: TStringField;
    T_produtosESTQ_ATUAL: TIntegerField;
    T_produtosUNIDADE: TStringField;
    T_produtosVALOR: TFloatField;
    T_produtosID_FORNECEDOR: TIntegerField;
    T_produtosFORNECEDOR: TStringField;
    T_aptosID: TFDAutoIncField;
    T_aptosAPTO: TStringField;
    T_aptosID_TIPO: TIntegerField;
    T_aptosDESCRICAO: TStringField;
    T_aptosID_SITUACAO: TIntegerField;
    T_aptosDIARIA: TStringField;
    T_aptosTIPO: TStringField;
    T_aptosSITUACAO: TStringField;
    T_entradas: TFDQuery;
    T_saidas: TFDQuery;
    T_diariasID: TFDAutoIncField;
    T_diariasID_APTO: TIntegerField;
    T_diariasTIPO_LOCACAO: TIntegerField;
    T_diariasID_ENTRADA: TIntegerField;
    T_diariasID_SAIDA: TIntegerField;
    T_diariasCHV: TStringField;
    T_entradasID: TFDAutoIncField;
    T_entradasID_DIARIA: TIntegerField;
    T_entradasDT_ENTRADA: TDateField;
    T_entradasHR_ENTRADA: TTimeField;
    T_entradasRC_ENTRADA: TIntegerField;
    T_entradasVR_ENTRADA: TFloatField;
    T_saidasID: TFDAutoIncField;
    T_saidasID_DIARIA: TIntegerField;
    T_saidasDT_SAIDA: TDateField;
    T_saidasHR_SAIDA: TTimeField;
    T_saidasRC_SAIDA: TIntegerField;
    T_saidasVR_SAIDA: TFloatField;
    T_pedidos: TFDQuery;
    T_pedidosID: TFDAutoIncField;
    T_pedidosID_DIARIA: TIntegerField;
    T_pedidosDATA: TDateField;
    T_pedidosHORA: TTimeField;
    T_pedidosID_PRODUTO: TIntegerField;
    T_pedidosQTD: TIntegerField;
    T_pedidosVALOR_TOTAL: TFloatField;
    T_pedidosCHV: TStringField;

    procedure IWUserSessionBaseCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  FDriverID,
  FDatabase, FServer, FPort,
  FUser, FPassword, dt_atual, PW,
  FileName, config, chv: string;
  ArqIni: TIniFile;

  USR_ID: string;
  USRNAME: string;
  USRFUNCTION: string;
  USRLEVEL: string;

const //   '12345678901'
  codigo = 'PSIHOTELBHZ';

implementation

{$R *.dfm}

{ TF_session }

procedure TF_session.IWUserSessionBaseCreate(Sender: TObject);
begin
  try
    DateTimeToString(dt_atual, 'dd/mm/yyyy hh:nn:ss', Now);
    PW := lowercase(copy(codigo,1,3)+'.'+copy(codigo,4,5)+'.'+copy(codigo,9,3)+'.'+copy(dt_atual,7,4));
//  DriverLink_1.VendorHome := GetCurrentDir + '\wwwroot\libmysql.dll';

    FileName := ChangeFileExt(ParamStr(0), '.ini');
    ArqINI := TIniFile.Create(FileName);

    if not FileExists(FileName) then
    begin
      ArqINI.WriteString('DB', 'type', '0');
      ArqINI.WriteString('DB', 'driver', 'MySQL');
      ArqINI.WriteString('DB', 'server', '127.0.0.1');
      ArqINI.WriteString('DB', 'port', '3306');
      ArqINI.WriteString('DB', 'database', 'psi_hotelweb');
      ArqINI.WriteString('DB', 'user', 'root');
      ArqINI.WriteString('DB', 'password', 'vertrigo');
      ArqINI.UpdateFile;
    end;

    config := ArqINI.ReadString('DB', 'type', chv);

    if config = '1' then
    begin
      FDriverID := ArqINI.ReadString('DB', 'driver', chv);
      FServer := ArqINI.ReadString('DB', 'server', chv);
      FPort := ArqINI.ReadString('DB' , 'port', chv);
      FDatabase := ArqINI.ReadString('DB' , 'database', chv);
      FUser := ArqINI.ReadString('DB', 'user', chv);
      FPassword := ArqINI.ReadString('DB', 'password', chv);
    end else
    if config = '2' then
    begin
      FDriverID := 'MySQL';
      FServer := 'localhost';
      FPort := '3306';
      FDatabase := 'psi_hotelweb';
      FUser := 'root';
      FPassword := '';
    end else
    begin
      FDriverID := 'MySQL';
      FServer := 'psi-software.com.br';
      FPort := '9967';
      FDatabase := 'psisoftw_hotel';
      FUser := 'psisoftw_adm';
      FPassword := PW;
    end;

    ArqINI.Free;
    Connection_1.Params.Values['DriverID'] := FDriverID;
    Connection_1.Params.Values['Server'  ] := FServer;
    Connection_1.Params.Values['Port'    ] := FPort;
    Connection_1.Params.Values['Database'] := FDatabase;
    Connection_1.Params.Values['User_Name']:= FUser;
    Connection_1.Params.Values['Password'] := FPassword;

    T_login.Active := True;
    T_usuarios.Active := True;
    T_diarias.Active := True;
    T_entradas.Active := True;
    T_saidas.Active := True;
    T_pedidos.Active := True;
    T_aptos.Active := True;
    T_tipos.Active := True;
    T_situacao.Active := True;
    T_feriados.Active := True;
    T_tabeladeprecos.Active := True;
    T_vendas.Active := True;
    T_itensdevenda.Active := True;
    T_produtos.Active := True;
    T_fornecedores.Active := True;
    T_contas.Active := True;
    T_lancamentos.Active := True;

  except
    WebApplication.ShowMessage('Erro ao conectar o banco de dados!');
  end;

end;

end.
