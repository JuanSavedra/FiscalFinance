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
        <h1 class="customized-title mb-4 p-3 border-bottom text-center fw-bold">Poupança</h1>
        <div class="container">
            <form method="post" action="deposits?action=register">
                <div class="d-flex flex-column align-items-center mt-3 mb-3">
                    <label class="fs-1 mb-3 fw-medium" for="Descrição">Descrição</label>
                    <input id="Descrição" name="Descrição" class="w-100 fs-2 m-0 p-3 text-center rounded-3"
                           placeholder="Descrição da transação" type="text">
                </div>
                <div class="d-flex flex-column align-items-center mt-3 mb-3">
                    <label class="fs-1 mb-3 fw-medium" for="Valor">Valor</label>
                    <input id="Valor" name="Valor" class="w-100 fs-2 m-0 p-3 text-center rounded-3"
                           placeholder="Valor da transação"
                           type="number" required>
                </div>
                <div class="text-center mt-5">
                    <input class="green-button mb-4 p-3 w-75 border rounded-3 text-white fw-bold fs-2 text-center"
                           type="submit"
                           value="Criar Depósito"
                    />
                </div>
            </form>
        </div>
        </div>
    </main>
    <%@include file="Footer.jsp" %>
</body>
</html>
