package com.mt.web;

import com.mt.dto.NormalResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.ArrayList;
import java.util.UUID;

@Controller
@ResponseBody
@RequestMapping(value = "/upload_api", method = {RequestMethod.GET, RequestMethod.POST}, produces = "application/json;charset=utf-8")
public class UploadApiController {

    private ArrayList<String> allowImage = null;

    public UploadApiController() {
        allowImage = new ArrayList<>();
        allowImage.add("image/jpeg");
        allowImage.add("image/png");
    }

    @RequestMapping("/image")
    private NormalResponse<String> uploadImage(@RequestParam("image") CommonsMultipartFile file, HttpServletRequest request) {
        NormalResponse<String> response = new NormalResponse<>();
        try {
            if (file.isEmpty()) {
                response.setInfo("文件为空请重试");
            } else if (!allowImage.contains(file.getContentType())) {
                response.setInfo("当前文件类型不支持上传");
            } else {
                String path = request.getServletContext().getRealPath("/assets/images/upload");
                String []tmpArr = file.getOriginalFilename().split("\\.");
                if (tmpArr.length < 2) {
                    response.setInfo("文件名无法识别");
                } else {
                    String ext = tmpArr[tmpArr.length - 1];
                    String newName = UUID.randomUUID().toString() + "." + ext;
                    path += "/" + newName;
                    File f = new File(path);
                    file.transferTo(f);
                    response.setData("/assets/images/upload/" + newName);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.setInfo(e.getMessage());
        }
        return response;
    }
}
