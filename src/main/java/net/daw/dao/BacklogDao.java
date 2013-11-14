/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.daw.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import net.daw.bean.BacklogBean;
import net.daw.bean.UsuarioBean;
import net.daw.data.Mysql;
import net.daw.helper.FilterBean;
import net.daw.helper.Enum;

/**
 *
 * @author al037602
 */
public class BacklogDao {

    private final Mysql oMysql;
    private final Enum.Connection enumTipoConexion;
    SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");

    public BacklogDao(Enum.Connection tipoConexion) throws Exception {

        oMysql = new Mysql();
        enumTipoConexion = tipoConexion;
    }

    public int getPages(int intRegsPerPag, ArrayList<FilterBean> alFilter, HashMap<String, String> hmOrder) throws Exception {
        int pages;
        try {
            oMysql.conexion(enumTipoConexion);
            pages = oMysql.getPages("backlog", intRegsPerPag, alFilter, hmOrder);
            oMysql.desconexion();
            return pages;
        } catch (Exception e) {
            throw new Exception("BacklogDao.getPages: Error: " + e.getMessage());
        } finally {
            oMysql.desconexion();
        }
    }

    public int getCount(ArrayList<FilterBean> hmFilter) throws Exception {
        int pages;
        try {
            oMysql.conexion(enumTipoConexion);
            pages = oMysql.getCount("backlog", hmFilter);
            oMysql.desconexion();
            return pages;
        } catch (Exception e) {
            throw new Exception("BacklogDao.getCount: Error: " + e.getMessage());
        }
    }

    public ArrayList<BacklogBean> getPage(int intRegsPerPag, int intPage, ArrayList<FilterBean> alFilter, HashMap<String, String> hmOrder) throws Exception {
        ArrayList<Integer> arrId;
        ArrayList<BacklogBean> arrBacklog = new ArrayList<>();
        try {
            oMysql.conexion(enumTipoConexion);
            arrId = oMysql.getPage("backlog", intRegsPerPag, intPage, alFilter, hmOrder);
            Iterator<Integer> iterador = arrId.listIterator();
            while (iterador.hasNext()) {
                BacklogBean oBacklogBean = new BacklogBean(iterador.next());
                arrBacklog.add(this.get(oBacklogBean));
            }
            oMysql.desconexion();
            return arrBacklog;
        } catch (Exception e) {
            throw new Exception("BacklogDao.getPage: Error: " + e.getMessage());
        } finally {
            oMysql.desconexion();
        }
    }

    public ArrayList<String> getNeighborhood(String strLink, int intPageNumber, int intTotalPages, int intNeighborhood) throws Exception {
        oMysql.conexion(enumTipoConexion);
        ArrayList<String> n = oMysql.getNeighborhood(strLink, intPageNumber, intTotalPages, intNeighborhood);
        oMysql.desconexion();
        return n;
    }

    public BacklogBean get(BacklogBean oBacklogBean) throws Exception {
        if (oBacklogBean.getId() > 0) {
            try {
                oMysql.conexion(enumTipoConexion);

                if (!oMysql.existsOne("backlog", oBacklogBean.getId())) {
                    oBacklogBean.setId(0);
                } else {
                    oBacklogBean.setId(Integer.parseInt(oMysql.getOne("backlog", "id", oBacklogBean.getId())));
                    oBacklogBean.setId_requerimiento(Integer.parseInt(oMysql.getOne("backlog", "id_requerimiento", oBacklogBean.getId())));

                    oBacklogBean.setEnunciado(oMysql.getOne("backlog", "enunciado", oBacklogBean.getId()));
                    oBacklogBean.setDescripciondetallada(oMysql.getOne("backlog", "descripciondetallado", oBacklogBean.getId()));

                    oBacklogBean.setFechainicioprevista(dateFormat.parse(oMysql.getOne("backlog", "fechainicioprevista", oBacklogBean.getId())));
                    oBacklogBean.setFechafinprevista(dateFormat.parse(oMysql.getOne("backlog", "fechafinprevista", oBacklogBean.getId())));
                    oBacklogBean.setFechainicio(dateFormat.parse(oMysql.getOne("backlog", "fechainicio", oBacklogBean.getId())));
                    oBacklogBean.setFechafin(dateFormat.parse(oMysql.getOne("backlog", "fechafin", oBacklogBean.getId())));

                    //oBacklogBean.setId_usuario(Integer.parseInt(oMysql.getOne("backlog", "id_usuario", oBacklogBean.getId())));
                    oBacklogBean.setHorasduracionprevista(Integer.parseInt(oMysql.getOne("backlog", "horasduracionprevista", oBacklogBean.getId())));
                    oBacklogBean.setPorcentajecompletado(Integer.parseInt(oMysql.getOne("backlog", "porcentajecompletado", oBacklogBean.getId())));

                    oBacklogBean.setFechaalta(dateFormat.parse(oMysql.getOne("backlog", "fechaalta", oBacklogBean.getId())));

                    oBacklogBean.setSprint(Integer.parseInt(oMysql.getOne("backlog", "sprint", oBacklogBean.getId())));
                    oBacklogBean.setRelease(Integer.parseInt(oMysql.getOne("backlog", "releasetabla", oBacklogBean.getId())));

                    /*String intId_producto = oMysql.getOne("producto", "id_tipoproducto", oBacklogBean.getId());
                    
                     if (intId_producto != null) {
                     oBacklogBean.getTipoProducto().setId(Integer.parseInt(intId_producto));
                        
                     TipoproductoDao oTipoproductoDao = new TipoproductoDao(enumTipoConexion);
                     oProductoBean.setTipoProducto(oTipoproductoDao.get(oBacklogBean.getTipoProducto()));
                     }*/
                    UsuarioBean oUsuarioBean = new UsuarioBean();
                    oUsuarioBean.setId(Integer.parseInt(oMysql.getOne("backlog", "id_usuario", oBacklogBean.getId())));
                    UsuarioDao oUsuarioDao = new UsuarioDao(enumTipoConexion);
                    oUsuarioBean = oUsuarioDao.get(oUsuarioBean);
                    oBacklogBean.setUsuario(oUsuarioBean);

                }
            } catch (Exception e) {
                throw new Exception("BacklogDao.get: Error: " + e.getMessage());
            } finally {
                oMysql.desconexion();
            }
        } else {
            oBacklogBean.setId(0);
        }
        return oBacklogBean;
    }

