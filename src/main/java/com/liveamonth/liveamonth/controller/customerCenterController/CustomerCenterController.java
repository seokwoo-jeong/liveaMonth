package com.liveamonth.liveamonth.controller.customerCenterController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import static com.liveamonth.liveamonth.constants.ControllerPathConstants.ECustomerCenterPath;
import static com.liveamonth.liveamonth.constants.ControllerPathConstants.ETemplatePath.CUSTOMER_CENTER;
import static com.liveamonth.liveamonth.constants.LogicConstants.ECustomerCenterAttributes.CUSTOMER_CENTER_MENUS;

@Controller
public class CustomerCenterController {
    @RequestMapping(value = "/customerCenter")
    public String customerCenter(Model model){
        model.addAttribute(CUSTOMER_CENTER_MENUS.getText(),ECustomerCenterPath.values());
        return CUSTOMER_CENTER.getPath();
    }

    @RequestMapping("selectedCustomerCenterMenu")
    public String selectedCustomerCenterMenu(Model model,@RequestParam("menu") String menuName){
        String path = null;
        for(ECustomerCenterPath menu:ECustomerCenterPath.values()){
            if(menu.getText().equals(menuName)) path = menu.getPath();
        }
        model.addAttribute(CUSTOMER_CENTER_MENUS.getText(),ECustomerCenterPath.values());
        return path;
    }
}
