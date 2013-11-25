<%@page import="net.daw.helper.Contexto"%>
<% Contexto oContexto = (Contexto) request.getAttribute("contexto"); %>
<%
    String menu = "<div class=\"accordion\" id=\"leftMenu\">";

    menu += "<div class=\"accordion-group\">"
            + "<div class=\"accordion-heading\">"
            + "<a class=\"accordion-toggle\" data-toggle=\"collapse\" data-parent=\"#leftMenu\" href=\"#collapseOne\">"
            + "<i class=\"icon-user\"></i> Usuario</a></div>"
            + "<div id=\"collapseOne\" class=\"accordion-body collapse\" style=\"height: 0px; \">"
            + "<div class=\"accordion-inner\">"
            + "<ul>";
%>

<%
    if (oContexto.getClase().equals("usuario") && oContexto.getMetodo().equals("ocioso")) {
        menu += "<li class=\"active\">";
    } else {
        menu += "<li>";
    }

    menu += "<a href=\"Controller\">Home</a></li>";

    if (!oContexto.getHaySesion()) {
        if (oContexto.getClase().equals("usuario") && oContexto.getMetodo().equals("login")) {
            menu += "<li class=\"active\">";
        } else {
            menu += "<li>";
        }
        menu += "<a href=\"Controller?class=usuario&method=login\">Login</a></li>";
    } else {
        if (oContexto.getClase().equals("usuario") && oContexto.getMetodo().equals("list")) {
            menu += "<li class=\"active\">";
        } else {
            menu += "<li>";
        }
        menu += "<a href=\"Controller?class=usuario&method=list\">Listar</a></li>";
        if (oContexto.getClase().equals("usuario") && oContexto.getMetodo().equals("logout")) {
            menu += "<li class=\"active\">";
        } else {
            menu += "<li>";
        }
        menu += "<a href=\"Controller?class=usuario&method=logout\">Logout</a></li>";
    }
    menu += "</ul></div></div></div>";
