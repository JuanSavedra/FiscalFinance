<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
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
            <div class="flex flex-col sm:flex-row justify-between items-start sm:items-center mb-6">
                <div>
                    <h1 class="text-3xl font-bold text-gray-800 dark:text-white">Histórico de Transações</h1>
                    <p class="mt-1 text-lg text-gray-600 dark:text-gray-400">Visualize e gerencie suas movimentações financeiras.</p>
                </div>
                <button id="open-modal-btn" class="mt-4 sm:mt-0 w-full sm:w-auto flex items-center justify-center px-4 py-2 border border-transparent rounded-lg shadow-sm text-sm font-medium text-white bg-emerald-600 hover:bg-emerald-700">
                     <svg class="h-5 w-5 mr-2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                        <path d="M10.75 4.75a.75.75 0 0 0-1.5 0v4.5h-4.5a.75.75 0 0 0 0 1.5h4.5v4.5a.75.75 0 0 0 1.5 0v-4.5h4.5a.75.75 0 0 0 0-1.5h-4.5v-4.5Z" />
                    </svg>
                    <a href="./cadastro-transacao.jsp">Adicionar Nova Transação</a>
                </button>
            </div>
            <div class="mb-6 bg-white dark:bg-gray-800 p-4 rounded-lg shadow-sm">
                <div class="flex flex-col sm:flex-row sm:items-end gap-4">
                    <div>
                        <label for="date-start" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Data Início</label>
                        <input type="date" id="date-start" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-emerald-500 focus:border-emerald-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600">
                    </div>
                    <div>
                        <label for="date-end" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Data Fim</label>
                        <input type="date" id="date-end" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-emerald-500 focus:border-emerald-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600">
                    </div>
                    <button id="clear-filter-btn" class="px-4 py-2.5 bg-gray-600 text-white rounded-lg text-sm font-medium hover:bg-gray-700">Limpar Filtro</button>
                </div>
            </div>
            <div class="bg-white dark:bg-gray-800 rounded-xl shadow-lg overflow-hidden">
                <div class="overflow-x-auto">
                    <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
                        <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                            <tr>
                                <th scope="col" class="px-6 py-3">Nome</th>
                                <th scope="col" class="px-6 py-3">Descrição</th>
                                <th scope="col" class="px-6 py-3">Valor</th>
                                <th scope="col" class="px-6 py-3">Tipo</th>
                                <th scope="col" class="px-6 py-3">Data</th>
                                <th scope="col" class="px-6 py-3"></th>
                                <th scope="col" class="px-6 py-3"></th>
                            </tr>
                        </thead>
                        <tbody id="transactions-table-body">
                            <c:forEach items="${transactionsList}" var="transaction">
                                <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
                                    <td class="px-6 py-4 font-medium text-gray-900 dark:text-white">${transaction.name}</td>
                                    <td class="px-6 py-4">${transaction.description}</td>
                                    <td class="px-6 py-4 font-semibold">${transaction.value}</td>
                                    <td class="px-6 py-4"><span class="px-2 py-1 text-xs rounded-full">${transaction.type}</span></td>
                                    <td class="px-6 py-4">${transaction.createdAt}</td>
                                    <td>
                                        <c:url value="transactions" var="link">
                                            <c:param name="action" value="open-edit-form"/>
                                            <c:param name="id" value="${transaction.id}"/>
                                        </c:url>
                                        <a href="${link}" class="text-blue-400 hover:text-blue-600">Editar</a>
                                    </td>
                                    <td>
                                        <form 
                                            action="transactions?action=delete" 
                                            method="post" 
                                            onsubmit="return confirm('Tem certeza que deseja excluir esta transação?');"
                                        >
                                            <input type="hidden" name="Id" value="${transaction.id}">
                                            <button type="submit" class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded">
                                                Excluir
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${transactionsList.isEmpty()}">
                                <tr>
                                    <td colspan="5" class="text-center py-10 text-gray-500">Nenhuma transação encontrada.</td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </main>
    <%@include file="Footer.jsp" %>
</body>
</html>
