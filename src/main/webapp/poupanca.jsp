<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
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
        <section>
            <div class="container-fluid d-flex justify-content-between align-items-center mt-5">
                <div>
                    <h1 class="border-bottom p-1">
                        Todos os depósitos
                    </h1>
                </div>
            </div>
        </section>
        <section>
            <div class="container-fluid mt-5">
                <table class="border table fs-3">
                    <thead>
                    <tr>
                        <th scope="col">Descrição</th>
                        <th scope="col">Valor</th>
                        <th scope="col">Criado em</th>
                        <th scope="col">Info</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${depositsList}" var="deposit">
                        <tr>
                            <td class="border">${deposit.description}</td>
                            <td class="border">${deposit.value}</td>
                            <td class="border">${deposit.createdAt}</td>
                            <td>
                                <c:url value="deposits" var="link">
                                    <c:param name="action" value="open-edit-form"/>
                                    <c:param name="id" value="${deposit.id}"/>
                                </c:url>
                                <a href="${link}" class="btn btn-primary fw-bold">Editar</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <c:if test="${depositsList.isEmpty()}">
                    <h4 class="p-3 text-center text-secondary">Você ainda não tem nenhum depósito.</h4>
                </c:if>
            </div>
        </section>
        <section>
            <div class="container-fluid d-flex justify-content-center align-items-center mt-5">
                <div>
                    <a class="green-button text-decoration-none p-3 border rounded-3 text-white fw-bold"
                       href="./cadastro-poupanca.jsp">
                        Criar novo depósito
                    </a>
                </div>
            </div>
        </section>
    </main>
    <%@include file="Footer.jsp" %>
</body>
</html>
