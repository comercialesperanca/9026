unit UHistoricoAlteracoes;

interface

///  Este arquivo armazena o hist�rico das altera��es
///  realizadas no programa Conferencia Paletizada,
///  dessa forma no c�digo do programa podemos apenas
///  referenciar o n�mero da altera��o ou vers�o.
implementation
///  ///////////////////////////////////////
///
///  Vers�o:       1.0.0.0
///  Data:         21/11/2017
///  Programador:  Marcos Pereira
///  CR:            (Melhoria do dia  //)
///  Solicita��o:  Felipe Viana
///
///  --
///
///  Solu��o
///    Interface:
///      - J� na abertura do programa o grid 'grdOcorrencias', � preenchido com uma lista
///        de ocorr�ncias pendentes de tratamento e quando isso n�o ocorre � porque n�o
///        existem pendencias naquele momento, mas por isso existe o bot�o 'Atualizar', para
///        que ao receber um click fa�a uma nova consulta por ocorr�ncias e preenchimento do
///        grid com as que forem encontradas;
///      - Ao clicarmos no grid sobre algum registro duas vezes � apresentada a tela com
///        mais informa��es sobre a ocorr�ncia e com espa�o para preenchimento do endere�o
///        da OS, para libera��o da ocorr�ncia da mesma;
///      - Na aba 'Finaliza ocorr�ncia', basta digitar o n�mero do endere�o apresentado nos
///        labels e rpessionar a tecla <enter> ou o bot�o 'Autorizar', para validar o endere-
///        �o e autorizar a ocorr�ncia, dando certo essa a��o � apresentada autom�ricamente a
///        aba 'Ocorr�ncias' sen�o o foco continua na caixa que solicita o endere�o, ap�s uma
///        mensagem ser apresentada;
///      - Para retornar da aba 'Finaliza ocorr�ncia' para a aba 'Ocorr�ncias' a qualquer
///        momento basta pressionar o bot�o 'Cancelar'.
///    Controle:
///      - A fun��o 'ProcuraOcorrencias()', executa a query 'qryOcorrencias' e cds
///        'cdsOcorrencias', para a pesquisa por ocorr�ncias;
///      - A fun��o 'LiberaOcorrencia', executa a query 'qryLiberaOcorrencia', recebendo e
///        passando para a query os par�metros 'AnumOS', 'ACodigoUMA' e 'AMatricula', que re-
///        cebem respectivamente o n�mero da OS o �codigo da UMA e a matr�cula do funcion�rio
///        que est� logado no programa;
///      - No evento 'onShow' do formul�rio 'Principal', o componente pcTelaPrincipal � con-
///        figurado para apresentar apenas a aba 'tab_ListadeOcorrencias' e a fun��o
///        'ProcuraOcorrencias' � executadas, para que j� na avbertura seja trazida a lista
///        de ocorr�ncias que precisam ser tratadas;
///      - No evento 'onClick' do bot�o 'btnAtualiza', a fun��o 'ProcuraOcorrencias' � exe-
///        cutada;
///      - No evento 'onDblClick', do grid 'grdOcorrencias', o componente 'pcTelaPrincipal'
///        � configurado para apresentar a aba 'tab_FinalizaOcorrencia' e preenche os labels
///        dessa aba com os valores do registro de ocorr�ncia que recebeu o clique duplo no
///        grid. � tamb�m nesse evento que as vari�veis globais 'OSAtual', 'UMAAtual' e
///        'CodEndereco' s�o preenchidas com os valores do registro da ocorr�ncia;
///      - O evento 'onClick', do bot�o 'btnAutorizar' executa a action
///        'actAutorizaLiberacaoExecute';
///      - O evento 'onKeyPress' da caixa 'edtEndereco', verifica se a tecla <enter> foi
///        pressionada e se a caixa n�o est� vazia para ent�o executar a action
///        'actAutorizaLiberacaoExecute';
///      - A action 'actAutorizaLiberacaoExecute' verifica se o endere�o digitado na caixa
///        'edtEndereco' � igual ao endere�o do registro da ocorr�ncia selecionada, que est�
///        na vari�vel global 'CodEndereco', porque se for executa a fun��o 'LiberaOcorrencia',
///        passando como par�metros os valores das vari�veis globais 'OSAtual' e 'UMAAtual',
///        al�m da matr�cula do usu�rio logado que est� no objeto Usuario.Matricula. Depois
///        se aresposta da fun��o for true, configura o componente 'pcTelaPrincipal' para
///        apresentar de volta a aba 'tab_ListadeOcorrencias' e ainda executa a fun��o
///        'ProcuraOcorrencias', para ent�o atualizar o grid, n�o apresentando mais a ocor-
///        r�ncia que foi liberada. CAso exista uma falha na fun��o 'LiberaOcorrencia' e o
///        retorno dela seja 'false', apresenta uma mensagem falando sobre a falha e coloca
///        o foco na caixa 'edtEndereco' e se o endere�o digitado n�o for igual ao da vari�-
///        vel 'CodEndereco', manda uma menssagem avidando que o endere�o est� errado, limpa
///        a caixa 'edtEndereco' e volta o foco para ela;
///      - No evento 'onClick' do bot�o 'btnCancelar', o componente 'pcTelaPrincipal' � con-
///        figurado para aparesentar apenas a aba 'tab_ListadeOcorrencias' novamente;
///    Dados:
///      - A query 'qryOcorrencias', foi criada para procurar por cocorr�ncias no abastecimento
///        e recebimento com convoca��o ativa, na tabela 'booscompendencia', fazendo um relacio-
///        namento com as tabelas 'pcmovendpend' (mais dados da OS com ocorr�ncia), 'pcendereco'
///        (o endere�o completo da OS, com base no c�digo encontrado na pcmovendpend) e 'pcempr'
///        (o nome completo do funcion�rio que lan�ou a OS na pend�ncia). A query segue algumas
///        regras para trazer o endre�o da OS, porque a mesma pode possuir dois endere�os ou
///        apenas um que pode estar em colunas diferentes, por isso se a OS for de recebimento
///        movimenta��o vertical (tipo 98) pega o endere�o da coluna 'codendereco', da tabela
///        'pcmovendpend', porque n�o interessa o endere�o de origem sempre ser� destino,
///        se for de recebimento movimenta��o horizontal (tipo 97) n�o existe inser��o de
///        ocorr�ncia, por isso n�o h� valida��o, se for abastecimento movimenta��o vertical
///        (tipo 61) pega o campo 'codenderecoorig', da tabela 'pcmovendpend', que � o ende-
///        re�o de origem do abastecimento e se for abastecimento movimenta��o horizontal
///        (tipo 58), na valida��o n�o perguntamos o tipo, porque � a �nica condi��o que so-
///        brou, mas verificamos se a OS n�o foi iniciada, porque nesse caso o endere�o �
///        o de origem do abastecimento 'codenderecoorig', se j� foi iniciada o erro foi no
///        destino do abastecimento 'codendereco';
///      - A query 'qryLiberaOcorrencia', grava a data do sistema atual e a matr�cula do
///        usu�rio que  est� logado no programa no registro de ocorr�ncia de um OS de uma
///        UMA espec�ficas;
///
///  ///////////////////////////////////////
///
///  Vers�o:       1.0.0.1
///  Data:         26/03/2018
///  Programador:  Mayara Raphael
///  CR: 2158   07/03/2018
///  Solicita��o:  Felipe Viana
///
///  -- Felipe Viana - 07/03/2018 15:50
///     Com base no chamado 75984, precisamos que sejam inseridas algumas colunas na
///     rotina 9026, sendo elas:  Data da onda e n�mero da onda
///     Al�m disso, foi observado que se uma OS foi lan�ada v�rias vezes na pend�ncia,
///     quando liberado a �ltima vez que est� l�,  a data de libera��o da �ltima � repetida
///     para todas as outras movimenta��es. Provavelmente dever� ser utilizado mais um AND
///     para encontrar a linha correta para atualiza��o desta data.
///
///  Solu��o
///    Interface:
///      - No grid na tela frmPrincipal aba Ocorr�ncias inclu�dos os campos: Num. Onda,
///        Num. Ordem e Data Onda.
///
///    Dados:
///      - Na query qryOcorrencias inclu�do um left join com a tabela bodefineondai para
///        buscar os campos numonda, numordem, data.
///      - Na query qryLiberaOcorrencia inclu�do mais um and no update, al�m de buscar a
///        pend�ncia por numos e codigouma, agora se alterada a data de libera��o se o campo
///        estiver null -  and dataliberacao is null. 
///
end.
