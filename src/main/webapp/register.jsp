<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <title>FiscalFinance</title>
    <style>
        body {
            font-family: 'Inter', sans-serif;
        }
    
        .custom-select {
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            background-image: url('data:image/svg+xml;utf8,<svg fill="gray" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="M7 10l5 5 5-5z"/><path d="M0 0h24v24H0z" fill="none"/></svg>');
            background-repeat: no-repeat;
            background-position-x: 100%;
            background-position-y: 5px;
            padding-right: 2rem;
        }
    
        .modal {
            transition: opacity 0.3s ease, visibility 0.3s ease;
        }
    
        .modal-content,
        .dropdown-menu {
            transition: transform 0.2s ease-out, opacity 0.2s ease-out;
        }
    </style>
</head>
<body class="bg-gray-100 dark:bg-gray-900">
    <div class="flex min-h-screen">
        <div class="w-full lg:w-1/2 flex items-center justify-center p-8 sm:p-12">
            <div class="w-full max-w-md">
                <div class="text-center lg:text-left mb-10">
                    <h2 class="text-3xl font-bold text-gray-800 dark:text-white">Crie sua conta</h2>
                    <p class="mt-2 text-gray-600 dark:text-gray-400">Comece a transformar sua vida financeira hoje
                        mesmo.
                    </p>
                </div>
                <form id="register-form" method="post" action="register" class="space-y-5">
                    <div>
                        <label for="UsuarioRegistro"
                            class="block text-sm font-medium text-gray-700 dark:text-gray-300">Nome
                            Completo</label>
                        <input id="UsuarioRegistro" name="UsuarioRegistro" placeholder="Digite seu nome de usuário"
                            type="text" autocomplete="name" required
                            class="mt-1 block w-full px-3 py-2 bg-white dark:bg-gray-800 border border-gray-300 dark:border-gray-600 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-emerald-500 focus:border-emerald-500">
                    </div>
                    <div>
                        <label for="EmailRegistro"
                            class="block text-sm font-medium text-gray-700 dark:text-gray-300">Email</label>
                        <input id="EmailRegistro" name="EmailRegistro" placeholder="Digite seu e-mail" type="email"
                            autocomplete="email" required
                            class="mt-1 block w-full px-3 py-2 bg-white dark:bg-gray-800 border border-gray-300 dark:border-gray-600 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-emerald-500 focus:border-emerald-500">
                    </div>
                    <div>
                        <label for="SenhaRegistro"
                            class="block text-sm font-medium text-gray-700 dark:text-gray-300">Senha</label>
                        <input id="SenhaRegistro" name="SenhaRegistro" placeholder="Digite sua senha" type="password"
                            autocomplete="new-password" required
                            class="mt-1 block w-full px-3 py-2 bg-white dark:bg-gray-800 border border-gray-300 dark:border-gray-600 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-emerald-500 focus:border-emerald-500">
                    </div>
                    <div>
                        <button href="#" value="Registrar" type="submit"
                            class="w-full flex justify-center py-3 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-emerald-600 hover:bg-emerald-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-emerald-500">Criar
                            Conta</button>
                    </div>
                </form>
                <p class="mt-8 text-center text-sm text-gray-600 dark:text-gray-400">Já tem uma conta? <a
                        href="home.jsp" class="font-medium text-emerald-600 hover:text-emerald-500">Faça login</a></p>
            </div>
        </div>
        <div class="hidden lg:block relative w-1/2 bg-gray-800">
            <img class="absolute inset-0 h-full w-full object-cover"
                src="https://images.unsplash.com/photo-1553729459-efe14ef6055d?q=80&w=2070&auto=format&fit=crop"
                alt="Cofrinho e moedas">
            <div class="absolute inset-0 bg-emerald-800 bg-opacity-70"></div>
            <div class="relative flex flex-col justify-center items-start h-full p-20">
                <div class="flex items-center mb-4">
                    <svg class="h-12 w-auto text-white" xmlns="http://www.w3.org/2000/svg" fill="none"
                        viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round"
                            d="M2.25 18.75a60.07 60.07 0 0 1 15.797 2.101c.727.198 1.453-.342 1.453-1.096V18.75M3.75 4.5v.75A.75.75 0 0 1 3 6h-.75m0 0v-.375c0-.621.504-1.125 1.125-1.125H20.25M2.25 6v9m18-10.5v.75c0 .414-.336.75-.75.75h-.75m0-1.5h.375c.621 0 1.125.504 1.125 1.125v9.75c0 .621-.504 1.125-1.125 1.125h-.375m1.5-1.5H21a.75.75 0 0 0-.75.75v.75m0 0H3.75m0 0h-.375a1.125 1.125 0 0 1-1.125-1.125V15m1.5 1.5v-.75A.75.75 0 0 0 3 15h-.75M15 10.5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm3 0h.008v.008H18V10.5Zm-12 0h.008v.008H6V10.5Z" />
                    </svg>
                    <h1 class="ml-3 text-4xl font-bold text-white">FiscalFinance</h1>
                </div>
                <p class="text-2xl text-white mt-4 max-w-md">O primeiro passo para um futuro financeiro sólido começa
                    aqui.
                </p>
            </div>
        </div>
    </div>
</body>
</html>