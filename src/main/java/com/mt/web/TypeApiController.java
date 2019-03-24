package com.mt.web;

import com.mt.dto.NormalResponse;
import com.mt.entity.Type;
import com.mt.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@ResponseBody
@RequestMapping(value = "/type_api", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
@Controller
public class TypeApiController {
    @Autowired
    private TypeService typeService;

    @RequestMapping("/get_all")
    private NormalResponse<List<Type>> getAllType() {
        NormalResponse<List<Type>> response = new NormalResponse<>();
        response.setData(typeService.getAllType());
        return response;
    }


}
