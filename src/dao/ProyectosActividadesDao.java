package dao;

import model.ProyectosActividades;

import java.util.List;
import java.util.Map;

public interface ProyectosActividadesDao {

    int save(ProyectosActividades pa) throws Exception;

    int update(ProyectosActividades pa) throws Exception;

    int delete(short id) throws Exception;

    int getNumRecords(String value, String project) throws Exception;

    /*
    * [key] -- [value]
    * field
    * value
    * order
    * limit
    * offset
    * project
    * */
    List<Map<String, String>> find(Map<String, String> params, boolean filter) throws Exception;
}
