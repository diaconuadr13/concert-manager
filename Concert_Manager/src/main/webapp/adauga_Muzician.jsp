<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Muzicieni</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <div id="add" class="container mt-5">
            <h1>Adauga muzician</h1>
            <form action="MuzicieniController" method="GET">
                <div class="form-group">
                    <label for="nume">Nume Muzician:</label>
                    <input type="text" class="form-control" name="nume">
                </div>
                <div class="form-group">
                    <label for="prenume">Prenume Muzician:</label>
                    <input type="text" class="form-control" name="prenume">
                </div>
                <div class="form-group">
                    <label for="datanasterii">Data Nasterii:</label>
                    <input type="date" class="form-control" name="datanasterii">
                </div>
                <div class="form-group">
                    <label for="taraorigine">Tara Origine:</label>
                    <input type="text" class="form-control" name="taraorigine">
                </div>
                <div class="form-group">
                    <label for="instrumentprincipal">Instrument Principal:</label>
                    <input type="text" class="form-control" name="instrumentprincipal">
                </div>
                <button type="submit" class="btn btn-primary" name="adaugaMuzicieni">Adauga</button>
            </form>
        </div>

        <form action="MuzicieniController" method="POST" class="container mt-3">
            <button type="submit" class="btn btn-secondary" name="afiseazaMuzicieni">Afiseaza</button>
        </form>
        <br>
        <div class="container mt-3">
            <a href="index.html" class="btn btn-link"><b>Home</b></a>
        </div>
    </body>
</html>