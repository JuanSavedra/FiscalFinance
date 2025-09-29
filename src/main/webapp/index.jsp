<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
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
    <%@include file="Header.jsp" %>
    <main class="p-6 sm:p-8">
        <div class="max-w-7xl mx-auto">
            <div class="mb-8">
                <h1 class="text-3xl font-bold text-gray-800 dark:text-white">Olá!</h1>
                <p class="mt-1 text-lg text-gray-600 dark:text-gray-400">Bem-vinda ao seu painel. Aqui está um
                    resumo da sua saúde financeira.
                </p>
            </div>
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                <div class="bg-white dark:bg-gray-800 rounded-xl shadow-lg p-6">
                    <div class="flex justify-between items-center">
                        <h3 class="text-lg font-semibold text-gray-800 dark:text-white">Entradas</h3>
                    </div>
                    <div class="mt-4">
                        <h3 id="entradas-valor" class="text-3xl font-bold text-green-600 dark:text-green-400">
                            <fmt:formatNumber value="${totalEntries}" type="currency" currencySymbol="R$ "/>
                        </h3>
                    </div>
                </div>
                <div class="bg-white dark:bg-gray-800 rounded-xl shadow-lg p-6">
                    <div class="flex justify-between items-center">
                        <h3 class="text-lg font-semibold text-gray-800 dark:text-white">Saídas</h3>
                    </div>
                    <div class="mt-4">
                        <h3 id="saidas-valor" class="text-3xl font-bold text-red-600 dark:text-red-400">
                            <fmt:formatNumber value="${totalExits}" type="currency" currencySymbol="R$ "/>
                        </h3>
                    </div>
                </div>
                <div class="bg-white dark:bg-gray-800 rounded-xl shadow-lg p-6">
                    <div class="flex justify-between items-center">
                        <h3 class="text-lg font-semibold text-gray-800 dark:text-white">Cofrinho</h3>
                    </div>
                    <div class="mt-4">
                        <h3 id="cofrinho-valor" class="text-3xl font-bold text-gray-800 dark:text-blue-400">
                            <fmt:formatNumber value="${totalSavings}" type="currency" currencySymbol="R$ "/>
                        </h3>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <%@include file="Footer.jsp" %>
</body>
</html>