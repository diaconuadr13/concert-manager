<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Stiluri Muzicale</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <div id="add" class="container mt-5">
            <h1>Adauga stil muzical</h1>
            <form action="StiluriMuzicaleController" method="GET">
                <div class="form-group">
                    <label for="numestil">Nume Stil:</label>
                    <input type="text" class="form-control" name="numestil">
                </div>
                <div class="form-group">
                    <label for="originestil">Origine Stil:</label>
                    <input type="text" class="form-control" name="originestil">
                </div>
                <div class="form-group">
                    <label for="perioadapopularitate">Perioada Popularitate:</label>
                    <input type="text" class="form-control" name="perioadapopularitate">
                </div>
                <button type="submit" class="btn btn-primary" name="adaugaStilurimuzicale">Adauga</button>
            </form>
        </div>

        <form action="StiluriMuzicaleController" method="POST" class="container mt-3">
            <button type="submit" class="btn btn-secondary" name="afiseazaStilurimuzicale">Afiseaza</button>
        </form>
        <br>
        <div class="container mt-3">
            <a href="index.html" class="btn btn-link"><b>Home</b></a>
        </div>
    </body>
</html>