<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100..900;1,100..900&display=swap"
          rel="stylesheet">
    <link rel="stylesheet" href="./resources/css/styles.css">
    <link rel="stylesheet" href="./resources/css/bootstrap.css">
    <title>FiscalFinance</title>
</head>
<body>
    <%@include file="Header.jsp" %>
    <main>
        <h1 class="customized-title mb-4 p-3 border-bottom text-center fw-bold">Editar Transação</h1>
        <div class="container">
            <form method="post" action="transactions?action=edit">
                <input name="Id" type="hidden" value="${transaction.id}"/>

                <div class="d-flex flex-column align-items-center mt-3 mb-3">
                    <label class="fs-1 mb-3 fw-medium" for="Nome">Nome</label>
                    <input id="Nome" name="Nome" class="w-100 fs-2 m-0 p-3 text-center rounded-3"
                           placeholder="Nome da transação"
                           type="text" value="${transaction.name}" required>
                </div>
                <div class="mt-3 mb-3">
                    <fieldset>
                        <h1 class="text-center mb-3 fw-medium">Tipo</h1>
                        <div class="type-box d-flex justify-content-center p-4 rounded-3">
                            <div class="p-2">
                                <label class="fs-1" for="Tipo">Entrada</label>
                                <c:if test="${transaction.type == 'Entrada'}">
                                    <input id="Tipo" name="Tipo" value="Entrada" type="radio" checked>
                                </c:if>
                                <c:if test="${transaction.type == 'Saída'}">
                                    <input id="Tipo" name="Tipo" value="Entrada" type="radio">
                                </c:if>
                            </div>
                            <div class="p-2">
                                <label class="fs-1" for="Tipo">Saída</label>
                                <c:if test="${transaction.type == 'Entrada'}">
                                    <input id="Tipo" name="Tipo" value="Saída" type="radio">
                                </c:if>
                                <c:if test="${transaction.type == 'Saída'}">
                                    <input id="Tipo" name="Tipo" value="Saída" type="radio" checked>
                                </c:if>
                            </div>
                        </div>
                    </fieldset>
                </div>
                <div class="d-flex flex-column align-items-center mt-3 mb-3">
                    <label class="fs-1 mb-3 fw-medium" for="Valor">Valor</label>
                    <input id="Valor" name="Valor" class="w-100 fs-2 m-0 p-3 text-center rounded-3"
                           placeholder="Valor da transação"
                           type="number" value="${transaction.value}" required>
                </div>
                <div class="d-flex flex-column align-items-center mt-3 mb-3">
                    <label class="fs-1 mb-3 fw-medium" for="Descrição">Descrição</label>
                    <input id="Descrição" name="Descrição" class="w-100 fs-2 m-0 p-3 text-center rounded-3"
                           placeholder="Descrição da transação" value="${transaction.description}" type="text">
                </div>
                <div class="text-center mt-5">
                    <input class="green-button btn-primary mb-4 p-3 w-75 border rounded-3 text-white fw-bold fs-2 text-center"
                           type="submit"
                           value="Editar Transação">
                </div>
            </form>
        </div>
        </div>
    </main>
    <%@include file="Footer.jsp" %>
</body>
</html>