%>
<%     menu += "<div class=\"accordion-group\">"
            + "<div class=\"accordion-heading\">"
            + "<a class=\"accordion-toggle\" data-toggle=\"collapse\" data-parent=\"#leftMenu\" href=\"#collapseTwo\">"
            + "<i class=\"icon-user\"></i> Alumno</a></div>"
            + "<div id=\"collapseTwo\" class=\"accordion-body collapse\" style=\"height: 0px; \">"
            + "<div class=\"accordion-inner\">"
            + "<ul>";

    if (oContexto.getClase().equals("alumno") && oContexto.getMetodo().equals("new")) {
        menu += "<li class=\"active\">";
    } else {
        menu += "<li>";
    }
    menu += "<a href=\"Controller?class=alumno&method=new\">Crear</a></li>";
    if (oContexto.getClase().equals("alumno") && oContexto.getMetodo().equals("list")) {
        menu += "<li class=\"active\">";
    } else {
        menu += "<li>";
    }
    menu += "<a href=\"Controller?class=alumno&method=list\">Listar</a></li>";
    menu += "</ul></div></div></div>";

    menu += "<div class=\"accordion-group\">"
            + "<div class=\"accordion-heading\">"
            + "<a class=\"accordion-toggle\" data-toggle=\"collapse\" data-parent=\"#leftMenu\" href=\"#collapseThree\">"
            + "<i class=\"icon-user\"></i> Profesor</a></div>"
            + "<div id=\"collapseThree\" class=\"accordion-body collapse\" style=\"height: 0px; \">"
            + "<div class=\"accordion-inner\">"
            + "<ul>";

    if (oContexto.getClase().equals("profesor") && oContexto.getMetodo().equals("new")) {
        menu += "<li class=\"active\">";
    } else {
        menu += "<li>";
    }
    menu += "<a href=\"Controller?class=profesor&method=new\">Crear</a></li>";
    if (oContexto.getClase().equals("profesor") && oContexto.getMetodo().equals("list")) {
        menu += "<li class=\"active\">";
    } else {
        menu += "<li>";
    }
    menu += "<a href=\"Controller?class=profesor&method=list\">Listar</a></li>";
    menu += "</ul></div></div></div>";
    menu += "<div class=\"accordion-group\">"
            + "<div class=\"accordion-heading\">"
            + "<a class=\"accordion-toggle\" data-toggle=\"collapse\" data-parent=\"#leftMenu\" href=\"#collapseFour\">"
            + "<i class=\"icon-user\"></i> Empresa</a></div>"
            + "<div id=\"collapseFour\" class=\"accordion-body collapse\" style=\"height: 0px; \">"
            + "<div class=\"accordion-inner\">"
            + "<ul>";

    if (oContexto.getClase().equals("empresa") && oContexto.getMetodo().equals("new")) {
        menu += "<li class=\"active\">";
    } else {
        menu += "<li>";
    }
    menu += "<a href=\"Controller?class=empresa&method=new\">Crear</a></li>";
    if (oContexto.getClase().equals("empresa") && oContexto.getMetodo().equals("list")) {
        menu += "<li class=\"active\">";
    } else {
        menu += "<li>";
    }
    menu += "<a href=\"Controller?class=empresa&method=list\">Listar</a></li>";
    menu += "</ul></div></div></div>";
    menu += "<div class=\"accordion-group\">"
            + "<div class=\"accordion-heading\">"
            + "<a class=\"accordion-toggle\" data-toggle=\"collapse\" data-parent=\"#leftMenu\" href=\"#collapseFive\">"
            + "<i class=\"icon-tags\"></i> Entrada</a></div>"
            + "<div id=\"collapseFive\" class=\"accordion-body collapse\" style=\"height: 0px; \">"
            + "<div class=\"accordion-inner\">"
            + "<ul>";
    if (oContexto.getClase().equals("entrada") && oContexto.getMetodo().equals("new")) {
        menu += "<li class=\"active\">";
    } else {
        menu += "<li>";
    }
    menu += "<a href=\"Controller?class=entrada&method=new\">Crear</a></li>";
    if (oContexto.getClase().equals("entrada") && oContexto.getMetodo().equals("list")) {
        menu += "<li class=\"active\">";
    } else {
        menu += "<li>";
    }
    menu += "<a href=\"Controller?class=entrada&method=list\">Listar</a></li>";
    menu += "</ul></div></div></div>";
    menu += "<div class=\"accordion-group\">"
            + "<div class=\"accordion-heading\">"
            + "<a class=\"accordion-toggle\" data-toggle=\"collapse\" data-parent=\"#leftMenu\" href=\"#collapseSix\">"
            + "<i class=\"icon-signal\"></i> Hilo</a></div>"
            + "<div id=\"collapseSix\" class=\"accordion-body collapse\" style=\"height: 0px; \">"
            + "<div class=\"accordion-inner\">"
            + "<ul>";

    if (oContexto.getClase().equals("hilo") && oContexto.getMetodo().equals("new")) {
        menu += "<li class=\"active\">";
    } else {
        menu += "<li>";
    }
    menu += "<a href=\"Controller?class=hilo&method=new\">Crear</a></li>";
    if (oContexto.getClase().equals("hilo") && oContexto.getMetodo().equals("list")) {
        menu += "<li class=\"active\">";
    } else {
        menu += "<li>";
    }
    menu += "<a href=\"Controller?class=hilo&method=list\">Listar</a></li>";
    menu += "</ul></div></div></div>";
    menu += "<div class=\"accordion-group\">"
            + "<div class=\"accordion-heading\">"
            + "<a class=\"accordion-toggle\" data-toggle=\"collapse\" data-parent=\"#leftMenu\" href=\"#collapseSeven\">"
            + "<i class=\"icon-lock\"></i> Backlog</a></div>"
            + "<div id=\"collapseSeven\" class=\"accordion-body collapse\" style=\"height: 0px; \">"
            + "<div class=\"accordion-inner\">"
            + "<ul>";

    if (oContexto.getClase().equals("backlog") && oContexto.getMetodo().equals("new")) {
        menu += "<li class=\"active\">";
    } else {
        menu += "<li>";
    }
    menu += "<a href=\"Controller?class=backlog&method=new\">Crear</a></li>";
    if (oContexto.getClase().equals("backlog") && oContexto.getMetodo().equals("list")) {
        menu += "<li class=\"active\">";
    } else {
        menu += "<li>";
    }
    menu += "<a href=\"Controller?class=backlog&method=list\">Listar</a></li>";
    menu += "</ul></div></div></div>";
    menu += "<div class=\"accordion-group\">"
            + "<div class=\"accordion-heading\">"
            + "<a class=\"accordion-toggle\" data-toggle=\"collapse\" data-parent=\"#leftMenu\" href=\"#collapseEight\">"
            + "<i class=\"icon-flag\"></i> Actividad Offline</a></div>"
            + "<div id=\"collapseEight\" class=\"accordion-body collapse\" style=\"height: 0px; \">"
            + "<div class=\"accordion-inner\">"
            + "<ul>";

    if (oContexto.getClase().equals("actividadoffline") && oContexto.getMetodo().equals("new")) {
        menu += "<li class=\"active\">";
    } else {
        menu += "<li>";
    }
    menu += "<a href=\"Controller?class=actividadoffline&method=new\">Crear</a></li>";
    if (oContexto.getClase().equals("actividadoffline") && oContexto.getMetodo().equals("list")) {
        menu += "<li class=\"active\">";
    } else {
        menu += "<li>";
    }

    menu += "<a href=\"Controller?class=actividadoffline&method=list\">Listar</a></li>";

     menu += "</ul></div></div></div>";

    menu += "</ul></div>";
%>
<%=menu%>
