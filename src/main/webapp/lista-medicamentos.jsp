<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Medicamentos</title>
</head>
<body>
    <h1>Medicamentos Cadastrados</h1>
    <table>
        <tr>
            <th>Nome Comercial</th>
            <th>Fabricante</th>
        </tr>
        <c:forEach items="${medicamentos}" var="med">
            <tr>
                <td>${med.nomeComercial}</td>
                <td>${med.fabricante}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>