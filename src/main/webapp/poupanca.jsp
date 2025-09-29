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
                    <h1 class="text-3xl font-bold text-gray-800 dark:text-white">Histórico de Depósitos</h1>
                    <p class="mt-1 text-lg text-gray-600 dark:text-gray-400">Visualize e gerencie suas movimentações financeiras.</p>
                </div>
                <button id="open-modal-btn" class="mt-4 sm:mt-0 w-full sm:w-auto flex items-center justify-center px-4 py-2 border border-transparent rounded-lg shadow-sm text-sm font-medium text-white bg-emerald-600 hover:bg-emerald-700">
                     <svg class="h-5 w-5 mr-2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                        <path d="M10.75 4.75a.75.75 0 0 0-1.5 0v4.5h-4.5a.75.75 0 0 0 0 1.5h4.5v4.5a.75.75 0 0 0 1.5 0v-4.5h4.5a.75.75 0 0 0 0-1.5h-4.5v-4.5Z" />
                    </svg>
                    <a href="./cadastro-poupanca.jsp">Adicionar Novo Depósito</a>
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
                                <th scope="col" class="px-6 py-3">Descrição</th>
                                <th scope="col" class="px-6 py-3">Valor</th>
                                <th scope="col" class="px-6 py-3">Data</th>
                                <th scope="col" class="px-6 py-3"></th>
                                <th scope="col" class="px-6 py-3"></th>
                            </tr>
                        </thead>
                        <tbody id="deposits-table-body">
                            <c:forEach items="${depositsList}" var="deposit">
                                <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
                                    <td class="px-6 py-4">${deposit.description}</td>
                                    <td class="px-6 py-4 font-semibold">${deposit.value}</td>
                                    <td class="px-6 py-4">${deposit.createdAt}</td>
                                    <td>
                                        <c:url value="deposits" var="link">
                                            <c:param name="action" value="open-edit-form"/>
                                            <c:param name="id" value="${deposit.id}"/>
                                        </c:url>
                                        <a href="${link}" class="text-blue-400 hover:text-blue-600">Editar</a>
                                    </td>
                                    <td>
                                        <form 
                                            action="deposits?action=delete" 
                                            method="post" 
                                            onsubmit="return confirm('Tem certeza que deseja excluir este depósito?');"
                                        >
                                            <input type="hidden" name="Id" value="${deposit.id}">
                                            <button type="submit" class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded">
                                                Excluir
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${depositsList.isEmpty()}">
                                <tr>
                                    <td colspan="5" class="text-center py-10 text-gray-500">Nenhum depósito encontrado.</td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </main>
    <div id="add-transaction-modal" class="modal fixed inset-0 z-50 bg-black bg-opacity-50 flex items-center justify-center p-4 invisible opacity-0">
        <div class="modal-content bg-white dark:bg-gray-800 rounded-lg shadow-xl w-full max-w-lg transform scale-95">
            <div class="flex justify-between items-center p-5 border-b border-gray-200 dark:border-gray-700"><h3 class="text-xl font-semibold text-gray-900 dark:text-white">Adicionar Nova Transação</h3><button id="close-modal-btn" type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-600 dark:hover:text-white"><svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg></button></div>
            <form id="transaction-form" class="p-6 space-y-4">
                <div><label for="nome" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Nome</label><input type="text" name="nome" id="nome" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-emerald-500 focus:border-emerald-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500" placeholder="Ex: Salário, Aluguel" required></div>
                <div><label for="descricao" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Descrição</label><input type="text" name="descricao" id="descricao" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-emerald-500 focus:border-emerald-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500" placeholder="Pagamento referente a..."></div>
                <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                    <div><label for="valor" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Valor (R$)</label><input type="number" name="valor" id="valor" step="0.01" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-emerald-500 focus:border-emerald-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500" placeholder="1500.50" required></div>
                    <div><label for="tipo" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Tipo</label><select id="tipo" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-emerald-500 focus:border-emerald-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500"><option value="entrada" selected>Entrada</option><option value="saida">Saída</option></select></div>
                </div>
                <div><label for="data" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Data</label><input type="date" name="data" id="data" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-emerald-500 focus:border-emerald-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500" required></div>
                <button type="submit" class="w-full text-white bg-emerald-600 hover:bg-emerald-700 focus:ring-4 focus:outline-none focus:ring-emerald-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center">Salvar Transação</button>
            </form>
        </div>
    </div>
    <%@include file="Footer.jsp" %>
</body>
</html>