    public void set(BacklogBean oBacklogBean) throws Exception {
        try {
            oMysql.conexion(enumTipoConexion);
            oMysql.initTrans();
            if (oBacklogBean.getId() == 0) {
                oBacklogBean.setId(oMysql.insertOne("backlog"));
            }

            oMysql.updateOne(oBacklogBean.getId(), "backlog", "id", Integer.toString(oBacklogBean.getId()));

            oMysql.updateOne(oBacklogBean.getId(), "backlog", "enunciado", oBacklogBean.getEnunciado());
            oMysql.updateOne(oBacklogBean.getId(), "backlog", "descripciondetallado", oBacklogBean.getDescripciondetallada());

            oMysql.updateOne(oBacklogBean.getId(), "backlog", "id_requerimiento", Integer.toString(oBacklogBean.getId_requerimiento()));

//            oMysql.updateOne(oBacklogBean.getId(), "backlog", "fechainicioprevista", oBacklogBean.getFechainicioprevista().toString());
//            oMysql.updateOne(oBacklogBean.getId(), "backlog", "fechafinprevista", oBacklogBean.getFechafinprevista().toString());
//            oMysql.updateOne(oBacklogBean.getId(), "backlog", "fechainicio", oBacklogBean.getFechainicio().toString());
//            oMysql.updateOne(oBacklogBean.getId(), "backlog", "fechafin", oBacklogBean.getFechafin().toString());
            oMysql.updateOne(oBacklogBean.getId(), "backlog", "id_usuario", Integer.toString(oBacklogBean.getUsuario().getId()));
            oMysql.updateOne(oBacklogBean.getId(), "backlog", "horasduracionprevista", Integer.toString(oBacklogBean.getHorasduracionprevista()));
            oMysql.updateOne(oBacklogBean.getId(), "backlog", "porcentajecompletado", Integer.toString(oBacklogBean.getPorcentajecompletado()));

//            oMysql.updateOne(oBacklogBean.getId(), "backlog", "fechaalta", oBacklogBean.getFechaalta().toString());
            oMysql.updateOne(oBacklogBean.getId(), "backlog", "sprint", Integer.toString(oBacklogBean.getSprint()));
            oMysql.updateOne(oBacklogBean.getId(), "backlog", "releasetabla", Integer.toString(oBacklogBean.getRelease()));

            /*Integer id_Tipoproducto = oProductoBean.getTipoProducto().getId();
             if (id_Tipoproducto > 0) {
             oMysql.updateOne(oProductoBean.getId(), "producto", "id_tipoproducto", id_Tipoproducto.toString());
             } else {
             oMysql.setNull(oProductoBean.getId(), "producto", "id_tipoproducto");
             }*/
            oMysql.commitTrans();
        } catch (Exception e) {
            oMysql.rollbackTrans();
            throw new Exception("BacklogDao.set: Error: " + e.getMessage());
        } finally {
            oMysql.desconexion();
        }
    }

    public void remove(BacklogBean oBacklogBean) throws Exception {
        try {
            oMysql.conexion(enumTipoConexion);
            oMysql.removeOne(oBacklogBean.getId(), "backlog");
            oMysql.desconexion();
        } catch (Exception e) {
            throw new Exception("BacklogDao.remove: Error: " + e.getMessage());
        } finally {
            oMysql.desconexion();
        }

    }

}
