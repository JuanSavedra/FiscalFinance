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
<body>
    <div class="modal fixed inset-0 z-50 bg-black bg-opacity-50 flex items-center justify-center p-4">
        <div class="modal-content bg-white dark:bg-gray-800 rounded-lg shadow-xl w-full max-w-lg transform scale-95">
            <div class="flex justify-between items-center p-5 border-b border-gray-200 dark:border-gray-700">
                <h3 class="text-xl font-semibold text-gray-900 dark:text-white">Editar Transação</h3>
                <button id="close-modal-btn" type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-600 dark:hover:text-white">
                    <a href="transactions?action=listing">
                        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                        </svg>
                    </a>
                </button>
            </div>
            <form id="transaction-edit-form" method="post" action="transactions?action=edit" class="p-6 space-y-4">
                <input name="Id" type="hidden" value="${transaction.id}"/>
                <div>
                    <label 
                        for="Nome"
                        class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Nome
                    </label>
                    <input
                        type="text" 
                        name="Nome" 
                        id="Nome"
                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-emerald-500 focus:border-emerald-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500"
                        value="${transaction.name}"
                        placeholder="Ex: Salário, Aluguel" 
                        required
                    />
                </div>
                <div>
                    <label 
                        for="Descrição"
                        class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Descrição
                    </label>
                    <input
                        type="text" 
                        name="Descrição" 
                        id="Descrição"
                        value="${transaction.description}"
                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-emerald-500 focus:border-emerald-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500"
                        placeholder="Pagamento referente a..."
                    />
                </div>
                <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                    <div>
                        <label 
                            for="Valor" 
                            class="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
                        >
                            Valor (R$)
                        </label>
                        <input 
                            type="number" 
                            name="Valor" 
                            id="Valor" 
                            step="0.01" 
                            class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-emerald-500 focus:border-emerald-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500" 
                            value="${transaction.value}"
                            placeholder="1500.50" 
                            required 
                        />
                    </div>
                    <div>
                        <label 
                            for="Tipo"
                            class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Tipo
                        </label>
                        <fieldset
                            class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-emerald-500 focus:border-emerald-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500"
                        >
                            <c:if test="${transaction.type == 'Entrada'}">
                                <input id="Tipo" name="Tipo" value="Entrada" type="radio" checked class="p-1">
                            </c:if>
                            <c:if test="${transaction.type == 'Saída'}">
                                <input id="Tipo" name="Tipo" value="Entrada" type="radio" class="p-1">
                            </c:if>
                            <c:if test="${transaction.type == 'Entrada'}">
                                <input id="Tipo" name="Tipo" value="Saída" type="radio" class="p-1">
                            </c:if>
                            <c:if test="${transaction.type == 'Saída'}">
                                <input id="Tipo" name="Tipo" value="Saída" type="radio" checked class="p-1">
                            </c:if>
                        </fieldset>
                    </div>
                </div>
                <input 
                    type="submit"
                    value="Editar Transação"
                    class="w-full text-white bg-emerald-600 hover:bg-emerald-700 focus:ring-4 focus:outline-none focus:ring-emerald-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center"
                >
                </input>
            </form>
        </div>
    </div>
</body>
</html>