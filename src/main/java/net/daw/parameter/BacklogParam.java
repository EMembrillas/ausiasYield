/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.daw.parameter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import net.daw.bean.BacklogBean;

/**
 *
 * @author rafa
 */
public class BacklogParam {

    private final HttpServletRequest request;

    public BacklogParam(HttpServletRequest request) throws Exception {
        this.request = request;
    }

    public BacklogBean loadId(BacklogBean oBacklog) throws ServletException {
        try {
            if (request.getParameter("id") != null) {
                oBacklog.setId(Integer.parseInt(request.getParameter("id")));
            } else {
                oBacklog.setId(0);
            }
        } catch (NumberFormatException e) {
            throw new ServletException("Controller: Error: loadId: Formato de datos en parámetros incorrecto " + e.getMessage());
        }
        return oBacklog;

    }

    public BacklogBean load(BacklogBean oBacklog) throws NumberFormatException, ParseException {
        try {
            if ((request.getParameter("id_usuario") != null)) {
                oBacklog.getUsuario().setId(Integer.parseInt(request.getParameter("id_usuario")));
            }
           /* if ((request.getParameter("id_producto") != null)) {
                oBacklog.getProducto().setId(Integer.parseInt(request.getParameter("id_producto")));
            }
            if ((request.getParameter("cantidad") != null)) {
                oBacklog.setCantidad(Integer.parseInt(request.getParameter("cantidad")));
            }
            if ((request.getParameter("fecha") != null)) {
                oBacklog.setFecha(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("fecha")));
            }*/
        } catch (NumberFormatException e) {
            throw new NumberFormatException("CompraParam: Error: load: Formato de datos en parámetros incorrecto " + e.getMessage());
        }
        return oBacklog;
    }
}
