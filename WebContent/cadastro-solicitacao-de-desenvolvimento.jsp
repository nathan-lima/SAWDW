<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html lang="pt-br">
<head>
	<title>SAEDW - Solicita��o de Desenvolvimento de Website</title>
	<c:import url="/common/cabecalho.jsp" />
</head>
<body>
	<div class="wrapper">
		<c:choose>
			<c:when test="${tipoDeUsuario == 'webDesigner'}">
				<div class="sidebar" data-color="red">

					<div class="sidebar-wrapper">
						<div class="logo">
							<a href="http://localhost:8080/SAEDW/painel-web-designer.jsp" class="simple-text"> SAEDW </a>
						</div>

						<ul class="nav">
							<li><a href="CategoriaDeWebsitesController"> <i
									class="pe-7s-folder"></i>
									<p>Categorias de Websites</p>
							</a></li>
							<li><a href="EstruturaDeWebsiteController"> <i
									class="pe-7s-browser"></i>
									<p>Estruturas de Websites</p>
							</a></li>
							<li><a href="SolicitacaoDeDesenvolvimentoController"> <i
									class="pe-7s-bell"></i>
									<p>Solicitacoes de Desenvolvimento</p>
							</a></li>
						</ul>
					</div>
				</div>
			</c:when>
			<c:when test="${tipoDeUsuario == 'gerente'}">
				<div class="sidebar" data-color="orange">

					<div class="sidebar-wrapper">
						<div class="logo">
							<a href="http://localhost:8080/SAEDW/painel-gerente.jsp" class="simple-text"> SAEDW </a>
						</div>

						<ul class="nav">
							<li class="active"><a
								href="SolicitacaoDeDesenvolvimentoController"> <i
									class="pe-7s-bell"></i>
									<p>Solicita��es de Desenvolvimento</p>
							</a></li>
							<li><a href="ProjetoController?acao=listarProjetos"> <i
									class="pe-7s-browser"></i>
									<p>Projetos</p>
							</a></li>
						</ul>
					</div>
				</div>

			</c:when>
		</c:choose>

		<div class="main-panel">
			<nav class="navbar navbar-default navbar-fixed">
				<div class="container-fluid">
					<div class="collapse navbar-collapse">
						<ul class="nav navbar-nav navbar-right">
							<li><a href="LogoutController">
									<p>SAIR</p>
							</a></li>
							<li class="separator hidden-lg hidden-md"></li>
						</ul>
					</div>
				</div>
			</nav>
			
			<!-- In�cio do conte�do da P�gina -->
			<div class="content">
			
				<!-- Mostra o container -->
				<div class="container-fluid">
				
					<%-- Testa se ir� criar uma nova solicita��o de desenvolvimento ou editar uma j� existente --%>
					<c:choose>
					
						<%-- Exibe o formul�rio de Solicita��o de Desenvolvimento --%>
						<c:when test="${empty solicitacaoDeDesenvolvimento.id}">
						
							<%-- Cart�o do formul�rio de cadastro de Solicita��o de desenvolvimento --%>
							
							
								<%-- In�cio da Linha de Informa��es da Solicita��o (T�tulo, Status, Justificativa) --%>
								<div class="row">
									<div class="col-md-12">
										<div class="card">
											<div class="header">
												<h4>NOVA SOLICITA��O DE DESENVOLVIMENTO DE WEBSITE</h4>
											</div>				
											<div class="content">
												<form action="SolicitacaoDeDesenvolvimentoController" method="post">
													<div class="row">
														<div class="col-md-12">
															<div class="form-group">
																<label>T�tulo</label> <input type="text" name="titulo" class="form-control">
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-md-12">
															<div class="form-group">
																<label>Justificativa</label>
																<textarea rows="5" name="justificativa" class="form-control"></textarea>
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-md-12">
															<div class="form-group">
																<div class="row">
																	<div class="col-md-5">
																		<label>Estruturas de Websites Dispon�veis</label>
																		<select name="estruturasDeWebsitesDaInstituicao" class="js-multiselect form-control" size="9" multiple="multiple">
																			<c:forEach var="estruturaDeWebsite" items="${estruturasDeWebsites}" varStatus="id">
																				<option value="${estruturaDeWebsite.id}">${estruturaDeWebsite.nome}</option>
																			</c:forEach>
																		</select>
																	</div>
																	<div class="col-md-2">
																		<br />
																		<button type="button" id="incluirTodas"
																			class="btn btn-block">
																			<i class="fa fa-angle-double-right"></i>
																		</button>
																		<button type="button" id="incluirUma"
																			class="btn btn-block">
																			<i class="fa fa-angle-right"></i>
																		</button>
																		<button type="button" id="excluirUma"
																			class="btn btn-block">
																			<i class="fa fa-angle-left"></i>
																		</button>
																		<button type="button" id="excluirTodas"
																			class="btn btn-block">
																			<i class="fa fa-angle-double-left"></i>
																		</button>
																	</div>
																	<div class="col-md-5">
																		<label>Estruturas de Websites a Serem Solicitadas</label>
																		<select name="estruturasDeWebsitesSolicitadas" id="estruturasDeWebsitesSolicitadas" class="form-control" size="9" multiple="multiple">
																		</select>
																	</div>
																</div>
															</div>
														</div>
													</div>
													
													<input type="hidden" name="acao" value="cadastrar" />
													<button type="submit" class="btn btn-success btn-fill pull-left">REALIZAR SOLICITA��O</button>
													<div class="clearfix"></div>
												</form>
											</div>
										</div>
									</div>
								</div>
								<%-- Fim da Linha de Informa��es da Solicita��o (T�tulo, Status, Justificativa) --%>
								
							<%--Fim do formul�rio de cadastro de Solicita��o de desenvolvimento --%>
							
						</c:when>
						<%-- Fim da exibi��o o formul�rio de Solicita��o de Desenvolvimento --%>
						
						<%-- Exibe a solicita��o de desenvolvimento --%>
						<c:when test="${not empty solicitacaoDeDesenvolvimento.id}">
							
							<%-- In�cio da Linha de Informa��es da Solicita��o (T�tulo, Status, Justificativa) --%>
							<div class="row">
							
								<div class="col-md-12">
									<div class="card">
										
										<%-- In�cio do teste para permitir que apenas os gerentes editem a Solicita��o de desenvolvimento --%>
										<c:choose>
											<c:when test="${(tipoDeUsuario == 'gerente' && usuario.departamento != 'TI') && 
															(solicitacaoDeDesenvolvimento.status == 'Nova')}">
												<div class="header">
													<h4>EDITAR SOLICITA��O DE DESENVOLVIMENTO</h4>
												</div>
												<%-- In�cio do formul�rio de edi��o de Solicita��o de desenvolvimento --%>
												<form action="SolicitacaoDeDesenvolvimentoController" method="post">
													<div class="content">
														<c:choose>
															<c:when test="${ not empty successMessage }">
																<div class="alert alert-success" role="alert">
																	<span><b>Sucesso - </b> ${successMessage} </span>
																</div>											
															</c:when>
														</c:choose>
														<div class="row">
															<div class="col-md-12">
																<div class="form-group">
																	<label>T�tulo</label> 
																	<input type="text" value="${solicitacaoDeDesenvolvimento.titulo}" 
																	name="titulo" class="form-control">
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col-md-12">
																<div class="form-group">
																	<label>Status</label> 
																	<input type="text" value="${solicitacaoDeDesenvolvimento.status}" 
																	name="status" class="form-control" readonly>
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col-md-12">
																<div class="form-group">
																	<label>Justificativa</label>
																	<textarea rows="5" name="justificativa"class="form-control">${solicitacaoDeDesenvolvimento.justificativa}</textarea>
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col-md-12">
																<div class="form-group">
																	<div class="row">
																		<div class="col-md-5">
																			<label>Estruturas de Websites Dispon�veis</label>
																			<select name="estruturasDeWebsitesDaInstituicao" class="js-multiselect form-control" size="9" multiple="multiple">
																				<c:forEach var="estruturaDeWebsite" items="${estruturasDeWebsites}">
																					<option value="${estruturaDeWebsite.id}">${estruturaDeWebsite.nome}</option>
																				</c:forEach>
																			</select>
																		</div>
																		<div class="col-md-2">
																			<br />
																			<button type="button" id="incluirTodas"
																				class="btn btn-block">
																				<i class="fa fa-angle-double-right"></i>
																			</button>
																			<button type="button" id="incluirUma"
																				class="btn btn-block">
																				<i class="fa fa-angle-right"></i>
																			</button>
																			<button type="button" id="excluirUma"
																				class="btn btn-block">
																				<i class="fa fa-angle-left"></i>
																			</button>
																			<button type="button" id="excluirTodas"
																				class="btn btn-block">
																				<i class="fa fa-angle-double-left"></i>
																			</button>
																		</div>
																		<div class="col-md-5">
																			<label>Estruturas de Websites Solicitadas</label>
																			<select name="estruturasDeWebsitesSolicitadas" id="estruturasDeWebsitesSolicitadas" class="form-control" size="9" multiple="multiple">
																				<c:forEach var="estruturaDeWebsiteSolicitada" items="${solicitacaoDeDesenvolvimento.estruturasDeWebsitesSolicitadas}">
																					<option value="${estruturaDeWebsiteSolicitada.id}">${estruturaDeWebsiteSolicitada.nome}</option>
																				</c:forEach>
																			</select>
																		</div>
																	</div>
																</div>
															</div>
														</div>
														
														<input type="hidden" name="id" value="${solicitacaoDeDesenvolvimento.id}" />
														<input type="hidden" name="acao" value="editar" />
														
														<button type="submit" class="btn btn-success btn-fill pull-left">EDITAR</button>
														<div class="clearfix"></div>
													</div>
												</form>
												
											</c:when>
											<c:otherwise>
											
												<div class="header">
													<h4>VISUALIZAR SOLICITA��O DE DESENVOLVIMENTO</h4>
												</div>				
												<div class="content">
													<table class="table table-bordered table-hover">
														<thead>
															<tr>
																<th>T�tulo</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>${solicitacaoDeDesenvolvimento.titulo}</td>
															</tr>
														</tbody>
														<thead>
															<tr>
																<th>Status</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>${solicitacaoDeDesenvolvimento.status}</td>
															</tr>
														</tbody>
														<c:choose>
															<c:when test="${(tipoDeUsuario == 'gerente' && usuario.departamento == 'TI') || (tipoDeUsuario == 'webDesigner')}">
																<thead>
																	<tr>
																		<th>Solicitante</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>${solicitacaoDeDesenvolvimento.solicitante.nome} ${solicitacaoDeDesenvolvimento.solicitante.sobrenome}</td>
																	</tr>
																</tbody>
															</c:when>
														</c:choose>
														<thead>
															<tr>
																<th>Justificativa</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>${solicitacaoDeDesenvolvimento.justificativa}</td>
															</tr>
														</tbody>
														<thead>
															<tr>
																<th>Estrutura(s) de Website(s) Solicitada(s)</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>
																	<ul>
																	<c:forEach var="estruturaDeWebsiteSolicitada" items="${solicitacaoDeDesenvolvimento.estruturasDeWebsitesSolicitadas}">
																		<c:choose>
																			<c:when test="${tipoDeUsuario == 'webDesigner'}">
																				<li><a href="EstruturaDeWebsiteController?acao=visualizar&id=${estruturaDeWebsiteSolicitada.id}" target="_blank">
																					${estruturaDeWebsiteSolicitada.nome}
																					</a>
																				</li>
																			</c:when>
																			<c:otherwise>
																				<li>${estruturaDeWebsiteSolicitada.nome}</li>
																			</c:otherwise>
																		</c:choose>
																		
																	</c:forEach>
																	</ul>
																</td>
															</tr>
														</tbody>
													</table>
												</div>
											</c:otherwise>
										</c:choose>
										<%-- Fim do teste para permitir que apenas os gerentes editem a Solicita��o de desenvolvimento --%>
										
									</div>
								</div>
							</div>
							<%-- Fim da Linha de Informa��es da Solicita��o (T�tulo, Status, Justificativa) --%>
								
								
							<%-- Fim cart�o do formul�rio de edi��o de Solicita��o de desenvolvimento --%>
							
							<%-- Cart�o do Parecer T�cnico --%>
							<c:choose>
								
								<%-- Testa se h� parecer emitido para a solicita��o --%>
								<c:when test="${empty parecer.id}">
									
									<%-- Exibir o Formul�rio para emiss�o do Parecer pelo Web-designer ou uma mensagem informando que n�o 
									h� Parecer T�cnico emitido para o Gerente de TI --%>
									<c:choose>
									
										<%-- Testa se o usu�rio � Web-designer --%>
										<c:when test="${tipoDeUsuario == 'webDesigner'}">
											<form action="ParecerController">
												<div class="card ">
													<div class="header">
														<h4 class="title">PARECER T�CNICO</h4>
													</div>
													<div class="content">
														<div class="row">
															<div class="col-md-12">
																<div class="form-group">
																	<label>Recomenda��o</label> <input type="text" name="recomendacao" class="form-control">
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col-md-12">
																<div class="form-group">
																	<label>Justificativa</label>
																	<textarea rows="5" name="justificativa" class="form-control"></textarea>
																</div>
															</div>
														</div>
														<input type="hidden" name="idSolicitacaoDeDesenvolvimento" value="${solicitacaoDeDesenvolvimento.id}" /> 
														<input type="hidden" name="acao" value="emitir" />
														
														<button type="submit" class="btn btn-success btn-fill pull-left">EMITIR PARECER</button>
														<div class="clearfix"></div>
													</div>
												</div>
											</form>
										</c:when>
										<%-- Fim do teste de o usu�rio ser Web-Designer --%>
										
										<%-- Testa se o usu�rio � Gerente da �rea de TI --%>
										<c:when test="${tipoDeUsuario == 'gerente' && setor == 'TI'}">
											<div class="card">
												<div class="header">
													<h4 class="title">PARECER T�CNICO</h4>
												</div>
												<div class="content">
													<p>N�o h� parecer t�cnico emitido para esta solicita��o</p>
												</div>
											</div>
										</c:when>
										<%-- Fim do teste de o usu�rio ser Gerente da �rea de TI --%>
									</c:choose>
									<%-- Fim da exibi��o do formul�rio de emiss�o de Parecer T�cnico ou da mensagem de n�o haver Parecer
									T�cnico para o gerente de TI --%>
									
								</c:when>
								<%-- Fim do teste de haver Parecer para a Solicita��o --%>
								
								<%-- Testa n�o haver Parecer para a solicita��o --%>
								<c:when test="${not empty parecer.id}">
									
									<%-- Exibe o formul�rio para edi��o de Parecer para o webdesigner ou
									exibe o parecer para o Gerente da �rea de TI --%>
									<c:choose>
									
										<%-- Testa se o usu�rio � Web-designer --%>
										<c:when test="${tipoDeUsuario == 'webDesigner'}">
											<c:choose>
												<c:when test="${solicitacaoDeDesenvolvimento.status == 'Aguardando Aprovacao'}">
													<div class="card">
														<div class="header">
															<h4 class="title">PARECER T�CNICO</h4>
														</div>
														<div class="content">
															<form action="ParecerController">
																<div class="row">
																	<div class="col-md-12">
																		<div class="form-group">
																			<label>Recomenda��o</label> 
																			<input type="text" name="recomendacao" value="${parecer.recomendacao}" class="form-control">
																		</div>
																	</div>
																</div>
																<div class="row">
																	<div class="col-md-12">
																		<div class="form-group">
																			<label>Justificativa</label>
																			<textarea rows="5" name="justificativa" class="form-control">${parecer.justificativa}</textarea>
																		</div>
																</div>
																</div>
																<input type="hidden" name="idSolicitacaoDeDesenvolvimento" value="${solicitacaoDeDesenvolvimento.id}" /> 
																<input type="hidden" name="idParecer" value="${parecer.id}" />
																<input type="hidden" name="acao" value="editar" /> 
																<button type="submit" class="btn btn-success btn-fill pull-left">EDITAR</button>
															</form>
															<form action="ParecerController">
																<input type="hidden" name="acao" value="excluir" /> 
																<input type="hidden" name="idParecer" value="${parecer.id}" />
																<input type="hidden" name="idSolicitacaoDeDesenvolvimento" value="${solicitacaoDeDesenvolvimento.id}" />
																<button type="submit" class="btn btn-danger btn-fill pull-right">EXCLUIR PARECER</button>
																<div class="clearfix"></div>
															</form>
														</div>
													</div>
												</c:when>
												<c:otherwise>
													<div class="card ">
														<div class="header">
															<h4 class="title">PARECER T�CNICO</h4>
														</div>
														<div class="content">
															<form>
																<div class="row">
																	<div class="col-md-12">
																		<div class="form-group">
																			<label>Recomenda��o</label> 
																			<input type="text" name="recomendacao" value="${parecer.recomendacao}" class="form-control" readonly>
																		</div>
																	</div>
																</div>
																<div class="row">
																	<div class="col-md-12">
																		<div class="form-group">
																			<label>Justificativa</label>
																			<textarea rows="5" name="justificativa" class="form-control" readonly>${parecer.justificativa}</textarea>
																		</div>
																	</div>
																</div>
															</form>
														</div>
													</div>
												</c:otherwise>
											</c:choose>
										</c:when>
										<%-- Fim do teste de o usu�rio ser Web-designer --%>
										
										<%-- Testa se o usu�rio � gerente da �rea de TI --%>
										<c:when test="${tipoDeUsuario == 'gerente' && setor == 'TI'}">
											<div class="card ">
												<div class="header">
													<h4 class="title">PARECER T�CNICO</h4>
												</div>
												<div class="content">
													<form>
														<div class="row">
															<div class="col-md-12">
																<div class="form-group">
																	<label>Recomenda��o</label> 
																	<input type="text" name="recomendacao" value="${parecer.recomendacao}" class="form-control" readonly>
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col-md-12">
																<div class="form-group">
																<label>Justificativa</label>
																<textarea rows="5" name="justificativa" class="form-control" readonly>${parecer.justificativa}</textarea>
																</div>
															</div>
														</div>
													</form>
												</div>
											</div>
										</c:when>
										<%-- Fim do Test de o usu�rio ser gerente da �rea de TI --%>
										
									</c:choose>
									<%-- Fim da Exibi��o do formul�rio para edi��o de Parecer para o webdesigner ou
									da exibi��o do parecer para o Gerente da �rea de TI --%>
									
								</c:when>
								<%-- Fim do teste de n�o haver Parecer para a Solicita��o --%>
								
							</c:choose>
							<%-- Fim do Cart�o do Parecer T�cnico --%>
							
							<%-- Cart�o de Avalia��o da Solicita��o --%>
							<c:choose>
							
								<%-- Testa se o usu�rio � o Gerente da �rea de TI --%>
								<c:when test="${tipoDeUsuario == 'gerente' && setor == 'TI'}">
									
									<%-- Exibe o formul�rio de emiss�o/edi��o de Avalia��o da solicita��o --%>
									<c:choose>
										
										<%-- Testa se n�o h� avalia��o emitida para esta solicita��o --%>
										<c:when test="${empty avaliacaoDeSolicitacao}">
											<div class="card">
												<div class="header">
													<h4 class="title">AVALIA��O DA SOLICITA��O</h4>
												</div>
												<div class="content">
													<form action="AvaliacaoDeSolicitacaoController">
														<input type="radio" name="resposta" value="Aprovar" /> Aprovar <br />
														<input type="radio" name="resposta" value="Reprovar" /> Reprovar <br />
														<div class="row">
															<div class="col-md-12">
																<div class="form-group">
																	<label>Justificativa</label>
																	<textarea rows="5" name="justificativa"
																		class="form-control"></textarea>
																</div>
															</div>
														</div>
														
														<input type="hidden" name="acao" value="emitir" />
														<input type="hidden" name="idSolicitacaoDeDesenvolvimento"
															value="${solicitacaoDeDesenvolvimento.id}" /> 
														<button type="submit" class="btn btn-success btn-fill pull-left">AVALIAR</button>
															<div class="clearfix"></div>
													</form>
												</div>
											</div>
										</c:when>
										<%-- Fim do teste de n�o haver avalia��o emitida para esta solicita��o --%>
										
										<%-- Testa se n�o h� avalia��o para esta solicita��o --%>
										<c:when test="${not empty avaliacaoDeSolicitacao}">
											<div class="card">
												<div class="header">
													<h4 class="title">AVALIA��O DA SOLICITA��O</h4>
												</div>
												<div class="content">
													
													<%-- Habilita ou desabilita a edi��o desta avalia��o de desenvolvimento --%>
													<c:choose>
														
														<%-- Testa se esta solicita��o foi inclu�da em um projeto --%>
														<c:when test="${not empty solicitacaoDeDesenvolvimento.projetos}">
																	
															<c:choose>
																<c:when test="${avaliacaoDeSolicitacao.resposta == 'Aprovar'}">
																	<div class="form-check form-check-radio disabled">
																		<div class="form-check form-check-radio">
																			<label class="form-check-label">
																				<input type="radio" class="form-check-input" name="resposta" value="Aprovar" checked disabled="disabled" /> 
																				<span class="form-check-sign"></span>
																				Aprovar
																			</label>
																		</div>
																		<div class="form-check form-check-radio">
																			<label class="form-check-label">
																				<input type="radio" class="form-check-input" name="resposta" value="Reprovar" disabled="disabled" />
																				<span class="form-check-sign"></span>
																				Reprovar
																			</label>
																		</div>
																	</div>
																</c:when>
																<c:otherwise>
																	<div class="form-check form-check-radio disabled">
																		<label class="form-check-label">
																			<input type="radio" class="form-check-input" name="resposta" value="Aprovar" disabled="disabled" />
																			<span class="form-check-sign"></span>
																			Aprovar
																		</label>
																	</div>
																	<div class="form-check form-check-radio">
																		<label class="form-check-label">
																			<input type="radio" class="form-check-input" name="resposta" value="Reprovar" checked disabled="disabled"/>
																			<span class="form-check-sign"></span>
																			Reprovar
																		</label>
																	</div>
																</c:otherwise>
															</c:choose>
															<div class="form-group">
																<div class="row">
																	<div class="col-md-12">
																		<div class="form-group">
																			<label>Justificativa</label>
																			<textarea rows="5" name="justificativa" class="form-control" readonly>${avaliacaoDeSolicitacao.justificativa}</textarea>
																		</div>
																	</div>
																</div>
															</div>	
															
														</c:when>
														<%-- FIm do teste desta solicita��o estar inclu�da em um projeto --%>
														
														<%-- Testa se esta solicita��o n�o foi inclu�da em um projeto --%>
														<c:when test="${empty solicitacaoDeDesenvolvimento.projetos}">
															<form action="AvaliacaoDeSolicitacaoController">
																<label>Avalia��o</label>
																
																<%-- Habilita ou desabilita os radio buttons --%>
																<c:choose>
																	<c:when test="${avaliacaoDeSolicitacao.resposta == 'Aprovar'}">
																		<div class="form-check form-check-radio">
																			<label class="form-check-label">
																				<input type="radio" class="form-check-input" name="resposta" value="Aprovar" checked /> 
																				<span class="form-check-sign"></span>
																				Aprovar
																			</label>
																		</div>
																		<div class="form-check form-check-radio">
																			<label class="form-check-label">
																				<input type="radio" class="form-check-input" name="resposta" value="Reprovar" />
																				<span class="form-check-sign"></span>
																				Reprovar
																			</label>
																		</div>
																	</c:when>
																	<c:otherwise>
																		<div class="form-check form-check-radio disabled">
																			<label class="form-check-label">
																				<input type="radio" class="form-check-input" name="resposta" value="Aprovar" />
																				<span class="form-check-sign"></span>
																				Aprovar
																			</label>
																		</div>
																		<div class="form-check form-check-radio disabled">
																			<label class="form-check-label">
																				<input type="radio" class="form-check-input" name="resposta" value="Reprovar" checked />
																				<span class="form-check-sign"></span>
																				Reprovar
																			</label>
																		</div>
																	</c:otherwise>
																</c:choose>
																<%-- Fim da habilita��o ou desabilita��o os radio buttons --%>
																
																<div class="row">
																	<div class="col-md-12">
																		<div class="form-group">
																			<div class="row">
																			<div class="col-md-12">
																				<div class="form-group">
																					<label>Justificativa</label>
																						<textarea rows="5" name="justificativa" class="form-control">${avaliacaoDeSolicitacao.justificativa}</textarea>
																					</div>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																
																<input type="hidden" name="acao" value="editar" />
																<input type="hidden" name="idAvaliacaoDeSolicitacao" value="${avaliacaoDeSolicitacao.id}" />
																<input type="hidden" name="idSolicitacaoDeDesenvolvimento" value="${solicitacaoDeDesenvolvimento.id}" />
																<button type="submit" class="btn btn-success btn-fill pull-left">EDITAR</button>
															</form>
															<form action="AvaliacaoDeSolicitacaoController">
																<input type="hidden" name="acao" value="excluir" />
																<input type="hidden" name="idAvaliacaoDeSolicitacao" value="${avaliacaoDeSolicitacao.id}" />
																<input type="hidden" name="idSolicitacaoDeDesenvolvimento" value="${solicitacaoDeDesenvolvimento.id}" />
																<button type="submit" class="btn btn-danger btn-fill pull-right">EXCLUIR</button>
																<div class="clearfix"></div>
															</form>
														</c:when>
														<%-- FIm do teste desta solicita��o n�o estar inclu�da em um projeto --%>
														
													</c:choose>
													<%-- Fim da habilita��o ou desabilita��o da edi��o desta avalia��o de desenvolvimento --%>
													
												</div>
											</div>
										</c:when>
										<%-- Fim do teste de haver avalia��o emitida para esta solicita��o --%>
										
									</c:choose>
									<%-- Fim da Exibi��o do formul�rio de emiss�o/edi��o de Avalia��o da solicita��o --%>
									
								</c:when>
								<%-- Fim do Teste de o usu�rio ser o Gerente da �rea de TI --%>	
								
							</c:choose>
							<%-- Fim do cart�o de Avalia��o da Solicita��o --%>
								
						</c:when>
						<%-- Fim da exibi��o da solicita��o de desenvolvimento --%>
								
					</c:choose>
					<%-- Fim do Teste de criar uma nova solicita��o de desenvolvimento ou editar uma j� existente --%>
					
				</div>
				<!-- Fim do container -->
				
			</div>
			<!-- Fim do conte�do da P�gina -->
			
			<!-- In�cio do rodap� -->
			<footer class="footer">
				<div class="container-fluid">
					<p class="copyright pull-right">
						&copy;
						<script>
							document.write(new Date().getFullYear())
						</script>
						<a href="https://www.nathanaellima.com">Nathanael Lima</a>
					</p>
				</div>
			</footer>
			<!-- Fim do rodap� -->

		</div>
	</div>
	
	<c:import url="/common/rodape.jsp" />
	
	<!--  Two-side Multi Select Plugin    -->
    <script src="assets/js/multiselect.js"></script>
    <script type="text/javascript">
	    jQuery(document).ready(function($) {
	        $('.js-multiselect').multiselect({
	            right: '#estruturasDeWebsitesSolicitadas',
	            rightAll: '#incluirTodas',
	            rightSelected: '#incluirUma',
	            leftSelected: '#excluirUma',
	            leftAll: '#excluirTodas'
	        });
	    });
	    </script>
    
</body>
</html>