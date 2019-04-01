package com.mt.web.admin;

import com.mt.dto.NormalResponse;
import com.mt.entity.Type;
import com.mt.exception.CustomException;
import com.mt.service.TypeService;
import com.mt.utils.ParamUtils;
import org.apache.ibatis.mapping.ParameterMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.sql.ParameterMetaData;
import java.util.List;
import java.util.Map;

@Controller
@ResponseBody
@RequestMapping(value = "/admin/type_api", method = {RequestMethod.POST, RequestMethod.GET}, produces = "application/json;charset=utf-8")
public class AdminTypeApiController {
    @Autowired
    private TypeService typeService;

    @RequestMapping("/get_mainType")
    private NormalResponse<List<Type>> getMainType() {
        NormalResponse<List<Type>> response = new NormalResponse<>();
        response.setData(typeService.getAllMainType());
        return response;
    }

    @RequestMapping("/get_subType")
    private NormalResponse<List<Type>> getSubType(@RequestParam Map<String, Object> param) {
        NormalResponse<List<Type>> response = new NormalResponse<>();
        ParamUtils p = new ParamUtils(param);
        String mainType = p.getString("mainType");
        response.setData(typeService.getSubType(mainType));
        return response;
    }

    @RequestMapping("/del_by_id")
    private NormalResponse<String> delType(@RequestParam Map<String, Object> param) throws CustomException {
        NormalResponse<String> response = new NormalResponse<>();
        ParamUtils p = new ParamUtils(param);
        int id = p.getInteger("id");
        if (!typeService.delType(id)) {
            response.setInfo("");
        }
        return response;
    }

    @RequestMapping("/del_all")
    private NormalResponse<String> delMainType(@RequestParam Map<String, Object> param) throws CustomException {
        NormalResponse<String> response = new NormalResponse<>();
        ParamUtils p = new ParamUtils(param);
        String mainType = p.getString("mainType");
        if (!typeService.delMainType(mainType)) {
            response.setInfo("");
        }
        return response;
    }

    @RequestMapping("/add")
    private NormalResponse<String> addType(@RequestParam Map<String, Object> param) throws CustomException{
        NormalResponse<String> response = new NormalResponse<>();
        ParamUtils p = new ParamUtils(param);
        Type t = p.parseJson("json_str", Type.class);
        if (!typeService.addType(t)) {
            response.setInfo("");
        }
        return response;
    }

    @RequestMapping("/modify")
    private NormalResponse<String> updateType(@RequestParam Map<String, Object> param) throws CustomException{
        NormalResponse<String> response = new NormalResponse<>();
        ParamUtils p = new ParamUtils(param);
        Type t = p.parseJson("json_str", Type.class);
        if (!typeService.updateType(t)) {
            response.setInfo("");
        }
        return response;
    }

}
