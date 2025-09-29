<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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
<header class="bg-white dark:bg-gray-800 shadow-sm sticky top-0 z-40">
    <nav class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between items-center h-16">
            <div class="flex items-center space-x-8">
                <a href="home" class="flex-shrink-0 flex items-center space-x-2">
                    <svg class="h-8 w-auto text-emerald-600 dark:text-emerald-400" xmlns="http://www.w3.org/2000/svg"
                        fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round"
                            d="M2.25 18.75a60.07 60.07 0 0 1 15.797 2.101c.727.198 1.453-.342 1.453-1.096V18.75M3.75 4.5v.75A.75.75 0 0 1 3 6h-.75m0 0v-.375c0-.621.504-1.125 1.125-1.125H20.25M2.25 6v9m18-10.5v.75c0 .414-.336.75-.75.75h-.75m0-1.5h.375c.621 0 1.125.504 1.125 1.125v9.75c0 .621-.504 1.125-1.125 1.125h-.375m1.5-1.5H21a.75.75 0 0 0-.75.75v.75m0 0H3.75m0 0h-.375a1.125 1.125 0 0 1-1.125-1.125V15m1.5 1.5v-.75A.75.75 0 0 0 3 15h-.75M15 10.5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm3 0h.008v.008H18V10.5Zm-12 0h.008v.008H6V10.5Z" />
                    </svg>
                    <span class="text-xl font-bold text-gray-800 dark:text-white">FiscalFinance</span>
                </a>
                <div class="hidden md:flex space-x-6">
                    <a href="home" 
                        class="nav-link text-gray-800 dark:text-white hover:text-gray-600 font-bold">Início</a>
                    <a href="transactions?action=listing"
                        class="nav-link text-gray-800 dark:text-white hover:text-gray-600 font-bold">Transações</a>
                    <a href="deposits?action=listing"
                        class="nav-link text-gray-800 dark:text-white hover:text-gray-600 font-bold">Investimentos</a>
                </div>
            </div>
            <div class="flex items-center">
                <div class="relative ml-4">
                    <button id="user-menu-button"
                        class="flex text-sm bg-gray-800 rounded-full focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-800 dark:focus:ring-offset-gray-900 focus:ring-white">
                        <a href="login" class="nav-link text-red-400 dark:text-red-400 font-bold">Sair</a>
                    </button>
                    <div id="user-menu-dropdown"
                        class="dropdown-menu origin-top-right absolute right-0 mt-2 w-48 rounded-md shadow-lg py-1 bg-white dark:bg-gray-700 ring-1 ring-black ring-opacity-5 hidden opacity-0 transform scale-95">
                        <a href="#"
                            class="block px-4 py-2 text-sm text-gray-700 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-600">Seu
                            Perfil</a>
                        <a href="login"
                            class="block px-4 py-2 text-sm text-gray-700 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-600">Sair</a>
                    </div>
                </div>
                <!-- Botão Hamburger (Mobile) -->
                <div class="md:hidden ml-3">
                    <button id="mobile-menu-button"
                        class="inline-flex items-center justify-center p-2 rounded-md text-gray-400 hover:text-white hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-white">
                        <svg class="h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                            stroke="currentColor" aria-hidden="true">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="M4 6h16M4 12h16m-7 6h7" />
                        </svg>
                    </button>
                </div>
            </div>
        </div>
        <!-- Menu Mobile -->
        <div class="md:hidden hidden" id="mobile-menu">
            <div class="px-2 pt-2 pb-3 space-y-1 sm:px-3">
                <a href="./index.jsp" class="nav-link text-white dark:text-white font-bold block">Início</a>
                <a href="transactions?action=listing"
                    class="nav-link text-white dark:text-white font-bold block">Transações</a>
                <a href="deposits?action=listing"
                    class="nav-link text-white dark:text-white font-bold block">Investimentos</a>
            </div>
        </div>
    </nav>
</header>