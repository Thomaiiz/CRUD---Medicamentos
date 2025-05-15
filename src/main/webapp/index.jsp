<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>FarmControl</title>
    <link rel="stylesheet" href="style.css">
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #1db954, #1abc9c);
            color: white;
        }
        header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            background: white;
            color: #1db954;
            padding: 1rem 2rem;
        }
        .logo {
            font-weight: bold;
            font-size: 1.5rem;
            display: flex;
            align-items: center;
        }
        .logo::before {
            content: "💊";
            margin-right: 0.5rem;
        }
        nav a {
            margin: 0 15px;
            color: black;
            text-decoration: none;
        }
        nav a:hover {
            text-decoration: underline;
        }
        .hero {
            text-align: center;
            padding: 100px 20px;
        }
        .hero h1 {
            font-size: 2.5rem;
            font-weight: bold;
        }
        .hero p {
            font-size: 1.1rem;
            margin: 20px 0;
        }
        .search-box {
            margin-top: 20px;
        }
        .search-box input {
            padding: 10px;
            width: 300px;
            border-radius: 5px;
            border: none;
        }
        .buttons {
            margin-top: 20px;
        }
        .buttons button {
            margin: 10px;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background: white;
            color: #1db954;
            cursor: pointer;
            font-weight: bold;
        }
        .destaque {
            background: #f9f9f9;
            color: black;
            text-align: center;
            padding: 40px 20px;
        }
        .destaque h2 {
            font-size: 1.8rem;
        }
        .ver-todos {
            margin-top: 10px;
        }
        .ver-todos a {
            text-decoration: none;
            padding: 10px 15px;
            border: 2px solid #1db954;
            color: #1db954;
            border-radius: 5px;
        }
        
        .login {
        	text-decoration: none;
        }
        
    </style>
</head>
<body>
    <header>
        <div class="logo">FarmControl</div>
        <nav>
            <a href="#">Home</a>
            <a href="#">Medicamentos</a>
            <a href="#">Sobre o Sistema</a>
            <a href="#">Contato</a>
        </nav>
        <div>
            🔍 <a class="login" href="login.jsp" style="background:#1db954; color:white; border:none; padding:5px 10px; border-radius:5px;">Entrar</a>
        </div>
    </header>

    <div class="hero">
        <h1>FarmControl: Sua Saúde, Nosso Cuidado</h1>
        <p>Encontre os melhores medicamentos, promoções imperdíveis e lançamentos exclusivos. Qualidade e confiança para o seu bem-estar.</p>
        <div class="search-box">
            <input type="text" placeholder="O que você procura hoje?">
        </div>
        <div class="buttons">
            <button>⚡ Ver Lançamentos</button>
            <button>Promoções</button>
        </div>
    </div>

    <div class="destaque">
        <h2>Medicamentos em Destaque</h2>
        <p>Conheça nossos produtos mais vendidos</p>
        <div class="ver-todos">
            <a href="#">Ver todos →
