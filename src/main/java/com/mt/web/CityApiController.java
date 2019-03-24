package com.mt.web;

import com.mt.dto.NormalResponse;
import com.mt.entity.City;
import com.mt.service.CityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@ResponseBody
@RequestMapping(value = "/city_api", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
public class CityApiController {

    @Autowired
    private CityService cityService;

    @RequestMapping("/get_all")
    private NormalResponse<List<City>> getAllCity() {
        NormalResponse<List<City>> response = new NormalResponse<>();
        response.setData(cityService.getAll());
        return response;
    }
}
