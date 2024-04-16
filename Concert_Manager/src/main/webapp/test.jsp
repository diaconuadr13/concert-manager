<%-- 
    Document   : adauga_Pacient
    Created on : Nov 22, 2016, 6:19:27 PM
    Author     : vali
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
        <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
        <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">
        <title>Pacienti</title>
    </head>
    <body>
        <div class="section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h2 contenteditable="true" class="text-justify">Adaugati un nou pacient</h2>
                    </div>
                </div>
            </div>
        </div>
        <div class="section">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <form role="form" action="PacientiController" method="GET">
                            <div class="form-group">
                                <label class="control-label">Nume</label>
                                <input class="form-control" name="nume" placeholder="Introduceti Numele" type="text">
                            </div>
                            <div class="form-group">
                                <label class="control-label">Prenume</label>
                                <input class="form-control" name="prenume" placeholder="Introduceti Prenumele" type="text">
                            </div>
                            <div class="form-group">
                                <label class="control-label">Adresa</label>
                                <input class="form-control" name="adresa" placeholder="Introduceti Adresa" type="text">
                            </div>
                            <input type="submit" class="btn btn-default"  name="adaugaPacient" value="Adauga">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="section">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <form role="form" action="PacientiController" method="POST">
                            <div class="form-group">
                                <label class="control-label">Vizualizati datele din tabela Pacienti</label><br>
                                <input type="submit" class="btn btn-default" name="afiseazaPacienti" value="Afiseaza">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
