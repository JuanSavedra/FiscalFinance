<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
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
    <main class="container-fluid">
        <section>
            <h1 class="border rounded-3 text-results site-name p-4 mt-4 mb-4 text-center fw-bold">
                Olá, seja bem-vindo a Fiscal<span>Finance</span>
            </h1>
        </section>
        <section>
            <div class="card text-center mt-4 mb-4">
                <div class="card-header" style="background-color: rgba(255,223,56,0.6);">
                    Qual o objetivo do site?
                </div>
                <div class="card-body p-5">
                    <h5 class="card-title">Controlar suas finanças</h5>
                    <p class="site-name card-text">Com a Fiscal<span>Finance</span>, você pode controlar suas finanças de forma organizada.</p>
                </div>
                <div class="card-footer text-muted p-3" style="background-color: rgba(255,223,56,0.6);">

                </div>
            </div>
            <div class="card text-center mt-4 mb-4">
                <div class="card-header" style="background-color: rgba(115,215,75,0.6);">
                    Transações
                </div>
                <div class="card-body p-5" >
                    <h5 class="card-title">Crie, edite e remove transações</h5>
                    <p class="site-name card-text">Aqui, você pode organizar suas transações, entradas e saídas, de forma dinâmica.</p>
                </div>
                <div class="card-footer text-muted p-3" style="background-color: rgba(115,215,75,0.6);">

                </div>
            </div>
            <div class="card text-center mt-4 mb-4">
                <div class="card-header" style="background-color: rgba(75,136,215,0.6);">
                    Poupança
                </div>
                <div class="card-body p-5">
                    <h5 class="card-title">Crie sua poupança</h5>
                    <p class="site-name card-text">Quer juntar dinheiro? Guarde na poupança do nosso site, e organize melhor sua economia.</p>
                </div>
                <div class="card-footer text-muted p-3" style="background-color: rgba(75,136,215,0.6);">

                </div>
            </div>
        </section>
    </main>
    <%@include file="Footer.jsp" %>
</body>
</html>