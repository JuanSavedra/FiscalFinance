<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100..900;1,100..900&display=swap"
          rel="stylesheet">
    <link rel="stylesheet" href="./resources/css/login.css">
    <link rel="stylesheet" href="./resources/css/bootstrap.css">
    <title>FiscalFinance</title>
</head>
<body class="container d-flex flex-column align-items-center justify-content-center">
    <main>
        <form method="post" action="register">
            <div class="loginContainer text-center rounded border p-4">
                <img class="iconFinance" src="./resources/src/FinanceIcon.png" alt="Ícone finança">
                <div class="p-3">
                    <h1 class="title">FISCAL</h1>
                    <h1 class="title">FINANCE</h1>
                </div>
                <div>
                    <input
                            id="UsuarioRegistro"
                            name="UsuarioRegistro"
                            class="input w-100 rounded-lg text-center"
                            placeholder="Digite seu nome de usuário"
                            type="text"
                            required
                    />
                </div>
                <div class="mt-2">
                    <input
                            id="EmailRegistro"
                            name="EmailRegistro"
                            class="input w-100 rounded-lg text-center"
                            placeholder="Digite seu e-mail"
                            type="email"
                            required
                    />
                </div>
                <div class="mt-2">
                    <input
                            id="SenhaRegistro"
                            name="SenhaRegistro"
                            class="input w-100 text-center"
                            placeholder="Digite sua senha"
                            type="password"
                            required
                    />
                    <div class="p-2 gap-1">
                        <input
                                id="CheckboxPassword"
                                name="CheckboxPassword"
                                onclick="showPassword()"
                                type="checkbox"
                        >
                        <label for="CheckboxPassword">Exibir senha</label>
                    </div>
                </div>
                <input type="submit" class="button loginButton border rounded p-2 mt-2 mb-2" href="#" value="Registrar">
            </div>
        </form>
    </main>
    <script src="./resources/js/scripts.js"></script>
</body>
</html>