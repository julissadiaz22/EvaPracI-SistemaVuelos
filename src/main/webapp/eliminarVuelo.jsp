<%@ page import="java.util.ArrayList" %>
<%@ page import="clases.Vuelos" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    String idVuelo = request.getParameter("idVuelo");

    if (idVuelo != null && !idVuelo.isEmpty()) {
        ArrayList<Vuelos> vueloList = (ArrayList<Vuelos>) session.getAttribute("vueloList");

        if (vueloList != null) {
            boolean vueloEliminado = false;

            for (int i = 0; i < vueloList.size(); i++) {
                Vuelos vuelo = vueloList.get(i);
                if (vuelo.getNumeroVuelo().equals(idVuelo)) {
                    vueloList.remove(i);
                    vueloEliminado = true;
                    break;
                }
            }

            if (vueloEliminado) {
                session.setAttribute("vueloList", vueloList);
                out.println("<script>alert('Vuelo eliminado exitosamente.'); window.location.href='reporteVuelos.jsp';</script>");
            } else {
                out.println("<script>alert('No se encontró el vuelo.'); window.location.href='reporteVuelos.jsp';</script>");
            }
        } else {
            out.println("<script>alert('No hay vuelos registrados.'); window.location.href='reporteVuelos.jsp';</script>");
        }
    } else {
        out.println("<script>alert('ID de vuelo no válido.'); window.location.href='reporteVuelos.jsp';</script>");
    }
%>
