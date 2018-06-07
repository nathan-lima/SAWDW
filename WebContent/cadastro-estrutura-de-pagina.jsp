<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html lang="pt-br">
<head>
	<title>SAEDW - Cadastrar Estrutura de P�gina</title>
	<c:import url="/common/cabecalho.jsp" />
</head>
<body>
<div class="wrapper">
	<c:choose>
		<c:when test="${tipoDeUsuario == 'webDesigner'}">
			<div class="sidebar" data-color="red" data-image="assets/img/sidebar-5.jpg">
    
		    	<div class="sidebar-wrapper">
		            <div class="logo">
		                <a href="http://localhost:8080/PTCC/painel-web-designer.jsp" class="simple-text">
		                    SAEDW
		                </a>
		            </div>
		
		            <ul class="nav">
		                <li>
		                    <a href="categoriaDeWebsites?acao=listar">
		                   		<i class="pe-7s-folder"></i>
		                        <p>Categorias de Websites</p>
		                    </a>
		                </li>
		                <li class="active">
		                    <a href="EstruturaDeWebsiteController">
		                    	<i class="pe-7s-browser"></i>
		                        <p>Estruturas de Websites</p>
		                    </a>
		                </li>
		                <li>
		                    <a href="SolicitacaoDeDesenvolvimentoController">
		                    	<i class="pe-7s-bell"></i>
		                        <p>Solicitacoes de Desenvolvimento</p>
		                    </a>
		                </li>
		            </ul>
		    	</div>
		    </div>
		</c:when>
		<c:otherwise>
			<div class="sidebar" data-color="azure" data-image="assets/img/sidebar-5.jpg">
    
		    	<div class="sidebar-wrapper">
		            <div class="logo">
		                <a href="http://localhost:8080/SAEDW/painel-colaborador.jsp" class="simple-text">
		                    SAEDW
		                </a>
		            </div>
		
		            <ul class="nav">
		            	<li>
		                    <a href="pagina-da-instituicao.jsp">
		                        <i class="pe-7s-culture"></i>
		                        <p>${usuario.instituicao.nomeFantasia}</p>
		                    </a>
		                </li>
		            	<li class="active">
		                    <a href="EstruturaDeWebsiteController">
		                        <i class="pe-7s-browser"></i>
		                        <p>Estruturas de Websites</p>
		                    </a>
		                </li>
		            </ul>
		    	</div>
		    </div>
		</c:otherwise>
	</c:choose>    
		
		<div class="main-panel">
		<nav class="navbar navbar-default navbar-fixed">
            <div class="container-fluid">
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="LogoutController">
                                <p>SAIR</p>
                            </a>
                        </li>
						<li class="separator hidden-lg hidden-md"></li>
                    </ul>
                </div>
            </div>
        </nav>


        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                    	<c:choose>
							<c:when test="${empty estruturaDePagina.id}">
		                        <div class="card">
		                            <div class="header">
		                            	<h4 class="title">CADASTRAR ESTRUTURA DE P�GINA</h4>
		                            </div>
		                            <div class="content">
										<form action="EstruturaDePaginaController">
		                                    <div class="row">
		                                        <div class="col-md-12">
		                                            <div class="form-group">
		                                                <label>T�tulo</label>
		                                                <input type="text" name="titulo" class="form-control">
		                                            </div>
		                                        </div>
		                                    </div>
		                                    
		                                    <div class="row">
		                                        <div class="col-md-12">
		                                            <div class="form-group">
		                                                <label>Conte�do</label>
		                                                <textarea rows="10" name="conteudo" class="form-control"></textarea>
		                                            </div>
		                                        </div>
		                                    </div>
		                                    
		                                    <input type="hidden" name="idEstruturaDeWebsite" value="${idEstruturaDeWebsite}" />
		                                    <input type="hidden" name="acao" value="cadastrar" />
		                                    
		                                    <button type="submit" class="btn btn-success btn-fill pull-left">CADASTRAR</button>
		                                    
		                                    <div class="clearfix"></div>
		                                </form>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="card">
		                            <div class="header">
		                            	<c:choose>
		                            		<c:when test="${tipoDeUsuario == 'webDesigner'}">
		                            			<h4 class="title">EDITAR ESTRUTURA DE P�GINA</h4>
		                            		</c:when>
		                            		<c:otherwise>
		                            			<h4 class="title">VISUALIZAR ESTRUTURA DE P�GINA</h4>
		                            		</c:otherwise>
		                            	</c:choose>
		                            </div>
		                            <div class="content">
		                            	<c:choose>
		                            		<c:when test="${tipoDeUsuario == 'webDesigner'}">
												<form action="EstruturaDePaginaController">
				                                    <div class="row">
				                                        <div class="col-md-12">
				                                            <div class="form-group">
				                                                <label>T�tulo</label>
				                                                <input type="text" name="titulo" value="${estruturaDePagina.titulo}" class="form-control">
				                                            </div>
				                                        </div>
				                                    </div>
				                                    
				                                    <div class="row">
				                                        <div class="col-md-12">
				                                            <div class="form-group">
				                                                <label>Conte�do</label>
				                                                <textarea rows="10" name="conteudo" class="form-control">${estruturaDePagina.conteudo}</textarea>
				                                            </div>
				                                        </div>
				                                    </div>
				                                    
				                                    <input type="hidden" name="id" value="${estruturaDePagina.id}" />
													<input type="hidden" name="acao" value="editar" />
													
				                                    <button type="submit" class="btn btn-success btn-fill pull-left">EDITAR</button>
				                                    
				                                    <div class="clearfix"></div>
				                                </form>
											</c:when>
											<c:otherwise>
												<table class="table table-bordered table-hover">
													<thead>
														<tr>
															<th>T�tulo da P�gina</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>${estruturaDePagina.titulo}</td>
														</tr>
													</tbody>
													<thead>
														<tr>
															<th>Conte�do</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>${estruturaDePagina.conteudo}</td>
														</tr>
													</tbody>
												</table>
											</c:otherwise>
		                            	</c:choose>
		                            </div>
		                    	</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
        </div>


        <footer class="footer">
            <div class="container-fluid">
                <p class="copyright pull-right">
                    &copy; <script>document.write(new Date().getFullYear())</script> <a href="https://www.nathanaellima.com">Nathanael Lima</a>
                </p>
            </div>
        </footer>

    </div>
</div>
</body>