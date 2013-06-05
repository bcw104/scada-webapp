/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ht.scada.data.service.testimpl;

import com.ht.scada.data.service.UrlService;
import org.springframework.stereotype.Service;

/**
 *
 * @author admin
 */
@Service
public class UrlServiceImpl implements UrlService{

    @Override
    public String getSvgViewUrl(String code) {
        return "/static/img/djgyt22.jpg";
    }
    
}
