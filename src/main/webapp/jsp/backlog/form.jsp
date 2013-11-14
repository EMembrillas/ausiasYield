<%@page import="net.daw.helper.Contexto"%>
<%@page import="net.daw.bean.BacklogBean"%>
<% Contexto oContexto = (Contexto) request.getAttribute("contexto");
    String strTitulo = "";
    String strControlEnabled = "";
    String strValueBoton = "Enviar";

    Integer id = 0;
    String codigo = "";
    String descripcion = "";
    String precio = "";
    String id_tipoproducto = "";
    String descTipoproducto = "";

    BacklogBean oBacklogBean = (BacklogBean) oContexto.getParametro();
    id = oBacklogBean.getId();
    codigo = oBacklogBean.getCodigo();
    descripcion = oBacklogBean.getDescripcion();
    precio = Double.toString(oBacklogBean.getPrecio());
    id_tipoproducto = Integer.toString(oProductoBean.getTipoProducto().getId());
    if (oProductoBean.getTipoProducto().getId() > 0) {
        descTipoproducto = oProductoBean.getTipoProducto().getDescripcion();
    }
    if (oContexto.getMetodo().equals("view")) {
        strTitulo = "Vista";
        strControlEnabled = "disabled=\"true\"";
        strValueBoton = "Cerrar";
    }
    if (oContexto.getMetodo().equals("update")) {
        strTitulo = "Edici�n";
        strValueBoton = "Modificar";
    }
    if (oContexto.getMetodo().equals("new")) {
        strTitulo = "Alta";
        strValueBoton = "Crear";
    }
%>
<h1><%=strTitulo%> de producto</h1>
<form class="form-horizontal" action="Controller" method="post" id="productoForm">
    <legend>Formulario de producto</legend>
    <fieldset>
        <input type="hidden" name="id" value="<%=id%>" /> 
        <input type="hidden" name="class" value="producto" /> 
        <input type="hidden" name="method" value="<%=oContexto.getMetodo()%>" /> 
        <input type="hidden" name="phase" value="2" />
        <div class="control-group">
            <label class="control-label" for="codigo">C�digo: </label>
            <div class="controls">
                <input <%=strControlEnabled%>  id="codigo" name="codigo"
                                               type="text" size="30" maxlength="50" autofocus="autofocus"
                                               value="<%=codigo%>" />
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" for="descripcion">Descripci�n: </label> 
            <div class="controls">
                <input <%=strControlEnabled%>  id="descripcion"
                                               name="descripcion" type="text" size="30" maxlength="50"
                                               value="<%=descripcion%>" />
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" for="precio">Precio: </label> 
            <div class="controls">
                <input <%=strControlEnabled%>  id="precio"
                                               name="precio" type="text" size="30" maxlength="50"
                                               value="<%=precio%>" /> 
            </div>
        </div>           
        <div class="control-group">
            <label class="control-label" for="id_tipoproducto">Tipo de producto: </label> 
            <div class="controls">                
                <input readonly="true" id="id_tipoproducto" class="input-mini"
                       name="id_tipoproducto" type="text" size="5" maxlength="5"
                       value="<%=id_tipoproducto%>" />  
                <input <%=strControlEnabled%> type="submit" name="searchingfor" value="tipoproducto" />

                <span class="alert alert-success"><%=descTipoproducto%></span>
            </div>
        </div>             
        <div class="control-group">
            <div class="controls">
                <input type="submit" name="enviar" value="<%=strValueBoton%>" />
            </div>
        </div>
    </fieldset>
</form>
